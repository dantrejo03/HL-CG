//
//  SecondScreen.swift
//  HL-CG
//
//  Created by Daniel Trejo on 1/24/24.
//

import UIKit

class SecondScreen: UIViewController {
    
    var TL_button   = UIButton()
    var TM_button   = UIButton()
    var TR_button   = UIButton()
    var ML_button   = UIButton()
    var C_button    = UIButton()
    var MR_button   = UIButton()
    var BL_button   = UIButton()
    var BM_button   = UIButton()
    var BR_button   = UIButton()
    
    var TL_img      = UIImageView()
    var TM_img      = UIImageView()
    var TR_img      = UIImageView()
    var ML_img      = UIImageView()
    var C_img       = UIImageView()
    var MR_img      = UIImageView()
    var BL_img      = UIImageView()
    var BM_img      = UIImageView()
    var BR_img      = UIImageView()
    
    let high_button = UIButton()
    let same_button = UIButton()
    let low_button  = UIButton()
    
    var table_buttons:  [UIButton] = []
    var table_cards:    [UIImageView] = []
    var guess_buttons:  [UIButton] = []
    
    var card_deck: [Card] = Cards.allValues
    var num_cards = 52
    var card_selection_tag: Int? = -1
    var table_values = [1,1,1,1,1,1,1,1,1]
    var flipped_piles: Set<Int> = []
    var last_card = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        
        initArrays()                    // create array of buttons and images for 9 cards
        //initImages(cards: table_cards)  // initializes the UIImages for 9 cards
        initButtons()                   // initializes the UIButtons for the 9 cards
        initGuessButtons()              // initializes the "higher", "lower", "same" buttons
        
    
            
            
            // resetBoard()
        }
        
        func initArrays() {
            table_cards = [TL_img, TM_img, TR_img,
                           ML_img, C_img, MR_img,
                           BL_img, BM_img, BR_img]
            
            table_buttons = [TL_button, TM_button, TR_button,
                             ML_button, C_button, MR_button,
                             BL_button, BM_button, BR_button]
            
            guess_buttons = [high_button, same_button, low_button]
        }
        /*
        func initImages(cards: [UIImageView]) {
            /*
            for card in cards {
                card.image = UIImage(named: "Card_backside")
                card.translatesAutoresizingMaskIntoConstraints = false
                card.layer.cornerRadius = 6
                card.layer.masksToBounds = true
                card.layer.borderWidth = 1.0
                card.layer.borderColor = UIColor.clear.cgColor
                card.layer.zPosition = 1
                
                view.addSubview(card)
            }
             */
            NSLayoutConstraint.activate([
                C_button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                C_button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                C_button.widthAnchor.constraint(equalToConstant: 107),
                C_button.heightAnchor.constraint(equalToConstant: 150)
            ])
            NSLayoutConstraint.activate([
                TM_button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                TM_button.bottomAnchor.constraint(equalTo: C_button.topAnchor, constant: -14),
                TM_button.widthAnchor.constraint(equalToConstant: 107),
                TM_button.heightAnchor.constraint(equalToConstant: 150)
            ])
            NSLayoutConstraint.activate([
                BM_button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                BM_button.topAnchor.constraint(equalTo: C_button.bottomAnchor, constant: 14),
                BM_button.widthAnchor.constraint(equalToConstant: 107),
                BM_button.heightAnchor.constraint(equalToConstant: 150)
            ])
            NSLayoutConstraint.activate([
                ML_button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                ML_button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                ML_button.widthAnchor.constraint(equalToConstant: 107),
                ML_button.heightAnchor.constraint(equalToConstant: 150)
            ])
            NSLayoutConstraint.activate([
                TL_button.bottomAnchor.constraint(equalTo: ML_button.topAnchor, constant: -14),
                TL_button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                TL_button.widthAnchor.constraint(equalToConstant: 107),
                TL_button.heightAnchor.constraint(equalToConstant: 150)
            ])
            NSLayoutConstraint.activate([
                BL_button.topAnchor.constraint(equalTo: ML_button.bottomAnchor, constant: 14),
                BL_button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                BL_button.widthAnchor.constraint(equalToConstant: 107),
                BL_button.heightAnchor.constraint(equalToConstant: 150)
            ])
            NSLayoutConstraint.activate([
                MR_button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                MR_button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                MR_button.widthAnchor.constraint(equalToConstant: 107),
                MR_button.heightAnchor.constraint(equalToConstant: 150)
            ])
            NSLayoutConstraint.activate([
                TR_button.bottomAnchor.constraint(equalTo: MR_button.topAnchor, constant: -14),
                TR_button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                TR_button.widthAnchor.constraint(equalToConstant: 107),
                TR_button.heightAnchor.constraint(equalToConstant: 150)
            ])
            NSLayoutConstraint.activate([
                BR_button.topAnchor.constraint(equalTo: MR_button.bottomAnchor, constant: 14),
                BR_button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                BR_button.widthAnchor.constraint(equalToConstant: 107),
                BR_button.heightAnchor.constraint(equalToConstant: 150)
            ])
        }
         */
        
        func initButtons() {
            
            for i in 0..<9 {
                let button = table_buttons[i]
                let card = card_from_deck()
                view.addSubview(button)
                
                
                button.configuration = .filled()
                
                button.setBackgroundImage(card.picture, for: .normal)
                table_values[i] = card.value
                button.translatesAutoresizingMaskIntoConstraints = false
                button.addTarget(self, action: #selector(cardSelected), for: .touchUpInside)
                
                /*
                NSLayoutConstraint.activate([
                    button.widthAnchor.constraint(equalToConstant: 104),
                    button.heightAnchor.constraint(equalToConstant: 147),
                    button.centerXAnchor.constraint(equalTo: table_cards[i].centerXAnchor),
                    button.centerYAnchor.constraint(equalTo: table_cards[i].centerYAnchor)
                ])
                 */
            }
            NSLayoutConstraint.activate([
                C_button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                C_button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                C_button.widthAnchor.constraint(equalToConstant: 107),
                C_button.heightAnchor.constraint(equalToConstant: 150)
            ])
            NSLayoutConstraint.activate([
                TM_button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                TM_button.bottomAnchor.constraint(equalTo: C_button.topAnchor, constant: -14),
                TM_button.widthAnchor.constraint(equalToConstant: 107),
                TM_button.heightAnchor.constraint(equalToConstant: 150)
            ])
            NSLayoutConstraint.activate([
                BM_button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                BM_button.topAnchor.constraint(equalTo: C_button.bottomAnchor, constant: 14),
                BM_button.widthAnchor.constraint(equalToConstant: 107),
                BM_button.heightAnchor.constraint(equalToConstant: 150)
            ])
            NSLayoutConstraint.activate([
                ML_button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                ML_button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                ML_button.widthAnchor.constraint(equalToConstant: 107),
                ML_button.heightAnchor.constraint(equalToConstant: 150)
            ])
            NSLayoutConstraint.activate([
                TL_button.bottomAnchor.constraint(equalTo: ML_button.topAnchor, constant: -14),
                TL_button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                TL_button.widthAnchor.constraint(equalToConstant: 107),
                TL_button.heightAnchor.constraint(equalToConstant: 150)
            ])
            NSLayoutConstraint.activate([
                BL_button.topAnchor.constraint(equalTo: ML_button.bottomAnchor, constant: 14),
                BL_button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                BL_button.widthAnchor.constraint(equalToConstant: 107),
                BL_button.heightAnchor.constraint(equalToConstant: 150)
            ])
            NSLayoutConstraint.activate([
                MR_button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                MR_button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                MR_button.widthAnchor.constraint(equalToConstant: 107),
                MR_button.heightAnchor.constraint(equalToConstant: 150)
            ])
            NSLayoutConstraint.activate([
                TR_button.bottomAnchor.constraint(equalTo: MR_button.topAnchor, constant: -14),
                TR_button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                TR_button.widthAnchor.constraint(equalToConstant: 107),
                TR_button.heightAnchor.constraint(equalToConstant: 150)
            ])
            NSLayoutConstraint.activate([
                BR_button.topAnchor.constraint(equalTo: MR_button.bottomAnchor, constant: 14),
                BR_button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                BR_button.widthAnchor.constraint(equalToConstant: 107),
                BR_button.heightAnchor.constraint(equalToConstant: 150)
            ])
            
            
        }
        
        func initGuessButtons() {
            view.addSubview(same_button)
            same_button.configuration = .filled()
            same_button.translatesAutoresizingMaskIntoConstraints = false
            same_button.configuration?.baseBackgroundColor = .systemBlue
            same_button.configuration?.title = "Same"
            
            NSLayoutConstraint.activate([
                same_button.widthAnchor.constraint(equalToConstant: 75),
                same_button.heightAnchor.constraint(equalToConstant: 50),
                same_button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                same_button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -27)
                
            ])
            
            view.addSubview(high_button)
            high_button.configuration = .filled()
            high_button.translatesAutoresizingMaskIntoConstraints = false
            high_button.configuration?.baseBackgroundColor = .systemGreen
            high_button.configuration?.title = "Higher"
            
            NSLayoutConstraint.activate([
                high_button.widthAnchor.constraint(equalToConstant: 125),
                high_button.heightAnchor.constraint(equalToConstant: 50),
                high_button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                high_button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -27)
                
            ])
            
            view.addSubview(low_button)
            low_button.configuration = .filled()
            low_button.translatesAutoresizingMaskIntoConstraints = false
            low_button.configuration?.baseBackgroundColor = .systemRed
            low_button.configuration?.title = "Lower"
            
            NSLayoutConstraint.activate([
                low_button.widthAnchor.constraint(equalToConstant: 125),
                low_button.heightAnchor.constraint(equalToConstant: 50),
                low_button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                low_button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -27)
                
            ])
        }
        
        func resetBoard() {
            for i in 0..<9 {
                let next_card = card_from_deck()
                table_cards[i].image = next_card.picture
            }
        }
        
        func card_from_deck () -> Card {
            let index = Int.random(in: 0..<num_cards)
            let card = card_deck[index]
            card_deck.remove(at: index)
            num_cards -= 1
            if (num_cards == 0) {
                last_card = true
            }
            return card
        }
        
        func change_button_status (status: Bool) {
            for button in guess_buttons {
                button.isEnabled = status
            }
        }
        
        
        
    @objc func cardSelected() {
            let nextScreen = ThirdScreen()
            navigationController?.pushViewController(nextScreen, animated: true)
            
    }
        
        
        
        
}

