//
//  PostDTO.swift
//  URLSession
//
//  Created by Aslanli Faqan on 22.11.24.
//

import Foundation
// MARK: - PostDTO
struct PostDTO: Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias PostList = [PostDTO]

extension PostDTO: TitleSubtitleProtocol {
    var titleString: String {
        title ?? ""
    }
    
    var subtitleString: String {
        body ?? ""
    }
    
    
}
