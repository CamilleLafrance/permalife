//
//  MyAccount.swift
//  PermaLife
//
//  Created by Romain Bracchi on 03/02/2023.
//

import SwiftUI

struct MyAccount: View {

    @EnvironmentObject var viewModel : EnvironmentDataUser
    
    var body: some View {
            ZStack {
                Image("Wallpaper")
                    .resizable()
                    .ignoresSafeArea()
                
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(Color("YellowGreen"))
                    .frame(width: 320, height: 85)
                    .padding(.top, -265.0)
                
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(Color("YellowGreen"))
                    .frame(width: 320, height: 85)
                    .padding(.top, -140.0)
                
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(Color("YellowGreen"))
                    .frame(width: 320, height: 85)
                    .padding(.top, 50)
                
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(Color("YellowGreen"))
                    .frame(width: 320, height: 120)
                    .padding(.top, 345)

                VStack {
                    HStack {
                        Text("Mon compte")
                            .bold()
                            .padding(.vertical, 30.0)
                            .font(.system(size: 25))
                    }
                    .padding(.top, -20.0)
                    
                    HStack {
                        Image("LeoPierre")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width:60, height: 60)
                            .accentColor(Color("Charcoal"))
                            .padding(.trailing, 20.0)
                        VStack(alignment: .leading) {
                            Text("\(viewModel.firstName) \(viewModel.lastName)")
                                .padding(.bottom, 5.0)
                                .bold()
                            Text("\(viewModel.email)")
                        }
                    }
                    
                    VStack {
                        HStack {
                            Text("Informations personnelles")
                                .bold()
                                .padding(.vertical, 15.0)
                        }

                        VStack(alignment: .leading) {
                            HStack {
                                Text("Né.e le ")
                                    .bold()
                                Text("\(viewModel.birthday)")
                            }
                            .padding(.bottom, 5.0)
                            
                            HStack {
                                Text("Tel.")
                                    .bold()
                                Text("\(viewModel.phone)")
                            }
                            .padding(.bottom, 5.0)
                        }
                        .padding(.leading, -60.0)
                    }
                    
                    VStack {
                        HStack {
                            Text("Adresse postale")
                                .bold()
                                .padding(.vertical, 15.0)
                        }
                        VStack(alignment: .leading) {
                            Text("\(viewModel.address)")
                                .padding(.bottom, 5.0)
                            Text("\(viewModel.addressCode) \(viewModel.city)")
                                .padding(.bottom, 5.0)
                        }
                        .padding(.leading, -30.0)
                    }
                    
                    VStack {
                        HStack {
                            Text("Environnement")
                                .bold()
                                .padding(.vertical, 15.0)
                        }
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Exposition :")
                                    .bold()
                                Text("\(viewModel.pickerExposition)")
                                    
                            }
                            .padding(.bottom, 5.0)
                            
                            HStack {
                                Text("Compagnon :")
                                    .bold()
                                if viewModel.animals == false {
                                    Text("Non")
                                } else {
                                    Text("Oui")
                                }
                            }
                            .padding(.bottom, 5.0)
                            
                            HStack {
                                Text("Expérience :")
                                    .bold()
                                Text("\(viewModel.pickerExperience)")
                            }
                            .padding(.bottom, 5.0)
                        }
                        .padding(.leading, -30.0)
                    }
                }
                .padding(.top, -115.0)
            }
    }
}

struct MyAccount_Previews: PreviewProvider {
//    static var dataUserMyAccount = EnvironmentDataUser()
    
    static var previews: some View {
        MyAccount().environmentObject(EnvironmentDataUser())
    }
}
