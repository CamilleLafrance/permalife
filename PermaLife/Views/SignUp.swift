//
//  SignUp.swift
//  PermaLife
//
//  Created by Manu on 01/02/2023.


import SwiftUI

class EnvironmentDataUser : ObservableObject {
    
//    @Published var lastName: String = ""
//    @Published var firstName: String = ""
//    @Published var birthday: String = ""
//    @Published var email: String = ""
//    @Published var password: String = ""
//    @Published var passwordToCheck: String = ""
//    @Published var phone: String = ""
//    @Published var address: String = ""
//    @Published var addressCode: String = ""
//    @Published var city: String = ""
//    @Published var pickerExposition: String = ""
//    @Published var animals: Bool = false
//    @Published var pickerExperience: String  = ""
//    @Published var isRegistered : Bool = false
    
    @Published var lastName: String = "Pierre"
    @Published var firstName: String = ""
    @Published var birthday: String = "11.02.1990"
    @Published var email: String = "leo-pierre@gmail.com"
    @Published var password: String = "blabla"
    @Published var passwordToCheck: String = "blabla"
    @Published var phone: String = "0680808080"
    @Published var address: String = "11 rue Cabanis"
    @Published var addressCode: String = "75014"
    @Published var city: String = "Paris"
    @Published var pickerExposition: String = "Sud"
    @Published var animals: Bool = false
    @Published var pickerExperience: String  = "Débutant"
    @Published var isRegistered : Bool = false
    
}

struct SignUp: View {
    
    @EnvironmentObject var viewModel : EnvironmentDataUser

    // Regex birthday

    @State var dateIsValid: Bool = true
    
    let datePattern = #"^(((0[1-9]|[12][0-9]|3[01])([\.])(0[13578]|10|12)([\.])((19[0-9][0-9])|(2[0-9][0-9][0-9])))|(([0][1-9]|[12][0-9]|30)([\.])(0[469]|11)([\.])((19[0-9][0-9])|(2[0-9][0-9][0-9])))|((0[1-9]|1[0-9]|2[0-8])([\.])(02)([\.])((19[0-9][0-9])|(2[0-9][0-9][0-9])))|((29)([\.])(02)([\.])([02468][048]00))|((29)([\.])(02)([\.])([13579][26]00))|((29)([\.])(02)([\.])([0-9][0-9][0][48]))|((29)([\.])(02)([\.])([0-9][0-9][2468][048]))|((29)([\.])(02)([\.])([0-9][0-9][13579][26])))$"#
    
    // Regex email
    
    @State var emailIsValid: Bool = true
    
    let emailPattern = "^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$"

    
    var body: some View {
            ZStack {
                Image("Wallpaper")
                    .resizable()
                    .ignoresSafeArea()
                VStack (alignment: .center) {
                    Text("Créer mon compte")
                        .font(.system(size: 25))
                        .bold()
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .foregroundColor(Color("Charcoal"))
                        .padding()
                    ScrollView {
                        VStack (spacing: 1) {
                            Section(header: Text("INFORMATIONS PERSONNELLES")) {
                                TextField("Nom", text:$viewModel.lastName)
                                    .padding()
                                    .textFieldStyle(.roundedBorder)
                                    .disableAutocorrection(true)
                                TextField("Prénom", text:$viewModel.firstName)
                                    .padding()
                                    .textFieldStyle(.roundedBorder)
                                    .disableAutocorrection(true)
                                TextField("Date de naissance (00.00.0000)", text: $viewModel.birthday)
                                    .onChange(of: viewModel.birthday) { newValue in
                                        if(newValue.range(of:datePattern, options: .regularExpression) != nil) {
                                            self.dateIsValid = true
                                            print("valid")
                                        } else {
                                            self.dateIsValid = false
                                            print("invalid")
                                        }
                                    }
                                    .foregroundColor(dateIsValid ? Color.black : Color.red)
                                    .disableAutocorrection(true)
                                    .padding()
                                    .textFieldStyle(.roundedBorder)
                            }
                            
                            Section(header: Text("COORDONNÉES")) {
                                TextField("Email", text: $viewModel.email)
                                    .onChange(of: viewModel.email) { newValue in
                                        if(newValue.range(of:emailPattern, options: .regularExpression) != nil) {
                                            self.emailIsValid = true
                                            print("valid format")
                                        } else {
                                            self.emailIsValid = false
                                            print("invalid format")
                                        }
                                    }
                                    .foregroundColor(emailIsValid ? Color.black : Color.red)
                                    .disableAutocorrection(true)
                                    .padding()
                                    .textFieldStyle(.roundedBorder)
                                    .autocapitalization(.none)
                                SecureField("Mot de passe", text: $viewModel.password)
                                    .padding()
                                    .textFieldStyle(.roundedBorder)
                                SecureField("Vérifiez votre mot de passe", text: $viewModel.passwordToCheck)
                                    .padding()
                                    .textFieldStyle(.roundedBorder)
                                    .foregroundColor(viewModel.password == viewModel.passwordToCheck ? Color.black : Color.red)
                                TextField("Téléphone", text:$viewModel.phone)
                                    .padding()
                                    .textFieldStyle(.roundedBorder)
                                TextField("Adresse", text:$viewModel.address)
                                    .padding()
                                    .textFieldStyle(.roundedBorder)
                                TextField("Code postal", text:$viewModel.addressCode)
                                    .padding()
                                    .textFieldStyle(.roundedBorder)
                                TextField("Ville", text:$viewModel.city)
                                    .padding()
                                    .textFieldStyle(.roundedBorder)
                            }
                            
                            VStack {
                                Section(header: Text("ENVIRONNEMENT")) {
                                    Toggle("Animaux de compagnie", isOn: $viewModel.animals)
                                        .padding(.top, -20.0)
                                    HStack {
                                        Text("Votre exposition")
                                        Spacer()
                                        Picker(selection: $viewModel.pickerExposition, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                                            Text("Nord").tag("Nord")
                                            Text("Sud").tag("Sud")
                                            Text("Est").tag("Est")
                                            Text("Ouest").tag("Ouest")
                                        }
                                    }
                                    .padding(.top, -20.0)
                                    
                                    HStack {
                                        Text("Niveau d'expérience")
                                        Spacer()
                                        Picker(selection: $viewModel.pickerExperience, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                                            Text("Débutant").tag("Débutant")
                                            Text("Intermédiaire").tag("Intermédiaire")
                                            Text("Confirmé").tag("Confirmé")
                                        }
                                    }
                                    .padding(.top, -20.0)
                            }
                            .padding()
                            }
                        }
                    }
                    .frame(height: 300)
                    .padding()
                    
                    if (viewModel.lastName.count > 1) && (viewModel.firstName.count > 1) && !(viewModel.birthday.isEmpty) && (viewModel.email.count > 4) && (viewModel.email.contains("@")) && (viewModel.password.count > 4) && (viewModel.password == viewModel.passwordToCheck) {
                            NavigationLink(destination: MyAccount()) {Text("Valider")}
                                .buttonStyle(PlainButtonStyle())
                                .foregroundColor(Color.black)
                                .bold()
                                .frame(width: 170.0, height: 40)
                                .background(Color("YellowGreen"))
                                .cornerRadius(10)
                    } else {
                        Text("Valider")
                            .buttonStyle(PlainButtonStyle())
                            .foregroundColor(Color.gray)
                            .bold()
                            .frame(width: 170.0, height: 40)
                            .background(Color("YellowGreen"))
                            .cornerRadius(10)
                            .opacity(0.6)
                    }
                    
                }
                .padding(.top, -50)
            }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp().environmentObject(EnvironmentDataUser())
    }
}
