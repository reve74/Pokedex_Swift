//
//  Pokemon.swift
//  Pokedex
//
//  Created by Junho Yoon on 2023/10/19.
//

import UIKit

struct Pokemon {
    let number: Int
    let name: String
    let image: String
}

extension Pokemon {
    static let data: [Pokemon] = [
        Pokemon(number: 1, name: "Evevee", image: "eve"),
        Pokemon(number: 2, name: "Pikachu", image: "pikachu"),
        Pokemon(number: 3, name: "Hitokage", image: "hitokage"),
        Pokemon(number: 4, name: "Metamong", image: "metamong"),
        Pokemon(number: 5, name: "Piplup", image: "peng"),
    ]
}
