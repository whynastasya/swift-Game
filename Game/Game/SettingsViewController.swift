//
//  SettingsViewController.swift
//  Game
//
//  Created by nastasya on 21.03.2024.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    private var nameLabel = UILabel()
    private var questionsTypeSegmentedControl = UISegmentedControl()
    private let questionsTypeLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNameLabel()
        setupQuestionsTypeLabel()
        setupQuestionTypeSegmentedControl()
        setupConstraints()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        Game.shared.questionsSequence = QuestionSequence(rawValue: questionsTypeSegmentedControl.selectedSegmentIndex)!
        print(Game.shared.questionsSequence)
    }
    
    private func setupNameLabel() {
        nameLabel.text = "Настройки"
        nameLabel.textColor = .gray
        nameLabel.textAlignment = .center
        nameLabel.font = .systemFont(ofSize: 25, weight: .medium)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
    }
    
    private func setupQuestionsTypeLabel() {
        questionsTypeLabel.text = "Последовательность вопросов"
        questionsTypeLabel.font = .systemFont(ofSize: 15, weight: .medium)
        questionsTypeLabel.textColor = .gray
        questionsTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(questionsTypeLabel)
    }
    
    private func setupQuestionTypeSegmentedControl() {
        questionsTypeSegmentedControl.insertSegment(withTitle: "Прямая", at: 0, animated: true)
        questionsTypeSegmentedControl.insertSegment(withTitle: "Случайная", at: 1, animated: true)
        questionsTypeSegmentedControl.selectedSegmentIndex = Game.shared.questionsSequence.rawValue
        questionsTypeSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(questionsTypeSegmentedControl)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),

            questionsTypeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            questionsTypeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            
            questionsTypeSegmentedControl.leadingAnchor.constraint(equalTo: questionsTypeLabel.leadingAnchor),
            questionsTypeSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            questionsTypeSegmentedControl.topAnchor.constraint(equalTo: questionsTypeLabel.bottomAnchor, constant: 10)
        ])
    }
    
    private func selectedQuestionsSequence() {
        
    }
}
