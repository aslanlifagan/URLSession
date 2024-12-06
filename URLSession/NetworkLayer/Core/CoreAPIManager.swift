//
//  CoreAPIManager.swift
//  URLSession
//
//  Created by Aslanli Faqan on 22.11.24.
//

import Foundation
import Alamofire

final class CoreAPIManager {
    static let instance = CoreAPIManager()
    private init() {}
    
    func request<T: Decodable>(
        type: T.Type,
        route: CoreAPIConfiguration,
        completion: @escaping((T?,CoreErrorModel?) -> Void)
    ) {
        print("URL:", route.urlRequest?.url ?? "")
        print("body: \(String(data: try! JSONSerialization.data(withJSONObject: route.parameter ?? [:], options: .prettyPrinted), encoding: .utf8)!)")
        AF.request(route).response { [weak self] response in
            guard let self = self else {return}
            guard let statusCode = response.response?.statusCode else {return}
            print("statusCode",statusCode)
            
            switch response.result {
                case .success(let data):
                    guard let data = data else {return}
                    handleResponse(data: data, completion: completion)
                    break
                case .failure(let error):
                    completion(nil, CoreErrorModel(code: statusCode, message: error.localizedDescription))
                    break
            }
        }
//        let session = URLSession.shared
//        var request = URLRequest(url: url)
//        request.allHTTPHeaderFields = header
//        request.httpMethod = method.rawValue
//        if !body.isEmpty {
//            let bodyData = try? JSONSerialization.data(withJSONObject: body, options: [])
//            request.httpBody = bodyData
//            print("body: \(String(data: try! JSONSerialization.data(withJSONObject: body, options: .prettyPrinted), encoding: .utf8)!)")
//        }
//        
//        
//        let task = session.dataTask(with: url) { [weak self] data, response, error in
//            guard let self = self else {return}
//            guard let response = response as? HTTPURLResponse else {return}
//            if response.statusCode == 401 {
//                completion(.failure(CoreErrorModel.authError(code: response.statusCode)))
//            }
//            
//            print(response.statusCode)
//            guard let error = error else {
//                guard let data = data else {return}
//                handleResponse(data: data, completion: completion)
//                return
//            }
//            completion(.failure(CoreErrorModel(code: response.statusCode, message: error.localizedDescription)))
//        }
//        task.resume()
    }
    
    fileprivate func handleResponse<T: Decodable>( // Json'u Parse etdiyimiz function
        data: Data,
        completion: @escaping((T?,CoreErrorModel?) -> Void)
    ) {
        do {
            let response = try JSONDecoder().decode(T.self, from: data)
            print("Response:",response)
            completion(response, nil)
        }
        catch {
            completion(nil, CoreErrorModel.decodingError())
        }
    }
}
