//
//  QuestionView.swift
//  Game
//
//  Created by nastasya on 12.03.2024.
//

import UIKit

final class QuestionView: UIView {
    
    private var questionLabel = UILabel()
    var questionText: String = ""
    
    convenience init(frame: CGRect, questionText: String) {
        self.init(frame: frame)
        self.questionText = questionText
        setupQuestionView()
    }
    
    private func setupQuestionView() {
        layer.cornerRadius = 20
        backgroundColor = .white
        setupQuestionLabel()
        setupConstraints()
    }
    
    private func setupQuestionLabel() {
        questionLabel.font = .systemFont(ofSize: 20)
        questionLabel.textAlignment = .center
        questionLabel.numberOfLines = 6
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.text = questionText
        addSubview(questionLabel)
    }

    private func setupConstraints() {
        let guide = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            questionLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            questionLabel.centerYAnchor.constraint(equalTo: guide.centerYAnchor),
            questionLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20),
            questionLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20)
        ])
    }
    
    func updateQuestion(with text: String) {
        questionLabel.text = text
    }
}
