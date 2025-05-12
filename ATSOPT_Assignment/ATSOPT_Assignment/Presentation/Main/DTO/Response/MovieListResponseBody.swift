//
//  MovieListResponseBody.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 5/9/25.
//

import UIKit

struct MovieListResponseWrapper: Codable {
    let boxOfficeResult: MovieListResponseModel
}

struct MovieListResponseModel: Codable {
    let boxofficeType: String
    let showRange: String
    let dailyBoxOfficeList: [MovieListResponseBody]
}

struct MovieListResponseBody: Codable {
    let rnum: String
    let rank: String
    let rankInten: String
    let rankOldAndNew: String
    let movieCd: String
    let movieNm: String
    let openDt: String
    let salesAmt: String
    let salesShare: String
    let salesInten: String
    let salesChange: String
    let salesAcc: String
    let audiCnt: String
    let audiInten: String
    let audiChange: String
    let audiAcc: String
    let scrnCnt: String
    let showCnt: String
}
