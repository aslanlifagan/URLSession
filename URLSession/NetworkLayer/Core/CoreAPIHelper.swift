//
//  CoreAPIHelper.swift
//  URLSession
//
//  Created by Aslanli Faqan on 22.11.24.
//

import Foundation
final class CoreAPIHelper {
    static let instance = CoreAPIHelper()
    private init() {}
    private let baseURL = "https://jsonplaceholder.typicode.com/"
    
    func makeURL(path: String) -> URL? {
        let urlString = baseURL + path
        return URL(string:urlString)
    }
}
