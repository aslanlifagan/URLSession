//
//  CommentDTO.swift
//  URLSession
//
//  Created by Aslanli Faqan on 22.11.24.
//

import Foundation
// MARK: - CommentDTO
struct CommentDTO: Codable {
    let postID, id: Int?
    let name, email, body: String?

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}

typealias CommentList = [CommentDTO]

extension CommentDTO: TitleSubtitleProtocol {
    var titleString: String {
        name ?? ""
    }
    
    var subtitleString: String {
        body ?? ""
    }
    
    
}
