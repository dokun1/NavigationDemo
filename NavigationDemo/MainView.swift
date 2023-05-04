//
//  TabView.swift
//  NavigationDemo
//
//  Created by adobada on 5/2/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Eat", systemImage: "carrot")
                }
            DrinksView()
                .tabItem {
                    Label("Drink", systemImage: "cup.and.saucer")
                }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
