//
//  NetworkRequestState.swift
//  
//
//
//

import Foundation

public enum NetworkRequestState<T> {
    case idle
    case loading
    case success(T)
    case failure(Error)
}
