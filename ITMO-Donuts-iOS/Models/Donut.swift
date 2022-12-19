//
//  Donut.swift
//  ITMO-Donuts-iOS
//
//  Created by Vladislav Tereshchenko on 19.12.2022.
//

import Foundation

class Donut {
    var title: String
    var description: String
    var energetic: Int
    var weight: Int
    var picture: String
    var model: String
    var price: Int
    
    init(title: String, description: String, energetic: Int, weight: Int, picture: String, model: String, price: Int) {
        self.title = title
        self.description = description
        self.energetic = energetic
        self.weight = weight
        self.picture = picture
        self.model = model
        self.price = price
    }
}
