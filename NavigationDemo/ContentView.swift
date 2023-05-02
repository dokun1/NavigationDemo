//
//  ContentView.swift
//  NavigationDemo
//
//  Created by David Okun on 5/1/23.
//

import SwiftUI

struct Food: Hashable {
    var name: String
}

var fruits: [Food] = [
    .init(name: "Apple"),
    .init(name: "Orange"),
    .init(name: "Banana"),
    .init(name: "Grape"),
    .init(name: "Kiwi"),
    .init(name: "Grapefruit"),
    .init(name: "Pear"),
    .init(name: "Strawberry"),
    .init(name: "Blueberry"),
    .init(name: "Blackberry")
]

var vegetables: [Food] = [
    Food(name: "Carrot"),
    Food(name: "Broccoli"),
    Food(name: "Bell Pepper"),
    Food(name: "Squash"),
    Food(name: "Eggplant"),
    Food(name: "Celery"),
    Food(name: "Onion"),
    Food(name: "Potato")
]

struct ListView: View {
    var currentSelection: Food? = nil
    @State var showSheet: Bool = false
    
    var body: some View {
        List {
            if let currentSelection {
                Section("Current Selection") {
                    Text(currentSelection.name)
                }
            }
            Section("Fruits") {
                ForEach(fruits, id: \.self) { fruit in
                    NavigationLink(fruit.name, value: fruit)
                }
            }
            Section("Vegetables") {
                ForEach(vegetables, id: \.self) { vegetable in
                    NavigationLink(vegetable.name, value: vegetable)
                }
            }
        }
        .navigationDestination(for: Food.self) { item in
            ListView(currentSelection: item)
        }
        .toolbar {
            ToolbarItem {
                Button {
                    showSheet.toggle()
                    let food = Food(name: "Bruno's Favorite Fooe")
                    print(food.hashValue)
                } label: {
                    Text("Modal")
                }
            }
        }
        .sheet(isPresented: $showSheet) {
            NavigationStack {
                ListView()
            }
        }
        .navigationTitle(currentSelection?.name ?? "No Title")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
