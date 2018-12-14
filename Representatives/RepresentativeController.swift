//
//  RepresentativeController.swift
//  Representatives
//
//  Created by Steve Lederer on 12/13/18.
//  Copyright © 2018 Steve Lederer. All rights reserved.
//

import Foundation

class RepresentativeController {
    static let baseURL = URL(string: "https://whoismyrepresentative.com/")
    
    // MARK: - Fetching
    //URL SHOULD LOOK LIKE THIS: https://whoismyrepresentative.com/getall_reps_bystate.php?state=VT&output=json
    static func searchRepresentatives(forState state: String, completion: @escaping ([Representative]?) -> Void) {
        // URL
        guard var url = baseURL else { completion(nil) ; return }
        url.appendPathComponent("getall_reps_bystate.php")
        var componenents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let stateQueryItem = URLQueryItem(name: "state", value: state)
        let jsonQueryItem = URLQueryItem(name: "output", value: "json")
        componenents?.queryItems = [stateQueryItem, jsonQueryItem]
        
        guard let requestURL = componenents?.url else { completion(nil) ; return }
        
        print("📡📡📡 \(requestURL.absoluteString) 📡📡📡")
        
        // REQUEST
        var request = URLRequest(url: requestURL)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        // DATATASK + RESUME
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print("❌ There was an error in \(#function) ; \(error.localizedDescription) ❌")
                completion(nil)
                return
            }
            guard let data = data, let responseDataString = String(data: data, encoding: .ascii), let fixedData = responseDataString.data(using: .utf8) else { completion(nil) ; return }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let topLevelDictionary = try jsonDecoder.decode(TopLevelDictionary.self, from: fixedData)
                let representatives = topLevelDictionary.results
                completion(representatives)
            } catch {
                print("❌ There was an error in \(#function) ; \(error.localizedDescription)❌")
                completion(nil)
                return
            }
        }.resume()

    }
}
