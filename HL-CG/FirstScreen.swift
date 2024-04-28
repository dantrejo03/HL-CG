//
//  FirstScreen.swift
//  HL-CG
//
//  Created by Daniel Trejo on 1/23/24.
//

import UIKit

class FirstScreen: UIViewController {
    
    let newGameButton = UIButton()
    let rulesButton = UIButton()
    let highscoreButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        view.backgroundColor = .systemBackground
        title = "First Screen"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }

    func setupButtons() {
        view.addSubview(newGameButton)
        
        // First Button setup
        newGameButton.configuration = .filled()
        newGameButton.configuration?.baseBackgroundColor = .systemGreen
        newGameButton.configuration?.title = "New Game"
        
        newGameButton.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
        
        newGameButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newGameButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            newGameButton.widthAnchor.constraint(equalToConstant: 300),
            newGameButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Second Button setup
        view.addSubview(rulesButton)
        
        rulesButton.configuration = .filled()
        rulesButton.configuration?.baseBackgroundColor = .systemRed
        rulesButton.configuration?.title = "Rules"
        
        rulesButton.addTarget(self, action: #selector(goToRules), for: .touchUpInside)
        
        rulesButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rulesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rulesButton.topAnchor.constraint(equalTo: newGameButton.bottomAnchor, constant: 20),
            rulesButton.widthAnchor.constraint(equalToConstant: 300),
            rulesButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Third button setup
        view.addSubview(highscoreButton)
        
        highscoreButton.configuration = .filled()
        highscoreButton.configuration?.baseBackgroundColor = .systemBlue
        highscoreButton.configuration?.title = "Highscores"
        
        highscoreButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            highscoreButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            highscoreButton.topAnchor.constraint(equalTo: rulesButton.bottomAnchor, constant: 20),
            highscoreButton.widthAnchor.constraint(equalToConstant: 300),
            highscoreButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
    }
    
    @objc func goToNextScreen() {
        let nextScreen = ThirdScreen()
        navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    @IBAction func goToRules() {
        let rS = RulesScreen()
        rS.modalPresentationStyle = .formSheet
        present(rS, animated: true, completion: nil)
    }

}

