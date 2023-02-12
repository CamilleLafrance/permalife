//
//  HomePage.swift
//  PermaLife
//
//  Created by apprenant77 on 31/01/2023.
//

import SwiftUI

struct HomePage: View {
    
    @EnvironmentObject var viewModel : EnvironmentDataUser
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("Wallpaper")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    VStack {
                        Image("Logo")
                            .padding(.top, 80.0)
                            .frame(width: 250, height: 250)
                        Text("PermaLife")
                            .font(.system(size:(50)))
                    }
                    
                    VStack {
                        NavigationLink(destination:TabBarGarden()) {
                            Text("Créer mon potager")
                        }
                        .buttonStyle(PlainButtonStyle())
                        .foregroundColor(Color.black)
                        .bold()
                        .frame(width: 170.0, height: 40)
                        .background(Color("YellowGreen"))
                        .cornerRadius(10)
                        
                        NavigationLink(destination: TabBarStorePage()) {
                            Text("Boutique")
                        }
                        .buttonStyle(PlainButtonStyle())
                        .foregroundColor(Color.white)
                        .frame(width: 170.0, height: 40)
                        .background(Color("Charcoal"))
                        .cornerRadius(10)
                        
                        NavigationLink(destination: TabBarMonitoring()) {
                            Text("Monitoring")
                        }
                        .buttonStyle(PlainButtonStyle())
                        .foregroundColor(Color.white)
                        .frame(width: 170.0, height: 40)
                        .background(Color("Charcoal"))
                        .cornerRadius(10)
                    }
                    
                    HStack {
                        NavigationLink(destination: SignUp()) {
                            Text("Inscription")
                        }
                        .buttonStyle(PlainButtonStyle())
                        .foregroundColor(Color.white)
                        .frame(width: 170.0, height: 40)
                        .background(Color("Charcoal"))
                        .cornerRadius(10)
                        
                        NavigationLink(destination: SignIn()) {
                            Text("Connexion")
                        }
                        .buttonStyle(PlainButtonStyle())
                        .foregroundColor(Color.black)
                        .frame(width: 170.0, height: 40)
                        .background(Color("YellowGreen"))
                        .cornerRadius(10)
                    }
                    .padding(.top, 100.0)
                }
            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage().environmentObject(EnvironmentDataUser())
    }
}
