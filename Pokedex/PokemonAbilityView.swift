//
//  PokemonAttributeView.swift
//  Pokedex
//
//  Created by Junho Yoon on 2023/10/19.
//

import UIKit

class PokemonAbilityView: UIView {
    var iconName: String?
    var abilityType: String?
    var ability: String?
    
    
    @IBOutlet weak var backgroundView: UIView! {
        didSet {
            backgroundView.layer.cornerRadius = 20
        }
    }
    
    @IBOutlet weak var iconImageView: UIImageView! {
        didSet {
            iconImageView.image = UIImage(named: "ability.png")
            iconImageView.tintColor = .black
        }
    }
    
    @IBOutlet weak var abilityTypeLabel: UILabel! {
        didSet {
            abilityTypeLabel.text = "Type"
        }
    }
    
    @IBOutlet weak var abilityLabel: UILabel! {
        didSet {
            abilityLabel.text = "Electric"
        }
    }
    
    
    
    
}
