//
//  Question.swift
//  Game
//
//  Created by nastasya on 10.03.2024.
//

import Foundation

struct Question {
    var question: String
    private var _answers: [Answer]
    var answers: [Answer] {
        get {
            return _answers
        }
        set(newAnswers) {
            guard newAnswers.count <= 4 else {
                fatalError("Максимальное количество ответов - 4")
            }
            _answers = newAnswers
        }
    }
    
    init(question: String, answers: [Answer]) {
        self.question = question
        let rightAnswerCount = answers.filter({ $0.isRight }).count
        if rightAnswerCount != 1 {
            fatalError("Должен быть только один правильный ответ")
        }
        if answers.count <= 4 {
            self._answers = answers
        } else {
            fatalError("Максимальное количество ответов - 4")
        }
    }
}

var questions = [Question(question: "Какое растение существует на самом деле?",
                          answers: [Answer(answer: "Лох чилийский", isRight: false),
                                    Answer(answer: "Лох индийский", isRight: true),
                                    Answer(answer: "Лох греческий", isRight: false),
                                    Answer(answer: "Лох русский", isRight: false)]),
                 Question(question: "Какое животное имеет второе название — кугуар?",
                          answers: [Answer(answer: "Оцелот", isRight: false),
                                    Answer(answer: "Леопард", isRight: false),
                                    Answer(answer: "Пума", isRight: true),
                                    Answer(answer: "Пантера", isRight: false)]),
                 Question(question: "Что в России 19 века делали в дортуаре?",
                          answers: [Answer(answer: "Ели", isRight: false),
                                    Answer(answer: "Спали", isRight: true),
                                    Answer(answer: "Ездили верхом ", isRight: false),
                                    Answer(answer: "Купались", isRight: false)]),
                 Question(question: "Какой химический элемент назван в честь злого подземного гнома?",
                          answers: [Answer(answer: "Гафний", isRight: false),
                                    Answer(answer: "Кобальт", isRight: true),
                                    Answer(answer: "Бериллий", isRight: false),
                                    Answer(answer: "Теллур", isRight: false)]),
                 Question(question: "Кто из перечисленных был пажом во времена Екатерины II?",
                          answers: [Answer(answer: "Д. И. Фонвизин", isRight: false),
                                    Answer(answer: "А. Н. Радищев", isRight: true),
                                    Answer(answer: "Г. Р. Державин", isRight: false),
                                    Answer(answer: "Н. М. Карамзин", isRight: false)]),
                 Question(question: "Сколько морей омывают Балканский полуостров?",
                          answers: [Answer(answer: "Три", isRight: false),
                                    Answer(answer: "Четыре", isRight: false),
                                    Answer(answer: "Пять", isRight: false),
                                    Answer(answer: "Шесть", isRight: true)]),
                 Question(question: "В какой из этих столиц бывших союзных республик раньше других появилось метро?",
                          answers: [Answer(answer: "Тбилиси", isRight: true),
                                    Answer(answer: "Ереван", isRight: false),
                                    Answer(answer: "Баку", isRight: false),
                                    Answer(answer: "Минск", isRight: false)]),
                 Question(question: "Кем был мужчина, послуживший моделью для известной картины «Американская готика» Гранта Вуда?",
                          answers: [Answer(answer: "Коммивояжером", isRight: false),
                                    Answer(answer: "Местным шерифом", isRight: false),
                                    Answer(answer: "Его зубным врачом", isRight: true),
                                    Answer(answer: "Его мясником", isRight: false)]),
                 Question(question: "Какое насекомое вызвало короткое замыкание в ранней версии вычислительной машины, тем самым породив термин «компьютерный баг» («баг» в переводе с англ. «насекомое»)?",
                          answers: [Answer(answer: "Мотылек", isRight: false),
                                    Answer(answer: "Таракан", isRight: true),
                                    Answer(answer: "Муха", isRight: false),
                                    Answer(answer: "Японский хрущик", isRight: false)])
]
