//
//  SettingsView.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 25.04.2025.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State private var sportSelectedIndex = 3
    
    var body: some View {
        Form {
            Section(header: Text("Внешний вид")) {
                Toggle(isOn: $isDarkMode) {
                    Text("Темная тема")
                }
            }
            
            
            Section(header: Text("О приложении")) {
                HStack {
                    Text("Версия")
                    Spacer()
                    Text("1.0.7")
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("Разработчик")
                    Spacer()
                    Text("Данила Авдиенко")
                        .foregroundColor(.gray)
                }
            }
            
        }
        .safeAreaInset(edge: .top){
            TopOverlay(SportSelectedIndex: $sportSelectedIndex)
        }

        .ignoresSafeArea(.all)
        .navigationTitle("Настройки")

    }
    
        
}

#Preview {
    SettingsView()
}
