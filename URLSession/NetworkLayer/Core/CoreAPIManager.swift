//
//  CoreAPIManager.swift
//  URLSession
//
//  Created by Aslanli Faqan on 22.11.24.
//

import Foundation
final class CoreAPIManager {
    static let instance = CoreAPIManager()
    private init() {}
    
    func request<T: Decodable>(
        type: T.Type,
        path: String,
        completion: @escaping((Result<T,Error>) -> Void)
    ) {
        guard let url = CoreAPIHelper.instance.makeURL(path: path) else {return}
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else {return}
            guard let response = response as? HTTPURLResponse else {return}
            print(response.statusCode)
            guard let error = error else {
                guard let data = data else {return}
                do {
                    let response = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(response))
                }
                catch {
                    completion(.failure(error))
                }
                return
            }
            completion(.failure(error))
            
        }
        task.resume()
    }
}
