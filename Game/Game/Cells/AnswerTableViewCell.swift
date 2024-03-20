//
//  AnswerTableViewCell.swift
//  Game
//
//  Created by nastasya on 15.03.2024.
//

import UIKit

final class AnswerTableViewCell: UITableViewCell {
    
    static let identifier = "AnswerTableViewCell"
    private var answerLabel = UILabel()
    var backView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupContentView() {
        selectionStyle = .none
        setupBackView()
        setupAnswerLabel()
        setupConstraints()
    }
    
    private func setupBackView() {
        backView.backgroundColor = .systemPurple
        backView.layer.cornerRadius = 20
        backView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(backView)
    }
    
    private func setupAnswerLabel() {
        answerLabel.font = .systemFont(ofSize: 20)
        answerLabel.textAlignment = .center
        answerLabel.numberOfLines = 2
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        backView.addSubview(answerLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            answerLabel.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            answerLabel.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            answerLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
            answerLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20)
        ])
    }
    
    func configure(answer: Answer) {
        answerLabel.text = answer.answer
    }
}
