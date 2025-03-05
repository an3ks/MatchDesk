//
//  MainHeaderView.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 04.03.2025.
//

import SwiftUI

struct MainHeaderView: View {
    var body: some View {
        HStack{
            Capsule()
                .frame(width: 8, height: 80)
                .cornerRadius(40)
                .foregroundStyle(Color.mainAccentColor)
            Text("Match Desk")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .foregroundColor(Color("BnW"))
        }
        .frame(width: 150, height: 100, alignment: .leading)
        .offset(x:-100)
    }
}


#Preview {
    MainHeaderView()
}
