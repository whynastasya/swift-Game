//
//  GameViewController.swift
//  Game
//
//  Created by nastasya on 10.03.2024.
//

import UIKit

final class GameViewController: UIViewController {

    private var questionNumberLabel = UILabel()
    private var questionView = QuestionView(frame: .zero, questionText: "")
    private var answersTableView = AnswersTableView(frame: .zero, style: .plain, answers: [Answer]())
    private var scoreLabel = UILabel()
    private var numberQuestion = 1
    private var hintButton = UIButton()
    private var sequenceStrategy: CreateQuestionsSequenceStrategy {
        switch Game.shared.questionsSequence {
            case .direct:
                return DirectQuestionsSequenceStrategy()
            case .random:
                return RandomQuestionsSequenceStrategy()
        }
    }
    private var questions = [Question]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        questions = sequenceStrategy.createQuestionsSequence()
        setupQuestionNumberLabel()
        setupScoreLabel()
        setupHintButton()
        setupQuestionView()
        setupAnswersTableView()
        setupConstraints()
        updateData()
        Game.shared.session?.gameDelegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        didEndGame()
    }
    
    private func updateData() {
        questionNumberLabel.text = "Вопрос \(numberQuestion)"
        answersTableView.answers = questions[numberQuestion - 1].answers
        answersTableView.reloadData()
        questionView.updateQuestion(with: questions[numberQuestion - 1].question)
        scoreLabel.text = "Счет: \(Game.shared.session?.record.score ?? 0)"
    }
    
    private func setupQuestionNumberLabel() {
        questionNumberLabel.font = .systemFont(ofSize: 15)
        questionNumberLabel.textAlignment = .center
        questionNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(questionNumberLabel)
    }
    
    private func setupScoreLabel() {
        scoreLabel.font = .systemFont(ofSize: 15)
        scoreLabel.text = "Счет: \(Game.shared.session?.record.score ?? 0)"
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scoreLabel)
    }
    
    private func setupHintButton() {
        hintButton.setTitle("Подсказка", for: .normal)
        hintButton.setTitleColor(.purple, for: .normal)
        hintButton.backgroundColor = .systemGray3
        hintButton.layer.cornerRadius = 5
        hintButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        hintButton.translatesAutoresizingMaskIntoConstraints = false
        hintButton.addTarget(self, action: #selector(useHint), for: .touchUpInside)
        view.addSubview(hintButton)
    }
    
    private func setupQuestionView() {
        questionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(questionView)
    }
    
    private func setupAnswersTableView() {
        answersTableView.customDelegate = self
        answersTableView.backgroundColor = .systemGray6
        answersTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(answersTableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            questionNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            questionNumberLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            
            scoreLabel.centerYAnchor.constraint(equalTo: questionNumberLabel.centerYAnchor),
            scoreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            
            hintButton.centerYAnchor.constraint(equalTo: questionNumberLabel.centerYAnchor),
            hintButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            hintButton.widthAnchor.constraint(equalToConstant: 100),
            
            questionView.topAnchor.constraint(equalTo: questionNumberLabel.bottomAnchor, constant: 10),
            questionView.widthAnchor.constraint(equalToConstant: view.bounds.width - 40),
            questionView.heightAnchor.constraint(equalTo: view.widthAnchor),
            questionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            answersTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -15),
            answersTableView.topAnchor.constraint(equalTo: questionView.bottomAnchor, constant: 15),
            answersTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            answersTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    @objc func useHint() {
        hintButton.isSelected = true
        if hintButton.state == .selected {
            Game.shared.session?.record.hintsCount += 1
        }
    }
}

extension GameViewController: CustomTableViewDelegate {
    func didSelectItem(at indexPath: IndexPath) {
        let state = answersTableView.answers[indexPath.row].isRight
        let cell = answersTableView.cellForRow(at: indexPath) as? AnswerTableViewCell
        if state {
            cell?.backView.backgroundColor = .systemGreen
            Game.shared.session?.record.score += numberQuestion*50
            Game.shared.session?.record.correctAnswersCount = numberQuestion
            numberQuestion += 1
            if numberQuestion <= questions.count {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    self.updateData()
                    cell?.backView.backgroundColor = .systemPurple
                })
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    self.dismiss(animated: true)
                })
            }
        } else {
            cell?.backView.backgroundColor = .systemRed
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                self.dismiss(animated: true)
            })
        }
    }
}

extension GameViewController: GameViewControllerDelegate {
    func didEndGame() {
        print(Game.shared.session?.record)
        Game.shared.addRecords()
    }
}
