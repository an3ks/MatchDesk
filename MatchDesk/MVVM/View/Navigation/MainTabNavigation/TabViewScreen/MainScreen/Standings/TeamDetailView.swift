//
//  TeamDetailView.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 14.05.2025.
//

import SwiftUI

struct TeamDetailView: View {
    let standing: LeagueStanding
    @StateObject var viewModel: TeamDetailViewModel
    @StateObject var fixtureViewModel: teamFixtureViewModel
    @AppStorage("selectedTeamName") var selectedTeamName: String = ""
    @AppStorage("selectedTeamId") var selectedTeamId: String = ""
    
    @State private var selectionIndex = 3
    var body: some View {
        //        let team = viewModel.teamDetails
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
                
            }
            
            
        }
        
        .onAppear {
            viewModel.teamDetails(for: standing.teamName)
            fixtureViewModel.fetchTeamFixtures(for: standing.teamId)
        }
        
        .safeAreaInset(edge: .top){
            topTeamOverlay(fixtureViewModel: fixtureViewModel, viewModel: viewModel)
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(.all)
    }
    
    
}

//#Preview {
//    TeamDetailView(standing: LeagueStanding (id: "5412409",
//                                             position: "1",
//                                             points: "70",
//                                             played: "29",
//                                             won: "21",
//                                             drawn: "7",
//                                             lost: "1",
//                                             goalsFor: "69",
//                                             goalsAgainst: "27",
//                                             goalDifference: "42",
//                                             teamName: "Liverpool",
//                                             teamLogo: "https://r2.thesportsdb.com/images/media/team/badge/kfaher1737969724.png"), viewModel: TeamDetailViewModel(teamName: "Liverpool"))
//}

struct topTeamOverlay: View {
    @Environment(\.dismiss) var dismiss
    
    @AppStorage("selectedTeamId") var selectedTeamId: String = ""
    @AppStorage("selectedTeamName") var selectedTeamName: String = ""
    @StateObject var fixtureViewModel: teamFixtureViewModel
    @StateObject var viewModel: TeamDetailViewModel
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.mainAccentClr)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.147)
            
            HStack(alignment: .center, spacing: 0){
                Button(action: {
                    dismiss()
                },
                       label: {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .foregroundStyle(Color.WhiteAndBlackColor)
                })
                .frame(width:60, height:60)
                Text(fixtureViewModel.teamFixtures.last?.homeName ?? "Team")
                    .font(.custom("HelveticaNeue-Light", size: 25))
                    .foregroundStyle(Color.WhiteAndBlackColor)
                    .multilineTextAlignment(.center)
                    .frame(width: 200)
                    .padding(.horizontal, 30)
                
                if let team = viewModel.teamDetails{
                    Button(
                        action: {
                            selectedTeamName = team.teamName
                            selectedTeamId = team.id},
                        label: {
                            Image(systemName: fixtureViewModel.teamFixtures.first?.homeName == selectedTeamName ? "heart.fill" : "heart")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.red)})
                    .frame(width: 50, height: 50)
                }
            }
            .padding(.top, 50)
        }
    }
}

struct teamSocialMedia: View {
    @StateObject var viewModel: TeamDetailViewModel
    var body: some View {
        ZStack{ //social media
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.clear.opacity(1))
                .frame(width: UIScreen.main.bounds.width * 0.99, height: 160)
                .shadow(color: Color.BlackAndWhiteColor.opacity(0.5), radius: 2)
            
            HStack(spacing:65){
                if let team = viewModel.teamDetails{
                    Button(action: {
                        if let url = URL(string:"https://\(team.website)") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        HStack {
                            Image(systemName: "globe")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .scaledToFit()
                        }
                        .foregroundColor(Color.mainAccentClr)
                    }
                }
                if let team = viewModel.teamDetails{
                    Button(action: {
                        if let url = URL(string:"https://\(team.twitter)") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        HStack {
                            Image("XTwitter")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .scaledToFit()
                        }
                        
                    }
                }
                if let team = viewModel.teamDetails{
                    Button(action: {
                        if let url = URL(string:"https://\(team.facebook)") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        HStack {
                            Image("facebook")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .scaledToFit()
                        }
                        
                    }
                }
            }
        }
    }
}

