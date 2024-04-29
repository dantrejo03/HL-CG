//
//  ThirdScreen.swift
//  HL-CG
//
//  Created by Daniel Trejo on 1/26/24.
//

import UIKit

class ThirdScreen: UIViewController {
    
    var card_piles: [UIButton] = []
    var guess_buttons: [UIButton] = []
    var pile_values = [0,0,0,0,0,0,0,0,0]
    
    var card_deck: [Card] = Cards.allValues
    
    var num_cards = 52
    var card_selection_tag: Int? = -1
    
    var flipped_piles: Set<Int> = []
    var last_card = false
    var cardSelected: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGreen
      
        configGuessingButtons()
        configBoard()
    }
    
    func configGuessingButtons() {
        let same_button = UIButton()
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
        
        let high_button = UIButton()
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
        
        let low_button = UIButton()
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
        
        guess_buttons = [high_button, same_button, low_button]
        changeGuessButtonStatus(isEnabled: false)
        
        for i in 0..<guess_buttons.count {
            guess_buttons[i].addTarget(self, action: #selector(makeGuess), for: .touchUpInside)
        }
    }
    
    func deal_9_Cards(isFaceDown: Bool) {
        clearBoard()
        
        for i in 0..<9 {
            var card = card_from_deck()
            var cardButton = createCard(card: card, flag: isFaceDown, tag: i)
            card_piles.append(cardButton)
            if (!isFaceDown) {
                pile_values[i] = card.value
            }
        }
    }
    
    func clearBoard() {
        for card in card_piles {
                    card.removeFromSuperview()
                }
                card_piles.removeAll()
    }
    
    func configBoard() {
        /*
        for i in 0..<card_piles.count {
            card_piles[i] = createCard(flag: true)
        }
         */
        
        deal_9_Cards(isFaceDown: false)
        
        NSLayoutConstraint.activate([
            card_piles[4].centerXAnchor.constraint(equalTo: view.centerXAnchor),
            card_piles[4].centerYAnchor.constraint(equalTo: view.centerYAnchor),
            card_piles[4].widthAnchor.constraint(equalToConstant: 107),
            card_piles[4].heightAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            card_piles[1].centerXAnchor.constraint(equalTo: view.centerXAnchor),
            card_piles[1].bottomAnchor.constraint(equalTo: card_piles[4].topAnchor, constant: -14),
            card_piles[1].widthAnchor.constraint(equalToConstant: 107),
            card_piles[1].heightAnchor.constraint(equalToConstant: 150)
        ])
        NSLayoutConstraint.activate([
            card_piles[7].centerXAnchor.constraint(equalTo: view.centerXAnchor),
            card_piles[7].topAnchor.constraint(equalTo: card_piles[4].bottomAnchor, constant: 14),
            card_piles[7].widthAnchor.constraint(equalToConstant: 107),
            card_piles[7].heightAnchor.constraint(equalToConstant: 150)
        ])
        NSLayoutConstraint.activate([
            card_piles[3].centerYAnchor.constraint(equalTo: view.centerYAnchor),
            card_piles[3].leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            card_piles[3].widthAnchor.constraint(equalToConstant: 107),
            card_piles[3].heightAnchor.constraint(equalToConstant: 150)
        ])
        NSLayoutConstraint.activate([
            card_piles[0].bottomAnchor.constraint(equalTo: card_piles[3].topAnchor, constant: -14),
            card_piles[0].leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            card_piles[0].widthAnchor.constraint(equalToConstant: 107),
            card_piles[0].heightAnchor.constraint(equalToConstant: 150)
        ])
        NSLayoutConstraint.activate([
            card_piles[6].topAnchor.constraint(equalTo: card_piles[3].bottomAnchor, constant: 14),
            card_piles[6].leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            card_piles[6].widthAnchor.constraint(equalToConstant: 107),
            card_piles[6].heightAnchor.constraint(equalToConstant: 150)
        ])
        NSLayoutConstraint.activate([
            card_piles[5].centerYAnchor.constraint(equalTo: view.centerYAnchor),
            card_piles[5].trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            card_piles[5].widthAnchor.constraint(equalToConstant: 107),
            card_piles[5].heightAnchor.constraint(equalToConstant: 150)
        ])
        NSLayoutConstraint.activate([
            card_piles[2].bottomAnchor.constraint(equalTo: card_piles[5].topAnchor, constant: -14),
            card_piles[2].trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            card_piles[2].widthAnchor.constraint(equalToConstant: 107),
            card_piles[2].heightAnchor.constraint(equalToConstant: 150)
        ])
        NSLayoutConstraint.activate([
            card_piles[8].topAnchor.constraint(equalTo: card_piles[5].bottomAnchor, constant: 14),
            card_piles[8].trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            card_piles[8].widthAnchor.constraint(equalToConstant: 107),
            card_piles[8].heightAnchor.constraint(equalToConstant: 150)
        ])
         
    }
    
    func createCard(card: Card, flag: Bool, tag: Int) -> UIButton {
        let cardButton = UIButton(type: .custom)
        
        let cardImage: UIImage
        if (flag) {
            cardImage = UIImage(named: "Card_backside")!
        } else {
            cardImage = card.picture
        }
        
        cardButton.setBackgroundImage(cardImage, for: .normal)
        cardButton.layer.cornerRadius = 6
        cardButton.clipsToBounds = true
        cardButton.tag = tag
        
        cardButton.addTarget(self, action: #selector(cardTapped), for: .touchUpInside)
        view.addSubview(cardButton)
        
        cardButton.translatesAutoresizingMaskIntoConstraints = false
        
        return cardButton
    }
    
    @objc func cardTapped(_ sender: UIButton) {
        changeCardButtonStatus(isEnabled: true)
        
        changeGuessButtonStatus(isEnabled: true)
        sender.isEnabled = false
        cardSelected = sender
    }
    
    @objc func makeGuess(_ sender: UIButton) {
        let cardValue = pile_values[cardSelected.tag]
        let newCard = card_from_deck()
        let difference = newCard.value - cardValue
        
        correctGuess(newCard: newCard)
        changeGuessButtonStatus(isEnabled: false)
        Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) { [self] timer in
            if (sender == guess_buttons[0]) {
                if (difference < 0) {
                    incorrectGuess()
                } else {
                    sender.isEnabled = true
                }
            } else if (sender == guess_buttons[1]) {
                if (difference != 0) {
                    incorrectGuess()
                } else {
                    sender.isEnabled = true
                }
            } else {
                if (difference > 0) {
                    incorrectGuess()
                } else {
                    sender.isEnabled = true
                }
            }
            
            
            let isGameOver = gameOverCheck()
            if (isGameOver != 0) {
                let gameWon = isGameOver == 1
                endGameScreen(status: gameWon)
            }
        }
    }
    
    func correctGuess(newCard: Card) {
        pile_values[cardSelected.tag] = newCard.value
        card_piles[cardSelected.tag].setBackgroundImage(newCard.picture, for: .normal)
    }
    
    func incorrectGuess() {
        pile_values[cardSelected.tag] = 0
        card_piles[cardSelected.tag].isEnabled = false
        card_piles[cardSelected.tag].setBackgroundImage(UIImage(named: "Card_backside"), for: .normal)
    }
    
    func changeGuessButtonStatus(isEnabled: Bool) {
        for i in 0..<guess_buttons.count {
            guess_buttons[i].isEnabled = isEnabled
        }
    }
    
    func changeCardButtonStatus(isEnabled: Bool) {
        for i in 0..<card_piles.count {
            if (pile_values[i] != 0) {
                card_piles[i].isEnabled = isEnabled
            }
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
    
    func gameOverCheck() -> Int {
        if (num_cards == 0) {
            return 1
        }
        let lost = [0,0,0,0,0,0,0,0,0]
        if (pile_values.allSatisfy { $0 == 0 }) {
            return -1
        }
        return 0
    }
    
    func endGameScreen (status: Bool) {
        //true -> win screen
        let screen = UIView(frame: UIScreen.main.bounds)
        let message = UILabel(frame: CGRect(x: 0, y: 0, width: 217.0, height: 44.33))
        message.center = self.view.center
        message.textAlignment = .center
        let time_duration: TimeInterval
        let score = UILabel(frame: CGRect(x: 0, y: 378, width: 217, height: 44.33))
        score.center.x = self.view.center.x
        score.textAlignment = .center
        score.text = "SCORE: \(num_cards)"
        score.textColor = .cyan
        
        if (!status) {
            message.text = "GAME OVER"
            message.textColor = .systemRed
            screen.backgroundColor = .black
            time_duration = 1.5
            
        } else {
            message.text = "WELL DONE"
            message.textColor = .green
            screen.backgroundColor = .white
            time_duration = 0.5
        }
        view.addSubview(screen)
        view.addSubview(message)
        view.addSubview(score)
        message.alpha = 0.0
        screen.alpha = 0.0
        score.alpha = 0.0
        UIView.animate(withDuration: time_duration, animations: {
            screen.alpha = 1.0
            message.alpha = 1.0
            score.alpha = 1.0
        })
    }
    

}
