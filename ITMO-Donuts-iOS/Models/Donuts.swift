//
//  Donuts.swift
//  ITMO-Donuts-iOS
//
//  Created by Vladislav Tereshchenko on 19.12.2022.
//

import Foundation

class Donuts {
    var donuts: [Donut] = []
    
    init() {
        self.donuts = [
            Donut(title: "Клубничный", description: "Классичсекий донат с клубничной начинкой", energetic: 417, weight: 100, picture: "https://raw.githubusercontent.com/gurinboru/ITMO-Donuts-backend-donut/data/static/product_pics/product_1.png", model: "https://raw.githubusercontent.com/gurinboru/ITMO-Donuts-backend-donut/data/static/product_models/product_1.obj", price: 250),
            Donut(title: "Черничный Барс", description: "Черничный донат в символике спортивной команды Кронверкские барсы", energetic: 392, weight: 100, picture: "https://raw.githubusercontent.com/gurinboru/ITMO-Donuts-backend-donut/data/static/product_pics/product_2.png", model: "https://raw.githubusercontent.com/gurinboru/ITMO-Donuts-backend-donut/data/static/product_models/product_2.obj", price: 250),
            Donut(title: "Фисташковый ", description: "Донат с фисташковой начинкой", energetic: 417, weight: 100, picture: "https://raw.githubusercontent.com/gurinboru/ITMO-Donuts-backend-donut/data/static/product_pics/product_3.png", model: "https://raw.githubusercontent.com/gurinboru/ITMO-Donuts-backend-donut/data/static/product_models/product_3.obj", price: 250),
            Donut(title: "Банановый коворкинг", description: "Донат с банановой начинкой как самые яркие коворкинги ИТМО", energetic: 417, weight: 100, picture: "https://raw.githubusercontent.com/gurinboru/ITMO-Donuts-backend-donut/data/static/product_pics/product_4.png", model: "https://raw.githubusercontent.com/gurinboru/ITMO-Donuts-backend-donut/data/static/product_models/product_4.obj", price: 250),
            Donut(title: "Yellow room with students", description: "Донат с манго в стиле аудитории Yellow room (1419)", energetic: 392, weight: 100, picture: "https://raw.githubusercontent.com/gurinboru/ITMO-Donuts-backend-donut/data/static/product_pics/product_5.png", model: "https://raw.githubusercontent.com/gurinboru/ITMO-Donuts-backend-donut/data/static/product_models/product_5.obj", price: 350),
            Donut(title: "Orange room with students", description: "Донат с карамелью в стиле аудитории Orange room ", energetic: 392, weight: 100, picture: "https://raw.githubusercontent.com/gurinboru/ITMO-Donuts-backend-donut/data/static/product_pics/product_6.png", model: "https://raw.githubusercontent.com/gurinboru/ITMO-Donuts-backend-donut/data/static/product_models/product_6.obj", price: 350),
            Donut(title: "Christmas ITMO", description: "Новогодний донат с ягодной начинкой", energetic: 392, weight: 100, picture: "https://raw.githubusercontent.com/gurinboru/ITMO-Donuts-backend-donut/data/static/product_pics/product_7.png", model: "https://raw.githubusercontent.com/gurinboru/ITMO-Donuts-backend-donut/data/static/product_models/product_7.obj", price: 350),
            Donut(title: "Спортзал", description: "Донат с шоколадной начинкой", energetic: 392, weight: 100, picture: "https://raw.githubusercontent.com/gurinboru/ITMO-Donuts-backend-donut/data/static/product_pics/product_8.png", model: "https://raw.githubusercontent.com/gurinboru/ITMO-Donuts-backend-donut/data/static/product_models/product_8.obj", price: 350),
            Donut(title: "Шоколадный дедлайн", description: "Донат с шоколадной начинкой", energetic: 392, weight: 100, picture: "https://raw.githubusercontent.com/gurinboru/ITMO-Donuts-backend-donut/data/static/product_pics/product_9.png", model: "https://raw.githubusercontent.com/gurinboru/ITMO-Donuts-backend-donut/data/static/product_models/product_9.obj", price: 200),
            Donut(title: "Новый год", description: "Донат со вкусом Красный бархат", energetic: 392, weight: 100, picture: "https://raw.githubusercontent.com/gurinboru/ITMO-Donuts-backend-donut/data/static/product_pics/product_10.png", model: "https://raw.githubusercontent.com/gurinboru/ITMO-Donuts-backend-donut/data/static/product_models/product_10.obj", price: 200)]
    }
}
