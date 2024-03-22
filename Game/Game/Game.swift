//
//  Game.swift
//  Game
//
//  Created by nastasya on 16.03.2024.
//

import Foundation

final class Game {
    static let shared = Game()
    var session: GameSession? = nil
    var questionsSequence: QuestionSequence = .direct
    var records: [String: [Record]] {
        didSet {
            recordsCaretaker.save(records: self.records)
        }
    }
    private let recordsCaretaker = RecordsCaretaker()
    
    private init() {
        self.records = self.recordsCaretaker.retrieveRecords()
    }
    
    func addRecords() {
        let date = formatDate()
        if records.keys.contains(date) {
            records[date]?.append(Game.shared.session?.record ?? Record())
        } else {
            records[date] = [Game.shared.session?.record ?? Record()]
        }
        session = nil
    }
    
    private func formatDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM"
        formatter.locale = Locale(identifier: "RU_ru")
        let date = formatter.string(from: Game.shared.session?.record.date ?? Date())
        print(date)
        return date
    }
}
