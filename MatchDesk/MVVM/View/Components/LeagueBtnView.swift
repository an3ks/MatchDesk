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
            Circle()
                .foregroundStyle(Color.mainAccentColor.opacity(0.1))
                .overlay(
                    Circle()
                        .stroke(Color.mainAccentColor, lineWidth: 1)
                )
            Image(systemName: "chevron.right")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundStyle(Color.mainAccentColor)
            
        }
        .frame(width: 35, height: 35, alignment: .center)
    }
}
