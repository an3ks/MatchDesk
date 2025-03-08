//
//  ContentView.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 03.03.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTabIndex = 1
    @State private var SportSelectedIndex = 1
    @State private var SportSelectionOptions = SportModelOptions.items
    @State private var EmptySportSelectionOptions = EmptySportModelOptions.items
    var body: some View {
        VStack {
            MainHeaderView()
            MainTabView(selectedTab: $selectedTabIndex, selectedSport: $SportSelectedIndex)
                .overlay(alignment:.bottom){
                    VStack{
                        if selectedTabIndex == 1 {
                            SportSelectionView(SportSelectionOptions: $SportSelectionOptions, SportSelectedIndex: $SportSelectedIndex)
                                .padding(.bottom, 10)
                        }
                        else{
                            SportSelectionView(SportSelectionOptions: $EmptySportSelectionOptions, SportSelectedIndex: $SportSelectedIndex)
                                .padding(.bottom, 10)
                        }
                        
                        BottomNavBar(tabSelection: $selectedTabIndex)
                            .ignoresSafeArea(.all, edges: .bottom)
                            .padding(.bottom, -10)
                    }
                }
        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}

