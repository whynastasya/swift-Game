//
//  RecordsCaretaker.swift
//  Game
//
//  Created by nastasya on 17.03.2024.
//

import Foundation

final class RecordsCaretaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "records"
    
    func save(records: [String: [Record]]) { do {
        let data = try self.encoder.encode(records)
        UserDefaults.standard.set(data, forKey: key) } catch {
            print(error)
        }
    }
    
    func retrieveRecords() -> [String: [Record]] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return [:]
        }
        
        do {
            return try self.decoder.decode([String: [Record]].self, from: data)
        } catch {
            print(error)
            return [:]
        }
    }
}
