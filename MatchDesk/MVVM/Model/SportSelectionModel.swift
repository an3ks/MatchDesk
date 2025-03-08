//
//  SportSelectionModel.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 05.03.2025.
//

import Foundation

struct SportModelSelectionItem: Identifiable {
    let id = UUID()
    let name: String
}

struct SportModelOptions{
    static let items: [SportModelSelectionItem] = [
        SportModelSelectionItem(name: "Football"),
        SportModelSelectionItem(name: "Hockey")
    ]
}
struct EmptySportModelOptions{
    static let items: [SportModelSelectionItem] = []
}
