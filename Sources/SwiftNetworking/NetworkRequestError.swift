//
//  NetworkRequestError.swift
//
//
//
//

import Foundation

public enum NetworkRequestError: Error, Equatable {
    case invalidResponse
    case unknown(Error)
    case decodingError
    case unauthorized /// 401
    case forbidden /// 403
    case notFound /// 404
    case serverError /// 500+
    case custom(Int) /// For handling other specific codes
    
    public static func == (lhs: NetworkRequestError, rhs: NetworkRequestError) -> Bool {
        switch (lhs, rhs) {
        case (.invalidResponse, .invalidResponse),
            (.decodingError, .decodingError),
            (.unauthorized, .unauthorized),
            (.forbidden, .forbidden),
            (.notFound, .notFound),
            (.serverError, .serverError):
            return true
        case (.custom(let code1), .custom(let code2)):
            return code1 == code2
        case (.unknown, .unknown):
            return true /// Or false if you want exact `Error` matching
        default:
            return false
        }
    }
}
