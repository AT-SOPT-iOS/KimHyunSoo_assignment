//
//  MainView.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 4/30/25.
//

import UIKit

import SnapKit
import Then

final class MainView: BaseView {
    
    // MARK: - UIComponents
    
    let scrollView = UIScrollView()
    
    let contentView = UIView()
    
    let headerStackView = UIStackView()
    
    let tabBarView = TabBarView()
    
    let todayTvingView = TodayTvingView()
    let realtimeLiveView = RealtimeLiveView()
    let realtimeMovieView = RealtimeMovieView()
    let baseballView = BaseballView()
    let sponsorView = SponsorView()
    let khLifeView = KHLifeView()
    
    let noticeView = NoticeView()
    
    let logoImageView = UIImageView()
    let searchButton = UIButton()
    let smallLogoButton = UIButton()
    let mainMovieImageView = UIImageView()
    let askingLabel = UILabel()
    let termsLabel = UILabel()
    let privacyLabel = UILabel()
    let licenseLabel = UILabel()
    let recruitLabel = UILabel()
    let dotLabel1 = UILabel()
    let dotLabel2 = UILabel()
    let dotLabel3 = UILabel()
    
    // MARK: - UISetting
    
    override func setStyle() {
        self.do {
            $0.backgroundColor = .clear
        }
        
        logoImageView.do {
            $0.image = .tvingLogo
        }
        
        searchButton.do {
            $0.setImage(.search, for: .normal)
        }
        
        smallLogoButton.do {
            $0.setImage(.vLogo, for: .normal)
        }
        
        headerStackView.do {
            $0.axis = .horizontal
            $0.spacing = 10
            $0.alignment = .center
        }
        
        mainMovieImageView.do {
            $0.image = .whatSurname
        }
        
        askingLabel.do {
            $0.text = "고객문의"
            $0.font = .pretendard(.pretendardMedium, size: 11)
            $0.textColor = .gray2
        }
        
        termsLabel.do {
            $0.text = "이용약관"
            $0.font = .pretendard(.pretendardMedium, size: 11)
            $0.textColor = .gray2
        }
        
        privacyLabel.do {
            $0.text = "개인정보처리방침"
            $0.font = .pretendard(.pretendardMedium, size: 11)
            $0.textColor = .white
        }
        
        licenseLabel.do {
            $0.text = "사업자정보"
            $0.font = .pretendard(.pretendardMedium, size: 11)
            $0.textColor = .gray2
        }
        
        recruitLabel.do {
            $0.text = "인재채용"
            $0.font = .pretendard(.pretendardMedium, size: 11)
            $0.textColor = .gray2
        }
        
        [dotLabel1, dotLabel2, dotLabel3].forEach {
            $0.text = "·"
            $0.font = .pretendard(.pretendardMedium, size: 11)
            $0.textColor = .gray2
        }
    }
    
    override func setUI() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(
            logoImageView,
            headerStackView,
            tabBarView,
            mainMovieImageView,
            todayTvingView,
            realtimeLiveView,
            realtimeMovieView,
            baseballView,
            sponsorView,
            khLifeView,
            noticeView,
            askingLabel,
            termsLabel,
            privacyLabel,
            licenseLabel,
            recruitLabel,
            dotLabel1,
            dotLabel2,
            dotLabel3
        )
        headerStackView.addArrangedSubviews(
            searchButton,
            smallLogoButton
        )
    }
    
    override func setLayout() {
        scrollView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints{
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
        }
        
        logoImageView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(191)
            $0.height.equalTo(78)
        }
        
        searchButton.snp.makeConstraints{
            $0.width.height.equalTo(30)
            $0.top.equalToSuperview()
        }
        
        smallLogoButton.snp.makeConstraints{
            $0.width.height.equalTo(30)
            $0.top.equalToSuperview()
        }
        
        headerStackView.snp.makeConstraints{
            $0.centerY.equalTo(logoImageView.snp.centerY)
            $0.leading.equalTo(logoImageView.snp.trailing).offset(103)
        }
        
        tabBarView.snp.makeConstraints{
            $0.top.equalTo(logoImageView.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        mainMovieImageView.snp.makeConstraints{
            $0.top.equalTo(tabBarView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(500)
        }
        
        todayTvingView.snp.makeConstraints{
            $0.top.equalTo(mainMovieImageView.snp.bottom).offset(9)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(204)
        }
        
        realtimeLiveView.snp.makeConstraints{
            $0.top.equalTo(todayTvingView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(170)
        }
        
        realtimeMovieView.snp.makeConstraints{
            $0.top.equalTo(realtimeLiveView.snp.bottom).offset(18)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(192)
        }
        
        baseballView.snp.makeConstraints{
            $0.top.equalTo(realtimeMovieView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        sponsorView.snp.makeConstraints{
            $0.top.equalTo(baseballView.snp.bottom).offset(28)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        khLifeView.snp.makeConstraints{
            $0.top.equalTo(sponsorView.snp.bottom).offset(25)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(126)
        }
        
        noticeView.snp.makeConstraints{
            $0.top.equalTo(khLifeView.snp.bottom).offset(23)
            $0.horizontalEdges.equalToSuperview().inset(14)
        }
        
        askingLabel.snp.makeConstraints{
            $0.top.equalTo(noticeView.snp.bottom).offset(13)
            $0.leading.equalToSuperview().inset(20)
        }
        
        dotLabel1.snp.makeConstraints{
            $0.top.equalTo(noticeView.snp.bottom).offset(21)
            $0.leading.equalTo(askingLabel.snp.trailing).offset(3)
        }
        
        termsLabel.snp.makeConstraints{
            $0.top.equalTo(noticeView.snp.bottom).offset(13)
            $0.leading.equalTo(dotLabel1.snp.trailing).offset(3)
        }
        
        dotLabel2.snp.makeConstraints{
            $0.top.equalTo(noticeView.snp.bottom).offset(21)
            $0.leading.equalTo(termsLabel.snp.trailing).offset(3)
        }
        
        privacyLabel.snp.makeConstraints{
            $0.top.equalTo(noticeView.snp.bottom).offset(13)
            $0.leading.equalTo(dotLabel2.snp.trailing).offset(3)
        }
        
        licenseLabel.snp.makeConstraints{
            $0.top.equalTo(askingLabel.snp.bottom)
            $0.leading.equalToSuperview().inset(20)
        }
        
        dotLabel3.snp.makeConstraints{
            $0.top.equalTo(termsLabel.snp.bottom).offset(8)
            $0.leading.equalTo(licenseLabel.snp.trailing).offset(3)
        }
        
        recruitLabel.snp.makeConstraints{
            $0.top.equalTo(termsLabel.snp.bottom).offset(8)
            $0.leading.equalTo(dotLabel3.snp.trailing).offset(3)
            $0.bottom.equalToSuperview().inset(99)
        }
    }
}
