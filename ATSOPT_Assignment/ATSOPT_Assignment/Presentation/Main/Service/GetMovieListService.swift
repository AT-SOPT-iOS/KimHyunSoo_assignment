//
//  GetMovieListService.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 5/9/25.
//

import UIKit

final class GetMovieListService {
    static let shared = GetMovieListService()
    private init() {}
    
    func makeRequest(targetDt: String) -> URLRequest? {
        var urlString = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"
        
        urlString += "?key=\(KEY)"
        urlString += "&targetDt=20230807"
        
        guard let url = URL(string: urlString) else { return nil }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        return request
    }
    
    func fetchDailyMovieList(targetDate: String) async throws -> [MovieListResponseBody] {
        guard let request = makeRequest(targetDt: targetDate) else {
            throw NetworkError.requestEncodingError
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        dump(response)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...209).contains(httpResponse.statusCode) else {
            throw NetworkError.responseError
        }
        
        do {
            let decoded = try JSONDecoder().decode(MovieListResponseWrapper.self, from: data)
            return decoded.boxOfficeResult.dailyBoxOfficeList
        } catch {
            print("디코딩 실패:", error)
            throw NetworkError.responseDecodingError
        }
    }
}
