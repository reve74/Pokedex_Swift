//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Junho Yoon on 2023/10/19.
//

import UIKit

class PokemonCell: UITableViewCell {
    
    @IBOutlet weak var coverView: UIView! {
        didSet {
            coverView.layer.cornerRadius = 40
        }
    }
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    @IBOutlet weak var numberLabel: UILabel! {
        didSet {
            numberLabel.font = .systemFont(ofSize: 16, weight: .medium)
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        }
    }
    
    override func awakeFromNib() {
           super.awakeFromNib()
           // Initialization code
       }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
