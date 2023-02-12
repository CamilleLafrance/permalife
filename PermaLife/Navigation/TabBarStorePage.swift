//
//  TabBarStorePage.swift
//  PermaLife
//
//  Created by apprenant77 on 07/02/2023.
//

import SwiftUI

struct TabBarStorePage: View {
    
    @EnvironmentObject var viewModel : EnvironmentDataUser
    
    var body: some View {
        TabView() {
            
            StorePage()
                .tabItem{
                    Image(systemName: "cart.fill")
                    Text("Boutique")
                }
            
            CreateMyGarden()
                .tabItem{
                    Image(systemName: "carrot.fill")
                    Text("Potager")
                }
            
            Monitoring()
                .tabItem{
                    Image(systemName: "calendar")
                    Text("Entretien")
                }
        }
        .navigationBarBackButtonHidden(true)
        .tint(Color("Olive"))
    }
}

struct TabBarStorePage_Previews: PreviewProvider {
    static var previews: some View {
        TabBarStorePage().environmentObject(EnvironmentDataUser())
    }
}
