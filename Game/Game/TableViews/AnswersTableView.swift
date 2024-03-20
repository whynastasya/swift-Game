//
//  AnswersTableView.swift
//  Game
//
//  Created by nastasya on 12.03.2024.
//

import UIKit

final class AnswersTableView: UITableView {
    var answers: [Answer] = []
    weak var customDelegate: CustomTableViewDelegate?
    
    convenience init(frame: CGRect, style: UITableView.Style, answers: [Answer]) {
        self.init(frame: frame, style: style)
        self.answers = answers
        setupTableView()
    }

    private func setupTableView() {
        self.delegate = self
        self.dataSource = self
        self.register(AnswerTableViewCell.self, forCellReuseIdentifier: AnswerTableViewCell.identifier)
        isScrollEnabled = false
    }
}

extension AnswersTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AnswerTableViewCell.identifier, for: indexPath) as? AnswerTableViewCell
        cell?.configure(answer: answers[indexPath.row])
        return cell ?? UITableViewCell()
    }
}

extension AnswersTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.bounds.height / CGFloat(answers.count)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        customDelegate?.didSelectItem(at: indexPath)
    }
}
