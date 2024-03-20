//
//  ResultsTableView.swift
//  Game
//
//  Created by nastasya on 16.03.2024.
//

import UIKit

final class ResultsTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        delegate = self
        dataSource = self
        register(ResultTableViewCell.self, forCellReuseIdentifier: ResultTableViewCell.identifier)
        backgroundColor = .white
    }
}

extension ResultsTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        Game.shared.records.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionKey = Array(Game.shared.records.keys)[section]
        return Game.shared.records[sectionKey]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ResultTableViewCell.identifier, for: indexPath) as? ResultTableViewCell
        let recordsArray = Array(Game.shared.records.values)
        let record = recordsArray[indexPath.section]
        cell?.configure(withRecord: record[indexPath.row])
        return cell ?? UITableViewCell()
    }
}

extension ResultsTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let keys = Array(Game.shared.records.keys)
            if section < keys.count {
                return keys[section]
            } else {
                return nil
            }
    }
}
