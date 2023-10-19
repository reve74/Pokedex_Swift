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
        Pokemon(number: 1, name: "이브이", image: "eve"),
        Pokemon(number: 2, name: "피카츄", image: "pikachu"),
        Pokemon(number: 3, name: "파이리", image: "hitokage"),
        Pokemon(number: 4, name: "메타몽", image: "metamong"),
        Pokemon(number: 5, name: "펭도리", image: "peng"),
    ]
}
