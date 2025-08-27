//
//  ViewController.swift
//  AnimeQuotes
//
//  Created by Rowby Villanueva on 8/4/25.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var backgroundPic: UIImageView!
    @IBOutlet weak var AnimeName: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundPic.image = UIImage(named: "background")
            backgroundPic.contentMode = .scaleAspectFill
            backgroundPic.clipsToBounds = true
        
        AnimeName.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder() // Dismiss the keyboard
        if let animeName = searchBar.text, !animeName.isEmpty {
            fetchQuotes(for: animeName)
        }
    }
    
    func fetchQuotes(for animeName: String) {
        let baseURL = "https://api.animechan.io/v1"
        let apiKey = "ani-2MY4KKU0d3m93tURGEsBi0TqnGkQcHrlDWjSoE2pafqL0C8k0phRmbO7EiA"
        
        let encodedName = animeName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? animeName
        let urlString = "\(baseURL)/quotes/random?anime=\(encodedName)"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(apiKey, forHTTPHeaderField: "x-api-key")

        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }

            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, (200...299).contains(statusCode) else {
                print("Response error: \(String(describing: response))")
                return
            }

            guard let data = data else {
                print("❌ Data is NIL")
                return
            }

            do {
                let quoteResponse = try JSONDecoder().decode(QuoteResponse.self, from: data)
                let quoteDetails = quoteResponse.data
                
                print("🔍 API Response - content: \(quoteDetails.content)")
                print("🔍 API Response - character: \(quoteDetails.character)")
                print("🔍 API Response - character name: \(quoteDetails.character.name)")
                
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "showQuote", sender: quoteDetails)
                }
            } catch {
                print("Decoding error: \(error.localizedDescription)")
            }
        }
        session.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("🚀 Prepare called with identifier: \(segue.identifier ?? "nil")")
        print("🚀 Sender type: \(type(of: sender))")
        
        if let quoteVC = segue.destination as? QuoteViewController {
            print("🔍 Destination instance: \(quoteVC)") 
            if let quoteDetails = sender as? QuoteDetails {
                print("🔍 About to set quoteText with:")
                print("   - content: \(quoteDetails.content)")
                print("   - character: \(quoteDetails.character.name)")
                
                quoteVC.quoteText = quoteDetails
                print("✅ Successfully set quoteText")
                
                // Let's also try setting the text directly here as a test
                print("🧪 Testing if we can access the destination's outlets...")
            } else {
                print("❌ Sender is not QuoteDetails")
            }
        } else {
            print("❌ Destination is not QuoteViewController")
        }
    }
}

