//
//  ContentView.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 03.03.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTabIndex = 1
    var body: some View {
        VStack {
            MainHeaderView()
            MainTabView(selectedTab: $selectedTabIndex)
            Spacer()
                .overlay(alignment:.bottom){
                    BottomNavBar(tabSelection: $selectedTabIndex)
                        .ignoresSafeArea(.all, edges: .bottom)
                        .padding(.bottom, -10)
                }
        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}

