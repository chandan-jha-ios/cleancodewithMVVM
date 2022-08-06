//
//  DashboardController+TableView.swift
//  CleanCodeMVVM
//
//  Created by Chandan Jha on 06/08/22.
//

import UIKit

extension DashboardController {

    func registerCells() {
        let nib = UINib(nibName: NewsTableViewCell.name, bundle: nil)
        newsTableView.register(nib, forCellReuseIdentifier: NewsTableViewCell.name)
    }
}

extension DashboardController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.news.count ?? 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.name,
                                                       for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        if let news = viewModel?.news(at: indexPath.row) {
            cell.setup(with: news)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.navigatetoDetails(for: indexPath.row)
    }
    
}
