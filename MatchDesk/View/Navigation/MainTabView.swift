//
//  MainTabView.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 04.03.2025.
//

import SwiftUI

struct MainTabView: View {
    @Binding var selectedTab: Int
    var body: some View {
        TabView(selection: $selectedTab){
            ZStack{
                Circle()
                    .frame(width: 300, height: 300)
                    .foregroundStyle(Color.mainAccentColor)
                Text("First view")
                    .foregroundStyle(Color.white)
            }
                .tag(1)
            
            ZStack{
                Circle()
                    .frame(width: 300, height: 300)
                    .foregroundStyle(Color.mainAccentColor)
                Text("Second view")
                    .foregroundStyle(Color.white)
            }
                .tag(2)
            
            ZStack{
                Circle()
                    .frame(width: 300, height: 300)
                    .foregroundStyle(Color.mainAccentColor)
                Text("Third view")
                    .foregroundStyle(Color.white)
            }
                .tag(3)
        }
    }
}

#Preview {
    MainTabView(selectedTab: .constant(1))
}
