//
//  Dictionary+URLEncodedForm.swift
//
//
//
//

import Foundation

public extension Dictionary where Key == String, Value == String {
    func urlEncodedFormData() -> Data? {
        map { key, value in
            let encodedKey = key.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            let encodedValue = value.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            return "\(encodedKey)=\(encodedValue)"
        }
        .joined(separator: "&")
        .data(using: .utf8)
    }
}
