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
                if SportSelectedIndex != 3{
                    ZStack{
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 145, height: 25)
                            .foregroundStyle(Color.BackgroundColor.opacity(0.0))
                        
                            HStack(spacing: 5) {
                                ForEach(SportModelOptions.items.indices, id: \.self) { index in
                                    let sport = SportModelOptions.items[index]
                                    Button(action: {
                                        withAnimation(.easeIn(duration: 0.3)){
                                            SportSelectedIndex = index
                                        }
                                    }) {
                                        Text(sport.name)
                                            .font(.custom("HelveticaNeue-Light", size: 13))
                                            .foregroundColor(SportSelectedIndex == index ? .mainAccentColor : Color.bottomBarTextColor)
                                            .frame(width: 70, height: 25)
                                            .bold()
                                            .background(SportSelectedIndex == index ? Color.WhiteAndBlackColor : Color.gray.opacity(0.5 ))
                                            .cornerRadius(12)
                                    }
                                }
                                
                        }
                    }
                    .padding(.leading, 30)
                    .padding(.top, 39)
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
    TopOverlay(SportSelectedIndex: .constant(1))
//        .preferredColorScheme(.dark)
}


