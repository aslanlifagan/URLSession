//
//  AllCountryHelper.swift
//  URLSession
//
//  Created by Aslanli Faqan on 06.12.24.
//

import Foundation
enum AllCountryHelper {
    case all
    
    var endPoint: String {
        switch self {
            case .all: ""
        }
    }
    
    var mainPath: String {
        return "all/"
    }
    
    var path: URL? {
        return CoreAPIHelper.instance.makeURL(path: mainPath + endPoint)
    }
    
    
}
