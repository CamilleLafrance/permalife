//
//  Models.swift
//  PermaLife
//
//  Created by apprenant77 on 31/01/2023.
//

import SwiftUI

struct Products: Identifiable {
    let id = UUID()
    let name : String
    let image : String
    let description : String
    let price : Int
    var isSelected = false
    var isSelectedLow = false
}

struct Models: View {
    var body: some View {
        HStack {
            Button(action: {}, label: {Text("Valider")})
                .foregroundColor(Color.white)
                .frame(width: 170.0, height: 40)
                .background(Color("Charcoal"))
                .cornerRadius(10)
        }
    }
}
struct Models_Previews: PreviewProvider {
    static var previews: some View {
        Models()
    }
}
