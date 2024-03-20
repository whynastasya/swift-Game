//
//  ResultTableViewCell.swift
//  Game
//
//  Created by nastasya on 16.03.2024.
//

import UIKit

final class ResultTableViewCell: UITableViewCell {
    static let identifier = "ResultCell"
    
    private var percentView = UIView()
    private var percentLabel = UILabel()
    private var questionsCountLabel = UILabel()
    private var scoreLabel = UILabel()
    private var hintsCountLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupContentView() {
        contentView.backgroundColor = .systemGray6
        setupPercentView()
        setupPercentLabel()
        setupQuestionsCountLabel()
        setupScoreLabel()
        setupHintsCountLabel()
        setupConstraints()
    }
    
    private func setupPercentView() {
        percentView.layer.cornerRadius = 10
        percentView.translatesAutoresizingMaskIntoConstraints = false
        percentView.backgroundColor = .systemGray4
        contentView.addSubview(percentView)
    }
    
    private func setupPercentLabel() {
        percentLabel.text = "54.5%"
        percentLabel.font = .systemFont(ofSize: 20)
        percentLabel.textColor = .white
        percentLabel.translatesAutoresizingMaskIntoConstraints = false
        percentView.addSubview(percentLabel)
    }
    
    private func setupQuestionsCountLabel() {
        questionsCountLabel.font = .systemFont(ofSize: 18)
        questionsCountLabel.text = "Вопросы: 2/10"
        questionsCountLabel.textColor = .darkGray
        questionsCountLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(questionsCountLabel)
    }
    
    private func setupScoreLabel() {
        scoreLabel.text = "Очки: 200"
        scoreLabel.font = .systemFont(ofSize: 15)
        scoreLabel.textColor = .lightGray
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(scoreLabel)
    }
    
    private func setupHintsCountLabel() {
        hintsCountLabel.text = "Подсказки: 4"
        hintsCountLabel.font = .systemFont(ofSize: 15)
        hintsCountLabel.textColor = .lightGray
        hintsCountLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(hintsCountLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            percentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            percentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            percentView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            percentView.widthAnchor.constraint(equalTo: percentView.heightAnchor),
            
            percentLabel.centerXAnchor.constraint(equalTo: percentView.centerXAnchor),
            percentLabel.centerYAnchor.constraint(equalTo: percentView.centerYAnchor),
            
            questionsCountLabel.leadingAnchor.constraint(equalTo: percentView.trailingAnchor, constant: 10),
            questionsCountLabel.topAnchor.constraint(equalTo: percentView.topAnchor, constant: 5),
            
            hintsCountLabel.leadingAnchor.constraint(equalTo: questionsCountLabel.leadingAnchor),
            hintsCountLabel.bottomAnchor.constraint(equalTo: percentView.bottomAnchor, constant: -5),
            
            scoreLabel.leadingAnchor.constraint(equalTo: questionsCountLabel.leadingAnchor),
            scoreLabel.bottomAnchor.constraint(equalTo: hintsCountLabel.topAnchor, constant: -5)
        ])
    }
    
    private func calculatePercent(questionsCount: Int, rightAnswer: Int, hintsCount: Int) -> String {
        let n = Double(rightAnswer) - Double(hintsCount) * 0.5
        let result = n / Double(questionsCount) * 100
        if result > 70.0 {
            percentView.backgroundColor = .systemGreen
        }
        return String(format: "%.1f", result) + "%"
    }
    
    func configure(withRecord record: Record) {
        let percent = calculatePercent(questionsCount: record.questionsCount, rightAnswer: record.correctAnswersCount, hintsCount: record.hintsCount)
        percentLabel.text = percent
        questionsCountLabel.text = "Вопросы: \(record.correctAnswersCount)/\(record.questionsCount)"
        hintsCountLabel.text = "Подсказки: \(record.hintsCount)"
        scoreLabel.text = "Очки: \(record.score)"
    }
}
