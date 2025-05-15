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
    @Environment(\.dismiss) var dismiss
    @State private var selectionIndex = 3
    var body: some View {
//        let team = viewModel.teamDetails
        ZStack{
            VStack{
                VStack{
                    if let team = viewModel.teamDetails{
                        Text(team.fanName)
                        .font(.system(size: 30, weight: .bold, design: .default))}
                    
                }
                Spacer()}
            if let team = viewModel.teamDetails{
                AsyncImage(url: URL(string: team.teamLogo)){image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width*0.9, height:500)
                }
                placeholder: {
                    ProgressView()
                    .frame(width: UIScreen.main.bounds.width*0.9, height:500)}
            }
        }
        .frame(width: UIScreen.main.bounds.width)
        .onAppear {
            viewModel.teamDetails(for: standing.teamName)
        }
        .overlay(Color.bottomBarClr.opacity(0.6))
        .ignoresSafeArea(.all)
        .safeAreaInset(edge: .top){
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
                    
                    AsyncImage(url: URL(string: standing.teamLogo)){image in
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
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(.all)
    }
    
    
}
//
//#Preview {
//    TeamDetailView(standing: LeagueStanding (id: "5412409",
//                        position: "1",
//                        points: "70",
//                        played: "29",
//                        won: "21",
//                        drawn: "7",
//                        lost: "1",
//                        goalsFor: "69",
//                        goalsAgainst: "27",
//                        goalDifference: "42",
//                        teamName: "Liverpool",
//                        teamLogo: "https://r2.thesportsdb.com/images/media/team/badge/kfaher1737969724.png"))
//}
