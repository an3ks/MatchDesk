//
//  BottomNavBar.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 04.03.2025.
//

import SwiftUI

struct BottomNavBar: View {
    @Binding var tabSelection: Int
    @Namespace private var animationNamespace
    let navBarOptions = NavBarModel.items
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 330, height: 65, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .foregroundColor(Color.bottomBarClr)
                .shadow(color: Color.BlackAndWhiteColor, radius: 1)
            HStack(spacing: 50){
                ForEach(0..<navBarOptions.count, id: \.self){index in
                    Button{
                        tabSelection = index+1
                    }
                    label:{
                        VStack{
                            Image(systemName: navBarOptions[index].imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                            Text(navBarOptions[index].name)
                                .font(.system(size: 13, weight: .light, design: .rounded))
                            if index == tabSelection-1{
                                Capsule()
                                    .fill(Color.mainAccentColor)
                                    .frame(width: 30, height: 3)
                                    .matchedGeometryEffect(id: "SelectedTabId", in: animationNamespace)
                                    .offset(y:-8)
                            }
                            else{
                                Capsule()
                                    .fill(Color.clear)
                                    .frame(width: 30, height: 3)
                                    .offset(y:-8)
                            }
                        }
                        .padding(.top,15)
                        .foregroundColor(index == tabSelection-1 ? Color.mainAccentColor : Color.bottomBarTextColor)
                    }
                }
            }
            
        }
    }
}

#Preview {
    BottomNavBar(tabSelection: .constant(1))
    
}
