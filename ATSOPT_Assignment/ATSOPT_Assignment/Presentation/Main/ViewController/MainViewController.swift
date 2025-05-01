//
//  MainViewController.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 4/30/25.
//

import UIKit

import SnapKit
import Then

final class MainViewController: UIViewController {
    
    // MARK: - Property
    
    private let rootView = MainView()
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setActions()
    }
    
    // MARK: - Functions
    
    private func setActions() {
        self.rootView.tabBarView.segmentControl.addTarget(self, action: #selector(changeUnderLinePosition), for: .valueChanged)
    }
    
    @objc
    private func changeUnderLinePosition(_ segment: UISegmentedControl) {
        rootView.tabBarView.changeUnderLinePosition()
    }
}
