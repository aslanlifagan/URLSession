//
//  PostUseCase.swift
//  URLSession
//
//  Created by Aslanli Faqan on 29.11.24.
//

import Foundation
protocol PostUseCase {
    func getPostList(completion: @escaping((PostList?, CoreErrorModel?) -> Void))
    func createPost(body: [String : Any], completion: @escaping((PostDTO?, CoreErrorModel?) -> Void))
}
