//
//  NetworkManager.swift
//  NBAapp
//
//  Created by Nicholas Gilbert on 8/20/21.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case url
    case other(Error)
    case data
    
    var localizedDescription: String {
        switch self {
        case .url:
            return NSLocalizedString("URL Failure, failed to convert to a URL", comment: "URL Failure")
        case .data:
            return NSLocalizedString("Data Corruption, the data is corrupted or could not be found", comment: "Data Corruption")
        case .other(let error):
            return NSLocalizedString(error.localizedDescription, comment: "Other Error")
        }
    }
}

enum NetworkURL {
    private static let baseUrl = "https://api.sportsdata.io/v3/nba"
    private static let apiKey = "?key=c108b77e7aa9473dbc4e69380f92e745"
    static let stadiums = "\(baseUrl)/scores/json/Stadiums\(apiKey)"
}

class NetworkManager {
    
    private let session = URLSession.shared
    
    func getStadiums(from urlS: String, completion: @escaping (Result<[Stadium], NetworkError>) -> Void) {
        
        guard let url = URL(string: urlS) else {
            completion(Result.failure(NetworkError.url))
            return
        }
        
        session.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(.other(error)))
                }
                return
            }
            
            if let data = data {
                do {
                    let response = try JSONDecoder().decode([Stadium].self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(response))
                    }
                } catch (let error) {
                    DispatchQueue.main.async {
                        completion(.failure(.other(error)))
                    }
                }
            } else {
                DispatchQueue.main.async {
                    completion(Result.failure(NetworkError.data))
                }
            }
            
        }.resume()
    }
    
}
