//
//  ViewController.swift
//  Pokedex
//
//  Created by Junho Yoon on 2023/10/16.
//

import UIKit

class ViewController: UIViewController {
    
    let pokemonList = Pokemon.data
    
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            self.searchBar.searchBarStyle = .minimal
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = .systemFont(ofSize: 30, weight: .bold)
        }
    }
    
 
    @IBOutlet weak var pokemonTableView: UITableView! {
        didSet {
            pokemonTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
            pokemonTableView.delegate = self
            pokemonTableView.dataSource = self
            pokemonTableView.backgroundColor = UIColor.systemGray6
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
}

let cellName = "PokemonCell"
let cellReuseIdentifier = "PokemonCell"

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = UIStoryboard(name: "DetailViewController", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        detailViewController.pokemon = self.pokemonList[indexPath.row]
        
        print(detailViewController.pokemon!)
        
        self.navigationController?.pushViewController(detailViewController, animated: true)


    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as! PokemonCell
        let target = pokemonList[indexPath.row]
        
        let img = UIImage(named: "\(target.image).jpg")
        cell.pokemonImageView?.image = img
        cell.nameLabel?.text = target.name
        cell.selectionStyle = .none
        cell.numberLabel?.text = "No.\(String(target.number))"
        cell.backgroundColor = UIColor.systemGray6
        
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
          
    }
}

