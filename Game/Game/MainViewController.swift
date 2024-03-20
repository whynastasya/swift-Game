//
//  ViewController.swift
//  Game
//
//  Created by nastasya on 09.03.2024.
//

import UIKit

final class MainViewController: UIViewController {
    private var gameNameLabel = UILabel()
    private var startGameButton = UIButton()
    private var gameResultButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGameNameLabel()
        setupStartGameButton()
        setupGameResultButton()
        setupConstraints()
    }
    
    private func setupGameNameLabel() {
        let text = "Кто хочет стать миллионером"
        let textWithColor = "миллионером"
        let range = (text as NSString).range(of: textWithColor)
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.foregroundColor, value: UIColor.systemPurple, range: range)
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 45, weight: .bold), range: range)
        gameNameLabel.font = .systemFont(ofSize: 30, weight: .medium)
        gameNameLabel.attributedText = attributedString
        gameNameLabel.translatesAutoresizingMaskIntoConstraints = false
        gameNameLabel.numberOfLines = 2
        gameNameLabel.textAlignment = .center
        view.addSubview(gameNameLabel)
    }
    
    private func setupStartGameButton() {
        startGameButton.setTitle("Начать игру", for: .normal)
        startGameButton.backgroundColor = .systemPurple
        startGameButton.layer.cornerRadius = 10
        startGameButton.titleLabel?.font = .systemFont(ofSize: 25, weight: .semibold)
        startGameButton.translatesAutoresizingMaskIntoConstraints = false
        startGameButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        view.addSubview(startGameButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            gameNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            gameNameLabel.widthAnchor.constraint(equalToConstant: view.bounds.width - 40),
            
            startGameButton.centerXAnchor.constraint(equalTo: gameNameLabel.centerXAnchor),
            startGameButton.topAnchor.constraint(equalTo: gameNameLabel.bottomAnchor, constant: 50),
            startGameButton.widthAnchor.constraint(equalToConstant: view.bounds.width / 2),
            
            gameResultButton.centerXAnchor.constraint(equalTo: gameNameLabel.centerXAnchor),
            gameResultButton.topAnchor.constraint(equalTo: startGameButton.bottomAnchor, constant: 10),
            gameResultButton.widthAnchor.constraint(equalToConstant: view.bounds.width / 2)
        ])
    }
    
    private func setupGameResultButton() {
        gameResultButton.setTitle("Результаты", for: .normal)
        gameResultButton.backgroundColor = .lightGray
        gameResultButton.layer.cornerRadius = 10
        gameResultButton.titleLabel?.font = .systemFont(ofSize: 25, weight: .medium)
        gameResultButton.translatesAutoresizingMaskIntoConstraints = false
        gameResultButton.addTarget(self, action: #selector(showResults), for: .touchUpInside)
        view.addSubview(gameResultButton)
    }
    
    @objc func startGame() {
        let gameViewController = GameViewController()
        Game.shared.session = GameSession()
        Game.shared.session?.record.date = Date()
        Game.shared.session?.record.questionsCount = questions.count
        print(Game.shared.session?.record)
        present(gameViewController, animated: true)
    }
    
    @objc func showResults() {
        let resultsViewController = ResultsViewController()
        present(resultsViewController, animated: true)
    }
}

