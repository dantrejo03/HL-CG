//
//  Card.swift
//  HL-CG
//
//  Created by Daniel Trejo on 1/24/24.
//

import UIKit

struct Cards {
    static var allValues = [
        Card(picture: UIImage(named: "2H")!, value: 2),
        Card(picture: UIImage(named: "3H")!, value: 3),
        Card(picture: UIImage(named: "4H")!, value: 4),
        Card(picture: UIImage(named: "5H")!, value: 5),
        Card(picture: UIImage(named: "6H")!, value: 6),
        Card(picture: UIImage(named: "7H")!, value: 7),
        Card(picture: UIImage(named: "8H")!, value: 8),
        Card(picture: UIImage(named: "9H")!, value: 9),
        Card(picture: UIImage(named: "10H")!, value: 10),
        Card(picture: UIImage(named: "JH")!, value: 11),
        Card(picture: UIImage(named: "QH")!, value: 12),
        Card(picture: UIImage(named: "KH")!, value: 13),
        Card(picture: UIImage(named: "AH")!, value: 14),
         
        Card(picture: UIImage(named: "2S")!, value: 2),
        Card(picture: UIImage(named: "3S")!, value: 3),
        Card(picture: UIImage(named: "4S")!, value: 4),
        Card(picture: UIImage(named: "5S")!, value: 5),
        Card(picture: UIImage(named: "6S")!, value: 6),
        Card(picture: UIImage(named: "7S")!, value: 7),
        Card(picture: UIImage(named: "8S")!, value: 8),
        Card(picture: UIImage(named: "9S")!, value: 9),
        Card(picture: UIImage(named: "10S")!, value: 10),
        Card(picture: UIImage(named: "JS")!, value: 11),
        Card(picture: UIImage(named: "QS")!, value: 12),
        Card(picture: UIImage(named: "KS")!, value: 13),
        Card(picture: UIImage(named: "AS")!, value: 14),
         
        Card(picture: UIImage(named: "2C")!, value: 2),
        Card(picture: UIImage(named: "3C")!, value: 3),
        Card(picture: UIImage(named: "4C")!, value: 4),
        Card(picture: UIImage(named: "5C")!, value: 5),
        Card(picture: UIImage(named: "6C")!, value: 6),
        Card(picture: UIImage(named: "7C")!, value: 7),
        Card(picture: UIImage(named: "8C")!, value: 8),
        Card(picture: UIImage(named: "9C")!, value: 9),
        Card(picture: UIImage(named: "10C")!, value: 10),
        Card(picture: UIImage(named: "JC")!, value: 11),
        Card(picture: UIImage(named: "QC")!, value: 12),
        Card(picture: UIImage(named: "KC")!, value: 13),
        Card(picture: UIImage(named: "AC")!, value: 14),
      
        Card(picture: UIImage(named: "2D")!, value: 2),
        Card(picture: UIImage(named: "3D")!, value: 3),
        Card(picture: UIImage(named: "4D")!, value: 4),
        Card(picture: UIImage(named: "5D")!, value: 5),
        Card(picture: UIImage(named: "6D")!, value: 6),
        Card(picture: UIImage(named: "7D")!, value: 7),
        Card(picture: UIImage(named: "8D")!, value: 8),
        Card(picture: UIImage(named: "9D")!, value: 9),
        Card(picture: UIImage(named: "10D")!, value: 10),
        Card(picture: UIImage(named: "JD")!, value: 11),
        Card(picture: UIImage(named: "QD")!, value: 12),
        Card(picture: UIImage(named: "KD")!, value: 13),
        Card(picture: UIImage(named: "AD")!, value: 14)
    ]
}

class Card {
    var picture: UIImage
    var value: Int
    
    init(picture: UIImage, value: Int) {
        self.picture = picture
        self.value = value
    }
}
