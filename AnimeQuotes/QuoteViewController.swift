//
//  QuoteViewController.swift
//  AnimeQuotes
//
//  Created by Rowby Villanueva on 8/4/25.
//

import UIKit

class QuoteViewController: UIViewController {

    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var AnimeQuote: UITextView!
    
    
    @IBAction func didTapFavoriteButton(_ sender: UIButton) {
        
        sender.isSelected.toggle()
        
        if sender.isSelected {
            quoteText.addToFavorites()
        } else {
            quoteText.removeFromFavorites()
        }
    }
    
    var quoteText: QuoteDetails!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        //quoteText.content because we are looking at the quotedetails struct
        //The quotes are inside .content in that struct
        //the name of the character is also inside that
        
        AnimeQuote.text = "\(quoteText.content)\n\n- \(quoteText.character.name)"
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
