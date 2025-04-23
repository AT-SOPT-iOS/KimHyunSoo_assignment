//
//  WelcomeViewController.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 4/23/25.
//

import UIKit

import SnapKit

class WelcomeViewController: UIViewController {
    
    // MARK: - Property
    
    let tvingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .tving)
        return imageView
    }()
    
    var welcomeTextLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(size: 15, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    let mainButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .brandColorRed
        button.setTitleColor(.white, for: .normal)
        button.setTitle("메인으로", for: .normal)
        button.titleLabel?.font = .pretendard(size: 14, weight: .medium)
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    
    // MARK: - UISetting
    
    private func setUI() {
        view.backgroundColor = .black
        
        self.view.addSubviews(
            tvingImageView,
            welcomeTextLabel,
            mainButton
        )
    }
    
    private func setLayout() {
        tvingImageView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        welcomeTextLabel.snp.makeConstraints{
            $0.top.equalTo(tvingImageView.snp.bottom).offset(67)
            $0.centerX.equalToSuperview()
        }
        
        mainButton.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
    }
    
    // MARK: - Func
    
    private func bindID() {
        
    }
    
    @objc
    private func backToLoginButtonDidTap() {
        navigationController?.popToRootViewController(animated: true)
    }
}
