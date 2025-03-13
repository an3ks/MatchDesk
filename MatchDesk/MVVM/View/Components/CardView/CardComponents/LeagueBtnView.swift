//
//  LeagueBtnView.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 13.03.2025.
//

import SwiftUI

struct LeagueBtnView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundStyle(Color.mainAccentColor.opacity(0.1))
                .border(Color.mainAccentColor, width: 3)
                .clipShape(RoundedRectangle(cornerRadius: 40))
            Image(systemName: "chevron.right")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundStyle(Color.mainAccentColor)
            
        }
        .frame(width: 35, height: 35, alignment: .center)
        .padding(.top, 10)
    }
}
