//
//  DetailViewController.swift
//  Pokedex
//
//  Created by Junho Yoon on 2023/10/19.
//

import UIKit
import Alamofire

class DetailViewController: UIViewController {
        
    var img: UIImage?
    
    var index: Int?
    
    var pokemonName = ""
    
    var type: [String]?
    
    
    
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
    
    
    @IBOutlet weak var pokemonType: PokemonAbilityView!

    @IBOutlet weak var pokemonHeight: PokemonAbilityView!

    @IBOutlet weak var pokemonWeight: PokemonAbilityView!

    @IBOutlet weak var pokemonAbility: PokemonAbilityView!
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var widghtLabel: UILabel!
    @IBOutlet weak var abilityLabel: UILabel!
    
    
    
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let hasIndex = index else {
            return
        }
        
        requestAPI(index: String(hasIndex))
        
        self.loadImage(urlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(hasIndex).png") { image in
            DispatchQueue.main.async {
                self.pokemonImageView?.image = image
            }
        }
        
        numberLabel.text = "No.\(String(hasIndex))"
        nameLabel.text = pokemonName

    }
    
    func requestAPI(index: String) {
        var request = AF.request("https://pokeapi.co/api/v2/pokemon/\(index)", method: .get).responseJSON {
            response in

            print("Result: \(String(describing: response.result))")
            
            switch response.result {
            case .success:
                guard let result = response.data else {return}

                do {
                    let decoder = JSONDecoder()
                    let json = try decoder.decode(PokemonModel.self, from: result)
                    
                    print("json \(json)")

                    print("type : \(json.types[0].type.name)")
//                    print("type : \(json.types[1].type.name)")
                    
                    
                    for i in 0..<json.types.count {
                        self.type?.append(json.types[i].type.name)
                        
                        print(self.type)
                        
//                        result.append(try transform(self[i]))
//                        formIndex(after: &i)
                      }
                    
                    
                    let height = json.height
                    let weight = json.weight
                    
                    self.heightLabel.text = String(height)
                    self.widghtLabel.text = String(weight)
                    
                    
                } catch {
                    print("error!\(error)")
                }
            default:
                return
            }
            
        }
    }
}
