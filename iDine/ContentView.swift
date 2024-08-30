//
//  ContentView.swift
//  iDine
//
//  Created by 인터웍스_맥북 on 8/30/24.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(menu) { section in
                    Section(section.name) {
                        ForEach(section.items) { item in
                            Text(item.name)
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            .listStyle(GroupedListStyle()) // 양쪽에 있던 inset 없애기!
        }
    }
}

#Preview {
    ContentView()
}
