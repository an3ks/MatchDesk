//
//  MainTabView.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 04.03.2025.
//

import SwiftUI

struct MainTabView: View {
    @Binding var selectedTab: Int
    @Binding var selectedSport: Int
    var body: some View {
        
        TabView(selection: $selectedTab){
            ZStack{
                if selectedSport == 1{
                    MainScreenFootballView()
                        .background(Color.BackgroundColor)
                        .safeAreaInset(edge: .top) { // Отступ сверху
                        Color.clear.frame(height: 70)
                    }
                    .safeAreaInset(edge: .bottom) { // Отступ снизу
                        Color.clear.frame(height: 10)
                    }
                }
                else{
                    MainScreenHockeyView()
                        .background(Color.BackgroundColor)
                        .safeAreaInset(edge: .top) { // Отступ сверху
                        Color.clear.frame(height: 70)
                    }
                    .safeAreaInset(edge: .bottom) { // Отступ снизу
                        Color.clear.frame(height: 10)
                    }
                }
            }
            .tag(1)
            ZStack{
                Circle()
                    .frame(width: 300, height: 300)
                    .foregroundStyle(Color.mainAccentColor)
                Text("Second view")
                    .foregroundStyle(Color.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.BackgroundColor)
            
            .tag(2)
            
            SettingsView()
                
            .tag(3)
        }
    }
}

#Preview {
    MainTabView(selectedTab: .constant(1), selectedSport: .constant(2))
}
