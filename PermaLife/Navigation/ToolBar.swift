//
//  TabBar.swift
//  PermaLife
//
//  Created by apprenant77 on 31/01/2023.
//

import SwiftUI

struct ToolBar: View {
    
    @EnvironmentObject var viewModel : EnvironmentDataUser
//    @Binding var lastName: String
//    @Binding var firstName: String
//    @Binding var birthday: String
//    @Binding var phone: String
//    @Binding var email: String
//    @Binding var address: String
//    @Binding var addressCode: String
//    @Binding var city: String
//    @Binding var animals: Bool
//    @Binding var pickerExposition: String
//    @Binding var pickerExperience: String
//    @Binding var isRegistered : Bool
    
    var body: some View {
        NavigationView {
            Text("")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        if viewModel.isRegistered == false {
                            NavigationLink(destination: SignUp()) {
                                Image(systemName: "person.crop.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(Circle())
                                    .frame(width: 44, height: 44)
                                    .padding(.trailing, 20.0)
                                    .accentColor(Color("Charcoal"))
                            }
                        } else {
                            NavigationLink(destination: MyAccount()) {
                                Image(systemName: "person.crop.circle")
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

struct ToolBar_Previews: PreviewProvider {
    static var previews: some View {
        ToolBar().environmentObject(EnvironmentDataUser())
    }
}

