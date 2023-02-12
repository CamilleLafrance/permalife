//
//  SignUp.swift
//  PermaLife
//
//  Created by Manu on 01/02/2023.


import SwiftUI

struct SignIn: View {
    
    @EnvironmentObject var viewModel : EnvironmentDataUser
    
    var body: some View {
        ZStack {
            VStack {
                Text("Mon compte")
                    .font(.largeTitle)
                    .foregroundColor(Color("Charcoal"))
                    .bold()
                    .padding(.top, 80)
                    .padding(.bottom, 40)
                
                ZStack {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .foregroundColor(Color("Charcoal"))
                        .padding(.bottom, 50)
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    TextField("Email", text: self.$viewModel.email)
                        .padding()
                        .cornerRadius(20.0)
                        .textFieldStyle(.roundedBorder)
                        .disableAutocorrection(true)
                    
                    SecureField("Mot de passe", text: self.$viewModel.password)
                        .padding()
                        .cornerRadius(20.0)
                        .padding([.bottom], 30)
                        .textFieldStyle(.roundedBorder)
                    
                }
                .padding([.leading, .trailing], 27.5)
                
                if ((viewModel.email.contains("@") && viewModel.email.count > 4) && viewModel.password.count > 5) {
                    NavigationLink(destination: MyAccount()) {
                        Text("Connexion")
                    }
                    .foregroundColor(Color.black)
                    .frame(width: 170, height: 40)
                    .background(Color("YellowGreen"))
                    .cornerRadius(10)
                } else {
                    Button(action: {}) {
                        Text("Connexion")
                            .foregroundColor(Color.white)
                            .frame(width: 170, height: 40)
                            .background(Color("Charcoal"))
                            .cornerRadius(10)
                    }
                }
                Spacer()
                Text("---    PermaLife    ---")
                    .padding()
            }
            .background(Image("Wallpaper")
                .resizable()
                .ignoresSafeArea())
        }
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn().environmentObject(EnvironmentDataUser())
    }
}
