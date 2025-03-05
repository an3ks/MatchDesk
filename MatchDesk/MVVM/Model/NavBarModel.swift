//
//  NavBarModel.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 04.03.2025.
//

import Foundation

struct NavBarItem: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
}
struct NavBarModel {
    static let items: [NavBarItem] = [
        NavBarItem(imageName: "house", name: "Home"),
        NavBarItem(imageName: "bolt.heart.fill", name: "Favourites"),
        NavBarItem(imageName: "gearshape", name: "Settings")
    ]
}
