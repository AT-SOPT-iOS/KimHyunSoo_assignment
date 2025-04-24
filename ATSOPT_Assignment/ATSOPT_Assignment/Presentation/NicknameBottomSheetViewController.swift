//
//  NicknameBottomSheetViewController.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 4/24/25.
//

import UIKit

import SnapKit

protocol NicknameDelegate: AnyObject {
    func bindNickname(nickname: String)
}

final class NicknameBottomSheetViewController: UIViewController {
    
    // MARK: - Property
    
    weak var nicknameDelegate: NicknameDelegate?
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 23, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "닉네임을 입력해주세요"
        return label
    }()
    
    var nickNameTextField: UITextField = {
       let textField = UITextField()
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 14, weight: .medium)
        textField.backgroundColor = .gray2
        textField.layer.cornerRadius = 3
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        textField.leftViewMode = .always
        return textField
    }()
    
    let saveButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("저장하기", for: .normal)
        btn.titleLabel?.font = .pretendard(size: 14, weight: .medium)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .brandColorRed
        btn.layer.cornerRadius = 12
        return btn
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        addTarget()
    }
    
    // MARK: - UISetting
    
    private func setUI() {
        view.backgroundColor = .white
        
        self.view.addSubviews(
            titleLabel,
            nickNameTextField,
            saveButton
        )
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(45)
            $0.leading.equalToSuperview().inset(20)
        }
        
        nickNameTextField.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(21)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        saveButton.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(332)
            $0.height.equalTo(52)
        }
    }
    
    // MARK: - Func
    
    private func addTarget() {
        saveButton.addTarget(self, action: #selector (saveButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func saveButtonDidTap() {
        let nickname = nickNameTextField.text ?? ""
        nicknameDelegate?.bindNickname(nickname: nickname)
        dismiss(animated: true)
    }
}
