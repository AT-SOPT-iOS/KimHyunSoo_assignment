//
//  MovieListViewController.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 5/9/25.
//

import UIKit

import SnapKit
import Then

final class MovieListViewController: UIViewController {
    
    // MARK: - UIComponent
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    private var movieList: [MovieListResponseBody] = []
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchMovieList(targetDt: "20230807")
        setLayout()
        setDelegate()
        register()
    }
    
    private func setLayout() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    private func setDelegate() {
        tableView.dataSource = self
    }
    
    private func register() {
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        tableView.rowHeight = 100
    }
    
    private func fetchMovieList(targetDt: String) {
        Task {
            do {
                let movie = try await GetMovieListService.shared.fetchDailyMovieList(targetDate: targetDt)
                movieList = movie
                tableView.reloadData()
            } catch {
                print(error)
            }
        }
    }
}

extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
        cell.dataBind(movieList[indexPath.row])
        return cell
    }
}
