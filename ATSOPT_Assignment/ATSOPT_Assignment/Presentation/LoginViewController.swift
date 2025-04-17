//
//  LoginViewController.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 4/16/25.
//

import UIKit

import SnapKit

final class LoginViewController: UIViewController {
    
    // MARK: - Property
    
    let loginTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "TVING ID 로그인"
        label.textColor = .white
        label.font = .pretendard(size: 23, weight: .regular)
        return label
    }()
    
    var idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.setPlaceholderColor(.gray2)
        textField.textColor = .gray2
        textField.backgroundColor = .gray4
        textField.font = .pretendard(size: 15, weight: .bold)
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 3
        return textField
    }()
    
    var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.setPlaceholderColor(.gray2)
        textField.textColor = .gray2
        textField.backgroundColor = .gray4
        textField.font = .pretendard(size: 15, weight: .bold)
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 3
        return textField
    }()
    
    let loginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("로그인하기", for: .normal)
        btn.titleLabel?.font = .pretendard(size: 14, weight: .bold)
        btn.setTitleColor(.gray2, for: .normal)
        btn.layer.borderColor = UIColor(named: "gray4")?.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 3
        return btn
    }()
    
    let findIDLabel: UILabel = {
        let label = UILabel()
        label.text = "아이디 찾기"
        label.font = .pretendard(size: 14, weight: .bold)
        label.textColor = .gray2
        return label
    }()
    
    let findPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호 찾기"
        label.font = .pretendard(size: 14, weight: .bold)
        label.textColor = .gray2
        return label
    }()
    
    let barView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray4
        return view
    }()
    
    let signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "아직 계정이 없으신가요?"
        label.font = .pretendard(size: 14, weight: .bold)
        label.textColor = .gray3
        return label
    }()
    
    let nicknameButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("닉네임 만들러가기", for: .normal)
        btn.titleLabel?.font = .pretendard(size: 14, weight: .regular)
        btn.setTitleColor(.gray2, for: .normal)
        btn.backgroundColor = .none
        btn.setUnderline()
        return btn
    }()
    
    var middleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 30
        return stackView
    }()
    
    var bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 33
        return stackView
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        
        idTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // MARK: - Func
    
    private func setUI() {
        view.backgroundColor = .black
        
        self.view.addSubviews(
            loginTitleLabel,
            idTextField,
            passwordTextField,
            loginButton,
            middleStackView,
            bottomStackView
        )
        
        middleStackView.addArrangedSubviews(
            findIDLabel,
            barView,
            findPasswordLabel
        )
        
        bottomStackView.addArrangedSubviews(
            signUpLabel,
            nicknameButton
        )
    }
    
    private func setLayout() {
        loginTitleLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(120)
        }
        
        idTextField.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginTitleLabel.snp.bottom).offset(25)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(idTextField.snp.bottom).offset(5)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passwordTextField.snp.bottom).offset(10)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        barView.snp.makeConstraints{
            $0.width.equalTo(1)
            $0.height.equalTo(12)
        }
        
        middleStackView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
        }
        
        bottomStackView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(middleStackView).offset(33)
        }
    }
}

// MARK: - extension

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(named: "gray2")?.cgColor
        textField.layer.borderWidth = 1
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.clear.cgColor
        textField.layer.borderWidth = 0
    }
}
