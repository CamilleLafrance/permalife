//
//  MyOrder.swift
//  PermaLife
//
//  Created by apprenant77 on 31/01/2023.
//

import SwiftUI

struct MyOrder: View {
    
    @EnvironmentObject var viewModel : EnvironmentDataUser
    
    @State private var myOrderGroup = [
        Products(name: "Arrosoir", image: "WateringCan", description: textWateringCan, price: 15),
        Products(name: "Kit permaculture", image: "Kit", description: textKit, price: 100),
        Products(name: "Transplantoir", image: "Trowel", description: textTrowel, price: 15),
        Products(name: "Oignons", image: "SpringOnions", description: textSpringOnions, price: 3),
        Products(name: "Tomates", image: "Tomatoes", description: textTomatoes, price: 3),
        Products(name: "Céleri", image: "Celery", description: textCelery, price: 3),
        Products(name: "Poivrons", image: "Peppers", description: textPeppers, price: 3),
    ]

    var body: some View {
        ZStack {
            Image("Wallpaper")
                .resizable()
                .ignoresSafeArea()
            VStack {
                HStack {
                    Text("Ma commande")
                        .font(.system(size: 25))
                        .bold()
                }
                .padding(.leading, -170.0)
                
                VStack {
                    List {
                        ForEach(myOrderGroup, id: \.id) { item in
                                HStack {
                                    Image(item.image)
                                        .resizable()
                                        .frame(width: 44, height: 44)
                                    Text(item.name)
                                        .padding(.leading)
                                    Spacer()
                                    Text("\(item.price)€")
                                }
                        }
                        .onMove(perform: move)
                        .onDelete(perform: delete)
                        .listRowBackground(Image(""))
                    }
                    .listStyle(.plain)
                }
                
                HStack (spacing: 20) {
                    EditButton()
                        .foregroundColor(Color(.white))
                        .frame(width: 170.0, height: 40)
                        .background(Color("Charcoal"))
                        .cornerRadius(10)
                    NavigationLink(destination: Payment()) {
                        Text("Payer")
                        Text(String(myOrderGroup.map{$0.price}.reduce(0, +)))
                        Text("€")
                    }
                            .buttonStyle(PlainButtonStyle())
                            .foregroundColor(Color.black)
                            .bold()
                            .frame(width: 170.0, height: 40)
                            .background(Color("OrangeYellowCrayola"))
                            .cornerRadius(10)
                }
                .padding(.top, -100)
            }
            .padding(.top, 15)
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
    
    private func move(from source: IndexSet, to destination: Int) {
        myOrderGroup.move(fromOffsets: source, toOffset: destination)
    }

    private func delete(at offsets: IndexSet) {
        myOrderGroup.remove(atOffsets: offsets)
    }
}
             
struct MyOrder_Previews: PreviewProvider {
    static var previews: some View {
        MyOrder().environmentObject(EnvironmentDataUser())
    }
}
