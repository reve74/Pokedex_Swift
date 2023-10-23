//
//  ViewController.swift
//  Pokedex
//
//  Created by Junho Yoon on 2023/10/16.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var limit: Int?
    
    var allPokemonModel: AllPokemonModel?
    
    var resultModel: ResultModel?
    
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
        
        requestAPI()
    }
    
    func loadImage(urlString: String, completion: @escaping (UIImage?)-> Void){
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        if let hasURL = URL(string: urlString) {
            var request = URLRequest(url: hasURL)
            request.httpMethod = "GET"
            
            session.dataTask(with: request) { data, response, error in
//                print((response as! HTTPURLResponse).statusCode)
                
                if let hasData = data {
                    completion(UIImage(data: hasData))
                    return
                }
            }.resume()
            session.finishTasksAndInvalidate()
        }
        completion(nil)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPokemonModel?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = UIStoryboard(name: "DetailViewController", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        let index = indexPath.row + 1
        let pokemonData = self.allPokemonModel?.results[indexPath.row]

        
        detailViewController.index = index
        detailViewController.pokemonName = pokemonData?.name ?? ""
        
  
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as! PokemonCell
        
        let pokemonData = self.allPokemonModel?.results[indexPath.row]
        
        let index = indexPath.row + 1
        
        cell.nameLabel.text = pokemonData?.name
        cell.numberLabel.text = "#\(String(index))"

        self.loadImage(urlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(index).png") { image in
                DispatchQueue.main.async {
                    cell.pokemonImageView.image = image
                }
            }
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.systemGray6
        
        
        

        return cell
    }
    
    
    func requestAPI() {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        var components = URLComponents(string: "https://pokeapi.co/api/v2/pokemon")
        
        let limit = URLQueryItem(name: "limit", value: String(50))
        
        components?.queryItems = [limit]
        
        guard let url = components?.url else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { data, response, error in

            if let hasData = data {
                do {
                    self.allPokemonModel =  try JSONDecoder().decode(AllPokemonModel.self, from: hasData)
                    
                    print(self.allPokemonModel ?? "No Data")
 
                    DispatchQueue.main.async {
                        self.pokemonTableView.reloadData()
                    }
                }catch {
                    print(error)
                }
            }
        }
        
        task.resume()
        session.finishTasksAndInvalidate()
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
          
    }
}


extension UIImage {
    func loadImage(urlString: String, completion: @escaping (UIImage?)-> Void){
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        if let hasURL = URL(string: urlString) {
            var request = URLRequest(url: hasURL)
            request.httpMethod = "GET"
            
            session.dataTask(with: request) { data, response, error in
                print((response as! HTTPURLResponse).statusCode)
                
                if let hasData = data {
                    completion(UIImage(data: hasData))
                    return
                }
            }.resume()
            session.finishTasksAndInvalidate()
        }
        completion(nil)
    }
}

