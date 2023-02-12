//
//  StoreDetail.swift
//  PermaLife
//
//  Created by apprenant77 on 31/01/2023.
//

import SwiftUI

struct StoreDetail: View {
    
    @EnvironmentObject var viewModel : EnvironmentDataUser
    
    @State private var quantity = 1
    var product: Products
    
    var body: some View {
        ZStack {
            Image("Wallpaper")
                .resizable()
                .ignoresSafeArea()
            VStack {
                HStack {
                    Text(product.name)
                        .font(.title)
                        .bold()
                        .padding(.top, -60.0)
                }
                .padding(.leading, -150.0)
                
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.top, -30.0)
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 320, height: 100)
                        .cornerRadius(10)
                    Text(product.description)
                        .font(.system(size: 13))
                }
                .padding()
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 350, height: 100)
                        .cornerRadius(10)
                        .padding()
                    HStack(spacing: 50) {
                        VStack (alignment: .leading) {
                            Text("Quantité : \(quantity)")
                        }
                        Stepper("Entrez la quantité", value: $quantity, in: 1...15)
                            .frame(width: 100, height: 100)
                        Text("\(product.price*quantity)€")
                    }
                }
                
                Button(action: {}, label: {Text("Ajouter au panier")})
                    .foregroundColor(Color.black)
                    .frame(width: 170.0, height: 40)
                    .background(Color("YellowGreen"))
                    .cornerRadius(10)
            }
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

struct StoreDetail_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetail(product: Products(name: "Tomates", image: "Tomatoes", description: textTomatoes, price: 2)).environmentObject(EnvironmentDataUser())
    }
}
