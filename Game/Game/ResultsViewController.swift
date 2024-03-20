//
//  ResultsViewController.swift
//  Game
//
//  Created by nastasya on 10.03.2024.
//

import UIKit

final  class ResultsViewController: UIViewController {
    private var nameLabel = UILabel()
    private var resultsTableView = ResultsTableView(frame: .zero, style: .insetGrouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupResultsTableView()
        setupConstraints()
        print(Game.shared.records)
    }
    
    private func setupResultsTableView() {
        resultsTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultsTableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            resultsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            resultsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            resultsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
