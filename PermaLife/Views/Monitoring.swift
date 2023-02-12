//
//  Monitoring.swift
//  PermaLife
//
//  Created by apprenant77 on 31/01/2023.
//

import SwiftUI

struct Event {
    var title: String
    var date: Date
}

struct Monitoring: View {
    
    @EnvironmentObject var viewModel : EnvironmentDataUser
    
    @State var selection: String = "Suivi"
    let filterOptions: [String] = ["Suivi", "Mes actions", "Agenda"]
    
    @State private var date = Date()
    @State private var dates: Set<DateComponents> = []
    @State var searchText = ""
    @State var events: [Event] = []
    @State private var eventTitle: String = ""
    @State private var selecDate: Date = Date()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color("YellowGreen"))
        
        let attributes: [NSAttributedString.Key:Any] = [            .foregroundColor : UIColor.black        ]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }
    
    var body: some View {
        VStack {
            NavigationView {
                ZStack {
                    Image("Wallpaper")
                        .resizable()
                        .ignoresSafeArea()
                    
                    VStack {
                        HStack {
                            Text("Suivi de vos cultures")
                                .font(.title)
                                .bold()
                        }
                        .padding(.leading, -90.0)
                        HStack {
                            Picker(
                                selection: $selection,
                                label: Text("Votre choix"),
                                content: {
                                    ForEach(filterOptions.indices) { index in
                                        Text(filterOptions[index])
                                            .tag(filterOptions[index])
                                    }
                                })
                            .pickerStyle(SegmentedPickerStyle())
                            .padding(.vertical)
                        }
                        
                        Spacer()
                        
                        if selection == "Suivi" {
                            Image("pot")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 325 , height: 325)
                            
                            Divider()
                                .padding()
                            
                            Text("Météo du jour")
                                .font(.title2)
                            
                            HStack {
                                Image(systemName: "cloud.drizzle.fill")
                                Text("Nuageux")
                                
                                Image(systemName: "")
                                Text("Pression : 1024 hPa")
                            }
                            
                            VStack {
                                HStack {
                                    Image(systemName: "thermometer.medium")
                                    Text(" 22° C")
                                    
                                    Image(systemName: "drop")
                                    Text("Humidité : 65%")
                                }
                                .padding(.bottom, 2)
                                HStack {
                                    Image(systemName: "leaf")
                                    Text("Bon état de santé de votre jardin")
                                }
                            }.padding(.bottom, -35)
                        }
                        
                        else if selection == "Agenda" {
                            MultiDatePicker(selection: $dates, label: {
                                Text("Dates Available")
                            })
                            .fixedSize()
                            .tint(Color("YellowGreen"))
                            .padding()
                        }
                        
                        else {
                            VStack {
                                TextField("Décrire la nouvelle action", text: $eventTitle)
                                    .padding()
                                    .padding(.horizontal, 10)
                                    .textFieldStyle(.roundedBorder)
                                DatePicker("Date", selection: $selecDate, displayedComponents: .date)
                                    .datePickerStyle(.compact)
                                    .padding(.horizontal, 27)
                                
                                Button(action: {
                                    self.events.append(Event(title: self.eventTitle, date: self.selecDate))
                                }, label: {Text("Ajouter")})
                                .foregroundColor(Color.black)
                                .frame(width: 170.0, height: 40)
                                .background(Color("OrangeYellowCrayola"))
                                .cornerRadius(10)
                                .padding()
                                .padding(.leading, -180)
                                ScrollView {
                                    VStack(alignment: .leading) {
                                        ForEach(events.filter({ (event) -> Bool in
                                            searchText.isEmpty ? true : event.title.contains(searchText)
                                        }), id: \.title)
                                        { event in
                                            Text("\(self.dateFormatter.string(from: event.date)) - \(event.title)")
                                                .padding(.bottom, 5)
                                        }
                                    }.padding()
                                }
                                .frame(width: 380, height: 200)
                                .padding()
                                
                            }
//                            .searchable(text: $searchText, prompt: "Rechercher")
                        }
                        Spacer()
                    }.padding(.bottom , 80)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        if viewModel.isRegistered == false {
                            NavigationLink(destination: SignUp()) {
                                Image("LeoPierre")
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(Circle())
                                    .frame(width: 44, height: 44)
                                    .padding(.trailing, 20.0)
                                    .accentColor(Color("Charcoal"))
                            }
                        } else {
                            NavigationLink(destination: MyAccount()) {
                                Image("LeoPierre")
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(Circle())
                                    .frame(width: 44, height: 44)
                                    .padding(.trailing, 20.0)
                                    .accentColor(Color("Charcoal"))
                            }
                        }
                        
                    }
                }
            }
        }
    }
}

struct Monitoring_Previews: PreviewProvider {
    static var previews: some View {
        Monitoring().environmentObject(EnvironmentDataUser())
    }
}
