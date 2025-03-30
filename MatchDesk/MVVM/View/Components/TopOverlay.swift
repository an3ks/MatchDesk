//
//  TopOverlay.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 13.03.2025.
//

import SwiftUI

struct TopOverlay: View {
    @State private var selectedTabIndex = 1
    @Binding var SportSelectedIndex: Int
    @State private var SportSelectionOptions = SportModelOptions.items
    @State private var EmptySportSelectionOptions = EmptySportModelOptions.items
    var body: some View {
        ZStack(alignment: .trailing){
            Rectangle()
                .fill(Color.mainAccentColor)
                .frame(width: UIScreen.main.bounds.width, height: 100)
            HStack{
                if SportSelectedIndex != 0{
                    HStack(spacing: 50){
                        Button( action:{
                            withAnimation(.linear(duration: 0)) {
                                SportSelectedIndex = SportSelectedIndex == 1 ? 2 : 1
                            }},
                                label:{
                            HStack{
                                Text(SportSelectedIndex == 1 ? "Football" : "Hockey")
                                    .foregroundColor(Color.WhiteAndBlackColor)
                                    .font(.custom("HelveticaNeue-Light", size: 20))
                                    .bold()
                            }
                            Image(systemName: SportSelectedIndex == 1 ? "soccerball.inverse" : "hockey.puck")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(selectedTabIndex == 1 ? Color.WhiteAndBlackColor : Color.black)
                            .frame(width: 30, height: 30)})
                    }
                    .padding(.leading, 30)
                    .padding(.top, 40)
                }
                
                Spacer()
                Text("Match \n Desk")
                    .font(.system(size: 17, weight: .bold, design: .rounded))
                    .foregroundStyle(Color.WhiteAndBlackColor)
                    .frame(width: 130, height: 90, alignment: .leading)
                    .padding(.trailing, -30)
                    .padding(.bottom, -35)
            }
            .padding(.bottom, -15)
        }
        .ignoresSafeArea()
    }
}
#Preview {
    TopOverlay(SportSelectedIndex: .constant(0))
}
