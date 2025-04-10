//
//  FixtureRowView.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 30.03.2025.
//

import SwiftUI

struct FixtureRowView: View {
    let league: League
    let standingsViewModel: FStadingsViewModel
    var body: some View {
        
        ZStack{
            Rectangle()
            
            HStack{
            }
        }
            .frame(minWidth: UIScreen.main.bounds.width * 0.8, maxWidth: UIScreen.main.bounds.width * 0.8, minHeight: 15)
            .background(Color.RowColor.opacity(0.3))
            .cornerRadius(30)
    }
}

#Preview {
//    FixtureRowView()
}
