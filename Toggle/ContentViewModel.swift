//
//  ContentViewModel.swift
//  Toggle
//
//  Created by Amir on 1/25/24.
//

import Foundation

protocol Updatable {
    func updateModel(row: Config)
}

class ContentViewModel: ObservableObject, Updatable {
    var item = [Config]()
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Configs") {
            if let decodedItems = try? JSONDecoder().decode([Config].self, from: savedItems) {
                item = decodedItems
                return
            }
        }
        self.item = [Config(option: 0, toggle: true),
                     Config(option: 0, toggle: false),
                     Config(option: 0, toggle: true)]
    }
    
    func updateModel(row: Config) {
        if let item = item.first(where: { $0.id == row.id}) {
            item.option = row.option
            item.toggle = row.toggle
        }
        if let encoded = try? JSONEncoder().encode(item) {
            UserDefaults.standard.set(encoded, forKey: "Configs")
        }
    }
}
