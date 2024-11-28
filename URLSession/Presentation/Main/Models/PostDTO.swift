//
//  PostDTO.swift
//  URLSession
//
//  Created by Aslanli Faqan on 22.11.24.
//

import Foundation
// MARK: - PostDTO
struct PostDTO: Codable {
    let title, body: String?
    let userID, id: Int?
    
    enum CodingKeys: String, CodingKey {
        case title, body
        case userID = "userId"
        case id
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
