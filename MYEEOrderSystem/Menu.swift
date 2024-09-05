//
//  Menu.swift
//  MYEEOrderSystem
//
//  Created by 洪宗燦 on 2024/9/4.
//

import Foundation
struct Menu: Codable {
    let restaurant: Restaurant
}

struct Restaurant: Codable {
    let name: String
    let address: String
    let phone: String
    let menu: MenuDetails
}

struct MenuDetails: Codable {
    let noodles: [Noodle]
    let sideDishes: [SideDish]
    let drinks: [Drink]
}

struct Noodle: Codable {
    let id: Int
    let name: String
    let description: String
    let price: Price
    let options: Options
    let available: Bool
}

struct Price: Codable {
    let small: Int
    let large: Int
}

struct Options: Codable {
    let type: [String]
    let noodleType: [String]
    let addScallion: Bool
    let spicyLevel: Int
}

struct SideDish: Codable {
    let id: Int
    let name: String
    let description: String
    let price: Int
    let available: Bool
}

struct Drink: Codable {
    let id: Int
    let name: String
    let description: String
    let price: Int
    let available: Bool
}
