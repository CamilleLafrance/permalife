//
//  TabBarMonitoring.swift
//  PermaLife
//
//  Created by apprenant77 on 07/02/2023.
//

import SwiftUI

struct TabBarMonitoring: View {
    
    @EnvironmentObject var viewModel : EnvironmentDataUser
    
    var body: some View {
        TabView() {
            
            Monitoring()
                .tabItem{
                    Image(systemName: "calendar")
                    Text("Entretien")
                }
            
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
        }
        .navigationBarBackButtonHidden(true)
        .tint(Color("Olive"))
    }
}

struct TabBarMonitoring_Previews: PreviewProvider {
    static var previews: some View {
        TabBarMonitoring().environmentObject(EnvironmentDataUser())
    }
}
