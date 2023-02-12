//
//  TabBar.swift
//  PermaLife
//
//  Created by apprenant77 on 31/01/2023.
//

import SwiftUI

struct TabBarGarden: View {
    
    @EnvironmentObject var viewModel : EnvironmentDataUser
    
    var body: some View {
        TabView() {
            
            CreateMyGarden()
                .tabItem{
                    Image(systemName: "carrot.fill")
                    Text("Potager")
                }
            
            StorePage()
                .tabItem{
                    Image(systemName: "cart.fill")
                    Text("Boutique")
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

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBarGarden().environmentObject(EnvironmentDataUser())
    }
}
