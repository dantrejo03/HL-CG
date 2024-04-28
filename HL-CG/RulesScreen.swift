//
//  RulesScreen.swift
//  HL-CG
//
//  Created by Daniel Trejo on 1/24/24.
//

import UIKit

class RulesScreen: UIViewController {

    let titleLabel = UILabel()
    let paragraphLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        titleLabel.text = "Rules"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 40)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)

        // Set up constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleLabel.widthAnchor.constraint(equalToConstant: 330),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
            
        ])

        
        // Set up paragraph label
        paragraphLabel.text = "There are nine cards face up. Pick one of the cards and guess wether the next card in the deck is higher, lower, or equal to it.\n\nIf you guess correctly, the new card is placed on top. If you guess incorrectly, that pile is flipped over and can no longer be used.\n\nIf all piles are flipped over or there are no more cards left, the game ends.\n\nYour score is the number of cards left.\n\nAce has the highest value, 2 has the lowest value, and suites are irrelevant"
        paragraphLabel.numberOfLines = 0
        paragraphLabel.textAlignment = .justified
        paragraphLabel.font = UIFont.systemFont(ofSize: 18)
        paragraphLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(paragraphLabel)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            
            paragraphLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            paragraphLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            paragraphLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            paragraphLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
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
