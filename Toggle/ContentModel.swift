//
//  ContentModel.swift
//  Toggle
//
//  Created by Amir on 1/25/24.
//

import Foundation

class Config: Codable {
    
    let id: UUID
    var option: Int
    var toggle: Bool
    
    internal init(option: Int, toggle: Bool) {
        self.id = UUID()
        self.option = option
        self.toggle = toggle
    }

}
