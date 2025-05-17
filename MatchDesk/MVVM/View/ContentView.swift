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
    @StateObject var viewModel = TeamDetailViewModel(teamName: "")
    @StateObject var fixtureViewModel = teamFixtureViewModel(teamId: "")
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    ZStack{
                        MainTabView(selectedTab: $selectedTabIndex, selectedSport: $sportSelectedIndex,
                                    viewModel: viewModel,
                                    fixtureViewModel: fixtureViewModel)
                    }
                    .safeAreaInset(edge: .bottom){
                        BottomNavBar(tabSelection: $selectedTabIndex)
                            .padding(.bottom, -60)
                    }
                }
                            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }

        
    }
}
//#Preview {
//    ContentView()
////        .preferredColorScheme(.dark)
//}
