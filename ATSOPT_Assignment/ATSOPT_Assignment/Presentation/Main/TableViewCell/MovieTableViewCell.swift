//
//  MovieTableViewCell.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 5/9/25.
//

import UIKit

import SnapKit
import Then

final class MovieTableViewCell: UITableViewCell {
    
    static let identifier = "MovieTableViewCell"
    
    // MARK: - UIComponent
    
    let rankLabel = UILabel()
    let titleLabel = UILabel()
    let openDateLabel = UILabel()
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .black
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    
    private func setStyle() {
        rankLabel.do {
            $0.font = .pretendard(.pretendardBold, size: 19)
            $0.textColor = .white
            $0.transform = CGAffineTransform(rotationAngle: 0.07)
        }
        
        titleLabel.do {
            $0.textColor = .white
            $0.font = .pretendard(.pretendardMedium, size: 10)
        }
        
        openDateLabel.do {
            $0.textColor = .gray2
            $0.font = .pretendard(.pretendardRegular, size: 10)
        }
    }
    
    private func setUI() {
        addSubviews(
            rankLabel,
            titleLabel,
            openDateLabel
        )
    }
    
    private func setLayout() {
        rankLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(20)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(rankLabel.snp.top)
            $0.leading.equalTo(rankLabel.snp.trailing).offset(15)
        }
        
        openDateLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
    }
}

extension MovieTableViewCell {
    func dataBind(_ movie: MovieListResponseBody) {
        rankLabel.text = "\(movie.rank)위"
        titleLabel.text = movie.movieNm
        openDateLabel.text = "개봉일: \(movie.openDt)"
    }
}
