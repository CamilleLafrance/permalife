//
//  PermaLifeApp.swift
//  PermaLife
//
//  Created by apprenant77 on 31/01/2023.
//

import SwiftUI

@main
struct PermaLifeApp: App {
    
    @StateObject var viewModel: EnvironmentDataUser = EnvironmentDataUser()
    
    var body: some Scene {
        WindowGroup {
            HomePage().environmentObject(EnvironmentDataUser())
        }
    }
}
