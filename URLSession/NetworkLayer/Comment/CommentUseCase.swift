//
//  CommentUseCase.swift
//  URLSession
//
//  Created by Aslanli Faqan on 29.11.24.
//

import Foundation
protocol CommentUseCase {
    func getCommentList(completion: @escaping((CommentList?, CoreErrorModel?) -> Void))
    func getCommentList(with postId: Int, completion: @escaping((CommentList?, CoreErrorModel?) -> Void))
}
