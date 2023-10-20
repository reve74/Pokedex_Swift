//
//  DetailViewController.swift
//  Pokedex
//
//  Created by Junho Yoon on 2023/10/19.
//

import UIKit

class DetailViewController: UIViewController {
    
    var pokemon: Pokemon?
    
    var img: UIImage?
    
//    var pokemonAbilityView = PokemonAbilityView()
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    @IBOutlet weak var numberLabel: UILabel! {
        didSet {
            numberLabel.font = .systemFont(ofSize: 20, weight: .medium)
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        }
    }
    
//    @IBOutlet weak var backgroundView: UIView! {
//        didSet {
//            backgroundView.layer.cornerRadius = 20
//        }
//    }
    
//    @IBOutlet weak var pokemonAbilityView: PokemonAbilityView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let hasImage = pokemon?.image {
          img =  UIImage(named: "\(hasImage).jpg")
        }
        pokemonImageView?.image = img
        
        if let hasNumber = pokemon?.number {
            numberLabel.text = "No.\(String(hasNumber))"
        }
        
        if let hasName = pokemon?.name {
            nameLabel.text = hasName
        }

    }
}
