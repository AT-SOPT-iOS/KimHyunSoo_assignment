//
//  TabBarView.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 4/30/25.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedIndex: Int = 0
    private let items = ["홈", "드라마", "예능", "영화", "스포츠", "뉴스"]

    var body: some View {
        VStack(spacing: 4) {
            Picker("", selection: $selectedIndex) {
                ForEach(0..<items.count, id: \.self) { index in
                    Text(items[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .colorMultiply(.clear)
            .background(Color.clear)
            .foregroundColor(.white)
            .padding(.horizontal)

            GeometryReader { geometry in
                let segmentWidth = geometry.size.width / CGFloat(items.count)
                let selectedText = items[selectedIndex]
                let font = UIFont.systemFont(ofSize: 17)
                let textWidth = (selectedText as NSString).size(withAttributes: [.font: font]).width
                let xOffset = (segmentWidth - textWidth) / 2 + segmentWidth * CGFloat(selectedIndex)

                Rectangle()
                    .fill(Color.white)
                    .frame(width: textWidth, height: 3)
                    .offset(x: xOffset, y: 0)
                    .animation(.easeInOut, value: selectedIndex)
            }
            .frame(height: 3)
        }
    }
}

//import UIKit
//
//import SnapKit
//import Then
//
//final class TabBarView: BaseView {
//    
//    // MARK: - UIComponents
//    
//    let segmentControl = UISegmentedControl()
//    
//    let underLineView = UIView()
//    
//    // MARK: - UISetting
//    
//    override func setUI() {
//        segmentControl.do {
//            $0.insertSegment(withTitle: "홈", at: 0, animated: true)
//            $0.insertSegment(withTitle: "드라마", at: 1, animated: true)
//            $0.insertSegment(withTitle: "예능", at: 2, animated: true)
//            $0.insertSegment(withTitle: "영화", at: 3, animated: true)
//            $0.insertSegment(withTitle: "스포츠", at: 4, animated: true)
//            $0.insertSegment(withTitle: "뉴스", at: 5, animated: true)
//            
//            $0.selectedSegmentTintColor = .clear
//            $0.selectedSegmentIndex = 0
//            $0.setTitleTextAttributes(
//                [.foregroundColor: UIColor.white, .font: UIFont.pretendard(.pretendardMedium, size: 17)],
//                for: .normal
//            )
//            $0.setDividerImage(
//                UIImage(),
//                forLeftSegmentState: .normal,
//                rightSegmentState: .normal,
//                barMetrics: .default
//            )
//        }
//        
//        underLineView.do {
//            $0.backgroundColor = .white
//            $0.translatesAutoresizingMaskIntoConstraints = false
//        }
//    }
//    
//    override func setStyle() {
//        addSubviews(
//            segmentControl,
//            underLineView
//        )
//    }
//    
//    override func setLayout() {
//        segmentControl.snp.makeConstraints{
//            $0.top.equalToSuperview()
//            $0.centerX.equalToSuperview()
//            $0.width.height.equalToSuperview()
//        }
//    }
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        changeUnderLinePosition()
//    }
//    
//    // MARK: - Functions
//    
//    func changeUnderLinePosition() {
//        guard let title = segmentControl.titleForSegment(at: segmentControl.selectedSegmentIndex) else { return }
//        let font = UIFont.pretendard(.pretendardRegular, size: 17)
//        
//        let textWidth = (title as NSString).size(withAttributes: [.font: font]).width
//        let segmentWidth = segmentControl.frame.width / CGFloat(segmentControl.numberOfSegments)
//        let segmentX = segmentWidth * CGFloat(segmentControl.selectedSegmentIndex)
//        let centerX = segmentX + (segmentWidth - textWidth) / 2
//        
//        underLineView.snp.remakeConstraints {
//            $0.top.equalTo(segmentControl.snp.bottom).offset(4)
//            $0.leading.equalToSuperview().offset(centerX)
//            $0.width.equalTo(textWidth)
//            $0.height.equalTo(3)
//        }
//    }
//}
