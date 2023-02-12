//
//  ConfirmPayment.swift
//  PermaLife
//
//  Created by Apprenant 67 on 01/02/2023.
//

import SwiftUI

struct ConfirmPayment: View {
    
    @EnvironmentObject var viewModel : EnvironmentDataUser
    
    @Environment(\.dismiss) var dismiss
    @Binding var paymentDone: Bool
    
    // Communications
    @State private var shouldSendNewsletter = true
    
    let textConfirm = """
Vous recevrez votre commande dans les plus
brefs délais. Vous allez recevoir un mail de
confirmation avec le suivi de votre colis. Nous
sommes ravis de vous accueillir parmi notre
communauté. A très bientôt !
"""
    
    var body: some View {
        ZStack {
            Image("Gardener")
                .padding(.top, -450.0)
                .ignoresSafeArea()
            VStack {
                Image("Wallpaper")
                    .resizable()
                    .clipShape(Capsule())
                    .frame(width: 600, height: 750)
            }
            .padding(.bottom, -500.0)

            VStack {
                Text("Merci pour votre achat")
                    .font(.largeTitle).foregroundColor(Color("Charcoal")).bold()
                    .padding(.top, 300.0)
                 
                VStack {
                    Text("Information de livraison")
                        .foregroundColor(Color("Charcoal")).bold().underline()
                        .padding()
                    
                    Text(textConfirm)
                        .foregroundColor(Color("Charcoal"))
                        .multilineTextAlignment(.center)
                        .padding()
                         
                    Button("OK") {
                        dismiss()
                        paymentDone.toggle()
                    }
                    
                    .foregroundColor(Color.white)
                    .frame(width: 170, height: 40)
                    .background(Color("Charcoal"))
                    .cornerRadius(10)
                    
                    Toggle("Abonnement à notre newsletter", isOn: $shouldSendNewsletter)
                        .padding()
                        .padding(.horizontal, 130.0)
                        .toggleStyle(.switch)
                        .tint(Color("YellowGreen"))
                }
            }
        }.ignoresSafeArea()
    }
}

struct ConfirmPayment_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmPayment(paymentDone: .constant(false)).environmentObject(EnvironmentDataUser())
    }
}
