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
                }
                
                placeholder: {
                    ProgressView()
                    .frame(width: UIScreen.main.bounds.width*0.8, height:300)}}
            
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
                .padding(.top, UIScreen.main.bounds.height*0.09)
                .frame(width: UIScreen.main.bounds.width * 1, height: 160)
//                Spacer()
//                ZStack{ // competitions
//                    RoundedRectangle(cornerRadius: 30)
//                        .fill(Color.bottomBarColor.opacity(1))
//                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 160)
//                        .shadow(color: Color.BlackAndWhiteColor.opacity(0.5), radius: 2)
//                    Text("Competitions")
//                        .font(.custom("HelveticaNeue-Light", size: 17))
//                        if let team = viewModel.teamDetails{
//                            VStack{
//                            Text(team.cmpt)
//                            Text(team.cmpt2)
//                            Text(team.cmpt3)
//                            Text(team.cmpt4)
//                            Text(team.cmpt5)
//                            Text(team.cmpt6)
//                            Text(team.cmpt7)
//                        }
//                            .font(.custom("HelveticaNeue-Light", size: 13))
//                            .foregroundStyle(Color.bottomBarTextClr)
//                            
//                    }
//                }
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
            topTeamOverlay(fixtureViewModel: fixtureViewModel ,standing: standing)
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
    @StateObject var fixtureViewModel: teamFixtureViewModel
    let standing: LeagueStanding
    var body: some View {
        let fixtur = fixtureViewModel.teamFixtures.first
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
                Text(standing.teamName)
                    .font(.custom("HelveticaNeue-Light", size: 25))
                    .foregroundStyle(Color.WhiteAndBlackColor)
                    .multilineTextAlignment(.center)
                    .frame(width: 200)
                    .padding(.horizontal, 30)
                
                AsyncImage(url: URL(string: fixtur?.leagueLogo ?? "no image")){image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width:60, height:60)
                }
                placeholder: {
                    ProgressView()
                        .frame(width:60, height:60)
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
