//
//  CoreAPIConfiguration.swift
//  URLSession
//
//  Created by Aslanli Faqan on 29.11.24.
//

import Alamofire
import Foundation

protocol CoreAPIConfiguration: URLRequestConvertible {
    var baseURL: String {get}
    var mainPath: String {get}
    var path: String {get}
    var header: HTTPHeader {get}
    var method: HTTPMethod {get}
    var parameter: Parameters? {get}
}

extension CoreAPIConfiguration {
    func asURLRequest() throws -> URLRequest {
        let urlPath = baseURL + mainPath + path
        guard let url = URL(string: urlPath) else {
            throw CoreErrorModel.invalidURL()
        }
        var request = URLRequest(url: url)
        request.headers = [:]
        request.method = .post
        
        
        if let parameter = parameter {
            do  {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameter, options: [])
            }
            catch {
                throw CoreErrorModel.encodingError()
            }
        }
        return request
    }
}

