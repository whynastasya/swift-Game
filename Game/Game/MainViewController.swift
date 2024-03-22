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
    private var settingsButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGameNameLabel()
        setupStartGameButton()
        setupGameResultButton()
        setupGameResultButton()
        setupSettingsButton()
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
    
    private func setupSettingsButton() {
        settingsButton.setImage(UIImage(systemName: "gearshape")?.withTintColor(.white, renderingMode: .alwaysOriginal).withConfiguration(UIImage.SymbolConfiguration(pointSize: 35)), for: .normal)
        settingsButton.backgroundColor = .lightGray
        settingsButton.layer.cornerRadius = 10
        settingsButton.imageView?.contentMode = .scaleAspectFit
        settingsButton.imageEdgeInsets = .init(top: 5, left: 5, bottom: 5, right: 5)
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.addTarget(self, action: #selector(showSettings), for: .touchUpInside)
        view.addSubview(settingsButton)
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
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            gameNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            gameNameLabel.widthAnchor.constraint(equalToConstant: view.bounds.width - 40),
            
            startGameButton.centerXAnchor.constraint(equalTo: gameNameLabel.centerXAnchor),
            startGameButton.topAnchor.constraint(equalTo: gameNameLabel.bottomAnchor, constant: 50),
            startGameButton.widthAnchor.constraint(equalToConstant: view.bounds.width / 2),
            
            settingsButton.trailingAnchor.constraint(equalTo: startGameButton.trailingAnchor),
            settingsButton.topAnchor.constraint(equalTo: startGameButton.bottomAnchor, constant: 10),

            gameResultButton.topAnchor.constraint(equalTo: startGameButton.bottomAnchor, constant: 10),
            gameResultButton.leadingAnchor.constraint(equalTo: startGameButton.leadingAnchor),
            gameResultButton.trailingAnchor.constraint(equalTo: settingsButton.leadingAnchor, constant: -5)
        ])
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
    
    @objc func showSettings() {
        let settingViewController = SettingsViewController()
        settingViewController.modalPresentationStyle = .popover
        settingViewController.preferredContentSize = .init(width: 300, height: 150)
        guard let compactPopoverPresentationController = settingViewController.popoverPresentationController else { return }
        compactPopoverPresentationController.sourceView = view
        compactPopoverPresentationController.sourceRect = CGRect(
            x: view.bounds.midX,
            y: view.bounds.midY,
            width: 0,
            height: 0
        )
        compactPopoverPresentationController.delegate = self
        compactPopoverPresentationController.permittedArrowDirections = .init(rawValue: 0)
        present(settingViewController, animated: true)
    }
}

extension MainViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(
        for controller: UIPresentationController,
        traitCollection: UITraitCollection
    ) -> UIModalPresentationStyle {
        return .none
    }
    
    func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
        true
    }
}
