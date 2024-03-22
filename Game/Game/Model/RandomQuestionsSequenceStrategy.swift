//
//  RandomQuestionsSequenceStrategy.swift
//  Game
//
//  Created by nastasya on 22.03.2024.
//

import Foundation

final class RandomQuestionsSequenceStrategy: CreateQuestionsSequenceStrategy {
    func createQuestionsSequence() -> [Question] {
        let randomQuestions = questions.shuffled()
        print(randomQuestions)
        return randomQuestions
    }
}
