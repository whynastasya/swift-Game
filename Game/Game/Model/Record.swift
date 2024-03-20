//
//  Record.swift
//  Game
//
//  Created by nastasya on 16.03.2024.
//

import Foundation

struct Record: Codable {
    var date: Date = Date()
    var questionsCount: Int = 0
    var correctAnswersCount: Int = 0
    var hintsCount: Int = 0
    var score: Int = 0
}
