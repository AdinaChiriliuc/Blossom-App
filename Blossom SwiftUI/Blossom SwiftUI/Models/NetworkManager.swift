//
//  NetworkManager.swift
//  Blossom SwiftUI
//
//  Created by Adina Chiriliuc on 14/08/2020.
//  Copyright © 2020 Adina Chiriliuc. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    
  @Published var posts = [Post]()
    
    
    func fetchData() {
        if let url = URL(string: "https://demo0510215.mockable.io") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                    let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                            
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
        
    }
}
