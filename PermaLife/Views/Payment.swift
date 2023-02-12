//
//  Payment.swift
//  PermaLife
//
//  Created by apprenant77 on 31/01/2023.
//

import SwiftUI

struct Payment: View {
    
    @EnvironmentObject var viewModel : EnvironmentDataUser
    
    @State private var paymentOk = false
    @State private var numberCard = ""
    @State private var dateCard = ""
    @State private var cvvCard = ""
    @State private var nameCard = ""
    @State private var isStorePage = false
    
    var body: some View {
        ZStack {
            Image("Wallpaper")
                .resizable()
                .ignoresSafeArea()

            VStack {
                VStack{
                    HStack {
                        Text("Paiement")
                            .font(.system(size:(25)))
                            .padding(.leading, -170)
                            .bold()
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 50)
                    HStack {
                        Text("Carte bancaire")
                        Image(systemName: "creditcard.fill")
                    }
                    .padding(30)
                        
                    VStack {
                        TextField("Numéro de Carte", text: $numberCard)
                            .textFieldStyle(.roundedBorder)
                            
                        HStack {
                            TextField("Expire le", text: $dateCard)
                                .textFieldStyle(.roundedBorder)
                            TextField("CVV", text: $cvvCard)
                                .textFieldStyle(.roundedBorder)
                        }
                        TextField("Nom Prénom", text: $nameCard)
                            .textFieldStyle(.roundedBorder)
                    }
                }
                .padding(.horizontal, 20.0)
            
                VStack {
                    NavigationLink(destination: StorePage(), isActive: $isStorePage) {
                        EmptyView()
                    }
                }
                .padding(.top, 50.0)
                 
                Button("Valider le paiement") {
                    paymentOk.toggle()
                }
                .foregroundColor(Color.white)
                .frame(width: 170, height: 40)
                .background(Color("Charcoal"))
                .cornerRadius(10)
                .sheet(isPresented: $paymentOk) {
                    ConfirmPayment( paymentDone: $isStorePage)
                }
            
                HStack {
                    Image("ModePayment")
                        .resizable()
                        .frame(width: 300, height: 120)
                }
                .padding(.top, 30.0)
            }
            .padding(.top, -200.0)
        }
    }
}
 
struct Payment_Previews: PreviewProvider {
    static var previews: some View {
        Payment().environmentObject(EnvironmentDataUser())
    }
}
