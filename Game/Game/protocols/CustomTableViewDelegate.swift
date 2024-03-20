//
//  CustomTableViewDelegate.swift
//  Game
//
//  Created by nastasya on 16.03.2024.
//

import Foundation

protocol CustomTableViewDelegate: AnyObject {
    func didSelectItem(at indexPath: IndexPath)
}

