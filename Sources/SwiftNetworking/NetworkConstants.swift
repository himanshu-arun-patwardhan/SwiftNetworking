//
//  NetworkConstants.swift
//
//
//
//

import Foundation

public enum NetworkConstants {
    public static let contentType = "application/json"
    
    public static func authorizationHeader(token: String) -> String {
        return "Bearer \(token)"
    }
    
    public static func defaultHeader() -> [String: String] {
        return [
            "Content-Type": contentType
        ]
    }
    
    public static func authorizedHeaders(token: String) -> [String: String] {
        return [
            "Authorization": authorizationHeader(token: token),
            "Content-Type": contentType
        ]
    }
}
