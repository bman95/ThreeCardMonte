//
//  ViewController.swift
//  ThreeCardMonte
//
//  Created by Brendon Crowe on 12/9/22.
//

import UIKit

enum CardValue: Int {
    case card1, card2, card3
}

class ViewController: UIViewController {
    
    @IBOutlet weak var card1: UIButton!
    @IBOutlet weak var card2: UIButton!
    @IBOutlet weak var card3: UIButton!
    @IBOutlet weak var cardSelectionWas: UILabel!
    
    var kingCard = Int()
    let mainMessage = "Please select a card"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame()
        cardSelectionWas.text = mainMessage
    }
    
    func startGame() {
        kingCard = Int.random(in: 0...2)
        card1.isEnabled = true
        card2.isEnabled = true
        card3.isEnabled = true
    }
    
    func changeImage() {
        let card1Number = card1.tag
        let card2Number = card2.tag
        let card3Number = card3.tag
        
        if card1Number != kingCard {
            card1.setImage(UIImage(named: "threeCard"), for: .normal)
        } else {
            card1.setImage(UIImage(named: "kingCard"), for: .normal)
        }
        if card2Number != kingCard {
            card2.setImage(UIImage(named: "threeCard"), for: .normal)
        } else {
            card2.setImage(UIImage(named: "kingCard"), for: .normal)
        }
        if card3Number != kingCard {
            card3.setImage(UIImage(named: "threeCard"), for: .normal)
        } else {
            card3.setImage(UIImage(named: "kingCard"), for: .normal)
        }
    }
    
    func buttonsCannotBePressed() {
        card1.isEnabled = false
        card2.isEnabled = false
        card3.isEnabled = false
    }
    
    
    @IBAction func cardTapped(_ sender: UIButton) {
        
        // Below we are making a news instance of CardValue with case values == to sender tags
        // card1 = tag0, card2 = tag1, card3 = tag2
        
        guard let sender = CardValue(rawValue: sender.tag) else { return }
        
        switch sender {
        case .card1:
            if card1.tag == kingCard {
                cardSelectionWas.text = "You win!"
                card1.setImage(UIImage(named: "kingCard"), for: .normal)
                changeImage()
                card2.isEnabled = false
                card3.isEnabled = false
            } else {
                cardSelectionWas.text = "You loose..."
                card1.setImage(UIImage(named: "threeCard"), for: .normal)
                buttonsCannotBePressed()
                changeImage()
                card1.isEnabled = true
            }
            
        case .card2:
            if card2.tag == kingCard {
                cardSelectionWas.text = "You win!"
                card2.setImage(UIImage(named: "kingCard"), for: .normal)
                changeImage()
                card1.isEnabled = false
                card3.isEnabled = false
            } else {
                cardSelectionWas.text = "You loose..."
                card2.setImage(UIImage(named: "threeCard"), for: .normal)
                buttonsCannotBePressed()
                changeImage()
                card2.isEnabled = true
            }
            
        case .card3:
            if card3.tag == kingCard {
                cardSelectionWas.text = "You win!"
                card3.setImage(UIImage(named: "kingCard"), for: .normal)
                changeImage()
                card1.isEnabled = false
                card2.isEnabled = false
            } else {
                cardSelectionWas.text = "You loose..."
                card3.setImage(UIImage(named: "threeCard"), for: .normal)
                buttonsCannotBePressed()
                changeImage()
                card3.isEnabled = true
            }
            
        }
    }
    
    
    func resetGame() {
        card1.setImage(UIImage(named: "cardBackRed"), for: .normal)
        card2.setImage(UIImage(named: "cardBackRed"), for: .normal)
        card3.setImage(UIImage(named: "cardBackRed"), for: .normal)
        cardSelectionWas.text = mainMessage
        
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        startGame()
        resetGame()
    }
    
}



