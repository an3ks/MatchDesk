//
//  favouriteTeamView.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 16.05.2025.
//

import SwiftUI

struct favouriteTeamView: View {
    @ObservedObject var viewModel: TeamDetailViewModel
    @ObservedObject var fixtureViewModel: teamFixtureViewModel
    @AppStorage("selectedTeamName") var selectedTeamName: String = ""
    @AppStorage("selectedTeamId") var selectedTeamId: String = ""
    
    var body: some View {
        ZStack{
            if let team = viewModel.teamDetails{
                AsyncImage(url: URL(string: team.teamLogo)){image in
                    image
                        .resizable()
                        .scaledToFit()
                        .opacity(0.5)
                        .frame(width: UIScreen.main.bounds.width*0.8, height:300)
                        .padding(.top, 50)
                }
                
                placeholder: {
                    ProgressView()
                        .frame(width: UIScreen.main.bounds.width*0.8, height:300)
                        .padding(.top, 50)
                }}
            
            VStack{
                ZStack{
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(fixtureViewModel.teamFixtures) { fixture in
                                FixtureView(fixture: fixture)
                            }
                            .padding(.vertical, 3)
                        }
                        .safeAreaInset(edge: .leading) {
                            Color.clear.frame(width: 20)
                        }
                        .safeAreaInset(edge: .trailing) {
                            Color.clear.frame(width: 30)
                        }
                    }
                }
                .padding(.top, UIScreen.main.bounds.height*0.08)
                .frame(width: UIScreen.main.bounds.width * 1, height: 160)
                Spacer()
                teamSocialMedia(viewModel: viewModel)
                    .padding(.bottom, 0)
                    .ignoresSafeArea(.all)
                    .safeAreaInset(edge: .bottom) { // Отступ снизу
                        Color.clear.frame(height: 50)
                    }

                
            }
            
            
        }
        
        .onAppear {
            viewModel.teamDetails(for: selectedTeamName)
            fixtureViewModel.fetchTeamFixtures(for: selectedTeamId)
        }
        
        .safeAreaInset(edge: .top){
            topTeamOverlay(fixtureViewModel: fixtureViewModel, viewModel: viewModel)
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(.all)
    }
}


//#Preview {
//    favouriteTeamView()
//}


