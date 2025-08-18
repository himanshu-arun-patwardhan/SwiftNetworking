//
//  NetworkRequestManager.swift
//
//
//
//

import Foundation

public final class NetworkRequestManager: NetworkRequestProtocol {
    
    public init() {}
    
    public func request<T>(
        _ type: T.Type,
        url: URL,
        method: NetworkRequestHTTPMethod = .GET,
        headers: [String : String]? = nil,
        body: Data? = nil
    ) async throws -> T where T : Decodable {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        headers?.forEach({ (key: String, value: String) in
            request.setValue(value, forHTTPHeaderField: key)
        })
        
        request.httpBody = body
        
//        Logger.log("🌐 Request Started", level: .info, category: .network)
//        Logger.log("➡️ URL: \(url)", level: .debug, category: .network)
//        Logger.log("➡️ Method: \(method.rawValue)", level: .debug, category: .network)
//        Logger.log("➡️ Headers: \(headers ?? [:])", level: .debug, category: .network)
        if let body = body, let bodyString = String(data: body, encoding: .utf8) {
//            Logger.log("➡️ Body: \(bodyString)", level: .debug, category: .network)
        }
        
        let (data, response): (Data, URLResponse)
        do {
            (data, response) = try await URLSession.shared.data(for: request)
        } catch {
//            Logger.log("❌ Request Failed: (Unknown Error) \(error)", level: .error, category: .network)
            throw NetworkRequestError.unknown(error)
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
//            Logger.log("❌ Invalid response format", level: .error, category: .network)
            throw NetworkRequestError.invalidResponse
        }
//        Logger.log("✅ Response Status: \(httpResponse.statusCode)", level: .info, category: .network)
        
        switch httpResponse.statusCode {
        case 200..<300:
            /// Success: Do nothing
            break
        case 401:
//            Logger.log("❌ Unauthorized - Token might be expired", level: .error, category: .network)
            throw NetworkRequestError.unauthorized
        case 403:
//            Logger.log("❌ Forbidden - Access denied", level: .error, category: .network)
            throw NetworkRequestError.forbidden
        case 404:
//            Logger.log("❌ Not Found - The resource does not exist", level: .error, category: .network)
            throw NetworkRequestError.notFound
        case 500..<600:
//            Logger.log("❌ Server Error - Something went wrong on the server", level: .error, category: .network)
            throw NetworkRequestError.serverError
        default:
//            Logger.log("❌ Custom Error - HTTP Status: \(httpResponse.statusCode)", level: .error, category: .network)
            throw NetworkRequestError.custom(httpResponse.statusCode)
        }
        
        guard (200..<300).contains(httpResponse.statusCode) else {
//            Logger.log("❌ HTTP Error - Status Code: \(httpResponse.statusCode)", level: .error, category: .network)
            throw NetworkRequestError.invalidResponse
        }
        
        do {
            if let jsonString = String(data: data, encoding: .utf8) {
//                Logger.log("Raw Response JSON: \n\(jsonString)", level: .debug, category: .network)
            } else {
//                Logger.log("Raw Response Data (non-UTF8): \n\(data)", level: .debug, category: .network)
            }
            let decodedData = try JSONDecoder().decode(T.self, from: data)
//            Logger.log("✅ Successfully Decoded Response \n\(decodedData)", level: .info, category: .network)
            return decodedData
        } catch {
            if let jsonString = String(data: data, encoding: .utf8) {
//                Logger.log("Raw Response JSON: \n\(jsonString)", level: .debug, category: .network)
            } else {
//                Logger.log("Raw Response Data (non-UTF8): \n\(data)", level: .debug, category: .network)
            }
//            Logger.log("❌ Decoding Error: \(error)", level: .error, category: .network)
            throw NetworkRequestError.decodingError
        }
    }
}
