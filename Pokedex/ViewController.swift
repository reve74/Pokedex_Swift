//
//  ViewController.swift
//  Pokedex
//
//  Created by Junho Yoon on 2023/10/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

