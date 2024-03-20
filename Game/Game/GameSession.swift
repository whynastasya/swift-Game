//
//  GameSession.swift
//  Game
//
//  Created by nastasya on 16.03.2024.
//

import Foundation

final class GameSession {
    var record: Record = Record()
    weak var gameDelegate: GameViewControllerDelegate?
}
