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
        setupNameLabel()
        setupResultsTableView()
        setupConstraints()
    }
    
    private func setupNameLabel() {
        nameLabel.text = "История игр"
        nameLabel.font = .systemFont(ofSize: 25, weight: .medium)
        nameLabel.textColor = .gray
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
    }
    
    private func setupResultsTableView() {
        resultsTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultsTableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 25),
            
            resultsTableView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            resultsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            resultsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
