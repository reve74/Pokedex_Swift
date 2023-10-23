//
//  Pokemon.swift
//  Pokedex
//
//  Created by Junho Yoon on 2023/10/19.
//

import UIKit

//struct Pokemon {
//    let number: Int
//    let name: String
//    let image: String
//}
//
//extension Pokemon {
//    static let data: [Pokemon] = [
//        Pokemon(number: 1, name: "Evevee", image: "eve"),
//        Pokemon(number: 2, name: "Pikachu", image: "pikachu"),
//        Pokemon(number: 3, name: "Hitokage", image: "hitokage"),
//        Pokemon(number: 4, name: "Metamong", image: "metamong"),
//        Pokemon(number: 5, name: "Piplup", image: "peng"),
//    ]
//}


struct AllPokemonModel: Codable {
    let count: Int
    let results: [ResultModel]
}

struct ResultModel: Codable {
    let name: String
    let url: String
}


struct PokemonModel: Codable {
    let types: [Types]
    let abilities: [Abitity?]
    let height: Int
    let weight: Int
}

struct Abitity: Codable {
    let name: String?
}

struct Types: Codable {
    let slot: Int
    let type: TypeDetail
}

struct TypeDetail: Codable {
    let name: String
    let url: String
}
