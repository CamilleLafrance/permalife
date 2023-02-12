//
//  StorePage.swift
//  PermaLife
//
//  Created by apprenant77 on 31/01/2023.
//

import SwiftUI

struct StorePage: View {
    
    @EnvironmentObject var viewModel : EnvironmentDataUser

    var body: some View {
        NavigationView {
            ZStack {
                Image("Wallpaper")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    Text("Boutique")
                        .font(.system(size: 25))
                        .bold()
                    ZStack(alignment: .center) {
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: 350, height: 100)
                            .cornerRadius(10)
                            .padding(.vertical, 5.0)
                        Text(textStore)
                            .font(.system(size: 15))
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Accessoires")
                            .padding(.leading)
                            .font(.system(size: 18))
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 10) {
                                ForEach(accessories, id: \.id) { product in
                                    NavigationLink(destination: StoreDetail(product: product)) {
                                        ExtractedProduct(product: product)
                                            .foregroundColor(Color("Charcoal"))
                                    }
                                }
                            }
                            .padding(.bottom)
                        }
                        .padding(.top, -60.0)
                        .frame(width: 380, height: 200)
                        
                        VStack (alignment: .leading) {
                            Text("Graines")
                                .padding(.leading)
                            
                            ScrollView(.horizontal) {
                                HStack(spacing: 10) {
                                    ForEach(vegetables, id: \.id) { product in
                                        NavigationLink(destination: StoreDetail(product: product)) {
                                            ExtractedProduct(product: product)
                                                .foregroundColor(Color("Charcoal"))
                                        }
                                    }
                                }
                                .padding(.bottom)
                            }
                            .padding(.top, -60.0)
                            .frame(width: 380, height: 200)
                        }
                        .padding(.top, -50.0)
                        
                    }
                    .padding(.horizontal)
                    
                    NavigationLink(destination: MyOrder()) {Text("Panier")}
                            .buttonStyle(PlainButtonStyle())
                            .foregroundColor(Color.white)
                            .bold()
                            .frame(width: 170.0, height: 40)
                            .background(Color("Charcoal"))
                            .cornerRadius(10)
                            .padding(.top, -30)
                    
                }
                .padding(.bottom, 50.0)
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
}

struct ExtractedProduct: View {
    var product: Products
    var body: some View {
        VStack {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
            Text(product.name)
                .font(.system(size: 12))
        }
    }
}

struct StorePage_Previews: PreviewProvider {
    static var previews: some View {
        StorePage().environmentObject(EnvironmentDataUser())
    }
}
