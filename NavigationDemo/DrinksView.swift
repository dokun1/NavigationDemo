//
//  DrinksView.swift
//  NavigationDemo
//
//  Created by adobada on 5/2/23.
//

import SwiftUI

struct Drink: Hashable {
    var name: String
}

var sodas: [Drink] = [
    Drink(name: "Coca Cola"),
    Drink(name: "Pepsi"),
    Drink(name: "Grape Fanta"),
    Drink(name: "7 up"),
    Drink(name: "Sprite"),
    Drink(name: "Schweppes Ginger Ale"),
    Drink(name: "Seagram's Ginger Ale"),
    Drink(name: "Seagram's Ginger Ale"),
    Drink(name: "Apple Cidra"),
    Drink(name: "Orange Fanta"),
]

var coffees: [Drink] = [
    Drink(name: "Latte"),
    Drink(name: "Espresso"),
    Drink(name: "Macchiato"),
    Drink(name: "Drip"),
    Drink(name: "Mocha"),
    Drink(name: "Cappuccino"),
    Drink(name: "Americano"),
    Drink(name: "Cold brew"),
    Drink(name: "Black"),
    Drink(name: "Flat White"),
]

struct DrinksListView: View {
    var currentSelection: Drink? = nil
    
    var body: some View {
        List {
            Section("Sodas") {
                ForEach(sodas, id: \.self) { soda in
                    NavigationLink(soda.name, value: soda)
                }
            }
            
            Section("Coffees") {
                ForEach(coffees, id: \.self) { coffee in
                    NavigationLink(coffee.name, value: coffee)
                }
            }
        }
        .navigationTitle("Drinks")
        .navigationDestination(for: Drink.self) { selectedDrink in
            Text("A good cup of \(selectedDrink.name)")
        }
    }
}

struct DrinksView: View {
    var body: some View {
        NavigationStack {
            DrinksListView()
        }
    }
}

struct DrinksView_Previews: PreviewProvider {
    static var previews: some View {
        DrinksView()
    }
}
