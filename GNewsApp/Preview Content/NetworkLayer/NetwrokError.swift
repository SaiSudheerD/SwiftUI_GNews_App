//
//  NetwrokError.swift
//  GNewsApp
//
//  Created by Suresby on 08/07/25.
//

import Foundation

enum NetworkError: LocalizedError {
    case badUrl
    case statusCode(Int)
    case decodingError
    case unknow(Error)
    
    var errorDescription: String? {
        switch self {
        case .badUrl:
            return "Invalid Request URL"
        case .statusCode(let code):
            switch code {
            case 403:
                return "Access Deined" //please check your API key.
            case 404:
                return "Not Found, The news you're looking for couldn't be found."
            case 500...599:
                return "Server Error, Please try again later"
            default:
                return "Unexcepted Error (\(code)"
                
            }
        case .decodingError:
            return "Failed to decode the news data" //
        case .unknow(let error):
            return error.localizedDescription
        }
    }
}
