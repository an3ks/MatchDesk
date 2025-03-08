//
//  SportSelectionView.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 05.03.2025.
//

import SwiftUI

struct SportSelectionView: View {
    //    let SportSelectionOptions = SportModelOptions.items
    @Binding var SportSelectionOptions: [SportModelSelectionItem]
    @Binding var SportSelectedIndex: Int
    @Namespace private var animationNamespace
    var body: some View {
        if SportSelectionOptions.count != 0{
            HStack(spacing: 130){
                ForEach(0..<SportSelectionOptions.count, id: \.self){ index in
                    Button{SportSelectedIndex = index+1}
                    label:{
                        VStack{
                            if index == SportSelectedIndex-1{
                                Capsule()
                                    .fill(Color.mainAccentColor)
                                    .frame(width: 10, height: 10)
                                    .matchedGeometryEffect(id: "SelectedSportIndex", in: animationNamespace)
                                
                            }else{
                                Capsule()
                                    .fill(Color.clear)
                                    .frame(width: 10, height: 10)
                            }
                            Text(SportSelectionOptions[index].name)
                                .foregroundStyle(index == SportSelectedIndex-1 ? Color.mainAccentColor : Color.bottomBarTextColor)
                                .font(.system(size: 13, weight: .medium, design: .rounded))
                        }
                    }
                    
                }
            }
        }
    }
}

//#Preview {
//    SportSelectionView(SportSelectedIndex: .constant(1), SportSelectionOptions: .constant(  ["Football", "Cricket"]))
//}
