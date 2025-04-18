//
//  ContentView.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 03.03.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTabIndex = 1
    @State private var sportSelectedIndex = 1
    @State private var SportSelectionOptions = SportModelOptions.items
    @State private var EmptySportSelectionOptions = EmptySportModelOptions.items

    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    ZStack{
                        MainTabView(selectedTab: $selectedTabIndex, selectedSport: $sportSelectedIndex)
                    }
                    .safeAreaInset(edge: .bottom){
                        BottomNavBar(tabSelection: $selectedTabIndex)
                            .padding(.bottom, -60)
                    }
                }
                .safeAreaInset(edge: .top){
                    TopOverlay(SportSelectedIndex: $sportSelectedIndex)
                }
            }
            .preferredColorScheme(.dark)
        }

        
    }
}
#Preview {
    ContentView()
//        .preferredColorScheme(.dark)
}
