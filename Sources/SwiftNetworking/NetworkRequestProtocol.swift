//
//  NetworkRequestProtocol.swift
//
//
//
//

import Foundation

public protocol NetworkRequestProtocol {
    func request<T: Decodable>(
        _ type: T.Type,
        url: URL,
        method: NetworkRequestHTTPMethod,
        headers: [String: String]?,
        body: Data?
    ) async throws -> T
}
