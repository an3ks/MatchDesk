//
//  FixtureView.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 20.03.2025.
//

import SwiftUI


struct FixtureView: View {
    let fixture: Fixture
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.bottomBarColor.opacity(1))
                .frame(width: UIScreen.main.bounds.width * 0.8, height: 160)
                .shadow(color: Color.BlackAndWhiteColor.opacity(0.5), radius: 2)
            VStack(alignment: .center){
                ZStack{
                    VStack{
                        VStack{
                            AsyncImage(url: URL(string: fixture.leagueLogo ?? "no image")){ image in
                                image.resizable()
                                    .frame(width: 30, height: 30)
                                    .scaledToFit()
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 30, height: 30)
                            }
                            Text(fixture.venue ?? "Sport Stadium")
                                .foregroundColor(Color.BlackAndWhiteColor)
                                .font(.custom("HelveticaNeue-Light", size: 10))
                                .padding(.top, 3)
                        }
                        HStack{
                            Text("\(fixture.homeScore ?? "0") : \(fixture.awayScore ?? "0")")
                                .font(.custom("HelveticaNeue-Light", size: 27))
                                .bold()
                                .foregroundStyle(Color.mainAccentColor)
                                .padding(.top, 10)
                        }
                        Text(fixture.dateEvent)
                            .font(.custom("HelveticaNeue-Light", size: 10))
                            .padding(.top, 10)
                    }
                    
                    
                    .frame(width: UIScreen.main.bounds.width * 0.3, height: 160)
                    .padding(.horizontal, 10)
                    HStack{
                        VStack(spacing:0){
                            AsyncImage(url: URL(string: fixture.homeLogo ?? "no image")){ image in
                                image.resizable()
                                    .frame(width: 50, height: 50)
                                    .scaledToFit()
                            }
                            placeholder: {
                                ProgressView()
                                .frame(width: 50, height: 50)}
                            Text(fixture.homeName.replacingOccurrences(of: " ", with: "\n"))
                                .multilineTextAlignment(.center)
                                .font(.custom("HelveticaNeue-Light", size: 13))
                                .frame(width: 100, height: 50)
                        }
                        .padding(.leading, 15)
                        Spacer()
                        VStack(spacing:0){
                            AsyncImage(url: URL(string: fixture.awayLogo ?? "no image")){ image in
                                image.resizable()
                                    .frame(width: 50, height: 50)
                                    .scaledToFit()
                            } placeholder: {
                                ProgressView()
                                .frame(width: 50, height: 50)}
                            
                            Text(fixture.awayName.replacingOccurrences(of: " ", with: "\n"))
                                .multilineTextAlignment(.center)
                                .font(.custom("HelveticaNeue-Light", size: 13))
                                .frame(width: 100, height: 50)
                        }
                        .padding(.trailing, 15)
                    }
                    .padding(.top, 50)
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.8, height: 160)
    }
}
#Preview {
    FixtureView(fixture: Fixture(
        id: "2070120",
        leagueName: "English Premier League",
        leagueLogo: "https://www.thesportsdb.com/images/media/league/badge/gasy9d1737743125.png",
        homeName: "Manchester United",
        awayName: "Liverpool",
        homeScore: "3",
        awayScore: "0",
        dateEvent: "2025-03-15",
        homeLogo: "https://r2.thesportsdb.com/images/media/team/badge/xzqdr11517660252.png",
        awayLogo: "https://r2.thesportsdb.com/images/media/team/badge/kfaher1737969724.png",
        venue: "Old Trafford"
    ))
}
