//
//  AnimeData.swift
//  AnimeQuotes
//
//  Created by Rowby Villanueva on 8/4/25.
//

import Foundation


struct QuoteResponse: Codable {
    let status: String
    let data: QuoteDetails
}


struct QuoteDetails: Codable, Equatable{
    let content: String
    let anime: AnimeInfo
    let character: CharacterInfo
}


struct AnimeInfo: Codable, Equatable {
    let id: Int
    let name: String
    let altName: String?
}

// MARK: - Character info
struct CharacterInfo: Codable, Equatable {
    let id: Int
    let name: String
}


extension QuoteDetails {
    static var favoritesKey: String {
        return "Favorites"
    }
    
    static func save(_ animes: [QuoteDetails], forKey key: String){
        let defaults = UserDefaults.standard
        
        let encodedData = try! JSONEncoder().encode(animes)
        
        defaults.set(encodedData, forKey: key)
    }
    
    static func getQuotes(forKey key: String) -> [QuoteDetails] {
        let defaults = UserDefaults.standard
        
        if let data = defaults.data(forKey: key)
        {
            let decodedAnimes = try!
            JSONDecoder().decode([QuoteDetails].self, from: data)
            
            return decodedAnimes
        } else {
            return []
        }
    }
    
    func addToFavorites() {
        var favoriteAnimeQuotes = QuoteDetails.getQuotes(forKey: QuoteDetails.favoritesKey)
        favoriteAnimeQuotes.append(self)
        
        QuoteDetails.save(favoriteAnimeQuotes, forKey: QuoteDetails.favoritesKey)
        
        
    }
    
    func removeFromFavorites() {
        var favoriteAnimeQuotes = QuoteDetails.getQuotes(forKey: QuoteDetails.favoritesKey)
        
        favoriteAnimeQuotes.removeAll {
            //this closure executes for each item in the array
            //with that in mind
            //the item in the array that we pick
            //if it returns itself we will delete it
            quote in return self == quote
        }
        
        QuoteDetails.save(favoriteAnimeQuotes, forKey: QuoteDetails.favoritesKey)
    }
}

