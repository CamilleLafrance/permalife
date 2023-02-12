//
//  CreateMyGarden.swift
//  PermaLife
//
//  Created by apprenant77 on 31/01/2023.
//


import SwiftUI

struct CreateMyGarden: View {
    
    @EnvironmentObject var viewModel : EnvironmentDataUser

    @State var isSelectedHigh : Bool = false
    @State var isSelectedLow : Bool = false
    @State var vegeGarden = vegetables
    @State var dialog = false
    
    let textCreateMyGarden = "Commencez par sélectionner les variétés qui vous plaisent, jusqu'à 8. N'hésitez pas à consulter l'ensemble de nos articles présents dans la boutique. Lors de la réception de votre pot PermaLife, remplissez le fond du bac avec de l'eau jusqu'au trait, semez vos graines et arrosez-les. Il est maintenant temps de passer à la partie entretien, renseignez vos actions dans l'agenda et surveillez l'état de santé de votre jardin !"
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("Wallpaper")
                    .resizable()
                    .ignoresSafeArea()
                VStack{
                    HStack{
                        Text("Créez votre potager")
                            .font(.system(size:(25)))
                            .bold()
                        Image(systemName: "questionmark.circle")
                            .accentColor(Color("Charcoal"))
                            .onTapGesture {
                                self.dialog.toggle()
                            }
                            .sheet(isPresented: $dialog) {
                                ZStack {
                                    Color("OrangeYellowCrayola")
                                        .cornerRadius(10)
                                    VStack {
                                        Text("Comment ça marche?")
                                            .font(.system(size:(25)))
                                            .bold()
                                            .padding()
                                        
                                        Text(textCreateMyGarden)
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal, 20)
                                    }
                                    .presentationDetents([.height(400)])
                                }
                        }
                        .cornerRadius(20)
                        .backgroundStyle(.yellow)
                    }
                    .padding(.leading, -120)
                    .padding(.top, 10)
                    
                    Image("Kit")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250 , height: 250)
                    
                    VStack {
                        HStack(spacing: 1) {
                            ForEach(Array(zip(vegeGarden.indices, vegeGarden.prefix(4))), id: \.0) { index, product in
                                ExtractedProduct(product: product)
                                    .frame(width: 95,height: 115)
                                    .onLongPressGesture(minimumDuration: 1) {
                                        isSelectedHigh = true
                                        vegeGarden[index].isSelected = isSelectedHigh
                                        print(vegeGarden[index].isSelected)
                                    }
                                    .background(vegeGarden[index].isSelected ? Color("OrangeYellowCrayola") : .clear)
                                    .cornerRadius(5)
                            }
                        }
                        HStack(spacing: 1) {
                            ForEach(Array(zip(vegeGarden.indices, vegeGarden.suffix(4))), id: \.0) { index, product in
                                ExtractedProduct(product: product)
                                    .frame(width: 95, height: 115)
                                    .onLongPressGesture(minimumDuration: 1) {
                                        isSelectedLow = true
                                        vegeGarden[index].isSelectedLow = isSelectedLow
                                        print(vegeGarden[index].isSelectedLow)
                                    }
                                    .background(vegeGarden[index].isSelectedLow ? Color("OrangeYellowCrayola") : .clear)
                                    .cornerRadius(5)
                            }
                            
                        }
                        .padding(.bottom, 30)
                        NavigationLink(destination: MyOrder()) {
                            Text("Valider")
                        }
                        .buttonStyle(PlainButtonStyle())
                        .foregroundColor(Color.black)
                        .frame(width: 170.0, height: 40)
                        .background(Color("YellowGreen"))
                        .cornerRadius(10)
                        .bold()
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        if viewModel.isRegistered == false {
                            NavigationLink(destination: SignUp()) {
                                Image(systemName: "person.crop.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 44, height: 44)
                                    .padding(.trailing, 20.0)
                                    .accentColor(Color("Charcoal"))
                            }
                        } else {
                            NavigationLink(destination: MyAccount()) {
                                Image(systemName: "person.crop.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 44, height: 44)
                                    .padding(.trailing, 20.0)
                                    .accentColor(Color("Charcoal"))
                                
                            }
                        }
                    }
                }
                .padding(.bottom , 40)
            }
        }
    }
}

struct CreateMyGarden_Previews: PreviewProvider {
   static var previews: some View {
       CreateMyGarden().environmentObject(EnvironmentDataUser())
    }
}
