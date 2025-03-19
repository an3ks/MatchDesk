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
            Text("More")
                .frame(width: 60, height: 40)
                .foregroundStyle(Color.mainAccentColor)
                .font(.custom("HelveticaNeue-Light", size: 13))
                .fontWeight(.bold)
            
        }
        .frame(width: 70, height: 50, alignment: .center)
    }
}
