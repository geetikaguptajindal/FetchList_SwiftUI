//
//  NetworkManager.swift
//  AwaitDmeo
//
//  Created by Geetika Gupta on 22/07/23.
//

import Foundation

enum HttpError: Error {
    case badRequest
    case notSuccess
    case decodeError
    case unauthorize
    case invalidUrl
    case unknown
    case noDataFound
    case noError
}

protocol NetworkManager {
    func performRequest<T:Decodable>(withTarget targetpoint: TargetType, response: T.Type) async throws -> T
}

final class DefaultNetworkManger: NetworkManager {
    
    private let urlSession: URLSession
    
    init( _urlSession: URLSession = URLSession.shared) {
        self.urlSession = _urlSession
    }
    
    func performRequest<T:Decodable>(withTarget targetpoint: TargetType, response: T.Type) async throws -> T {
        
        let path = targetpoint.basePath + targetpoint.endPath
        guard let url = URL(string: path) else { throw HttpError.invalidUrl }
        
        var urlComponents = URLComponents(url: url , resolvingAgainstBaseURL: false)
        if let parameter = targetpoint.parameter {
            urlComponents?.queryItems = parameter.map({ URLQueryItem(name: $0.key, value: "\($0.value)")})
        }
        
        guard let url = urlComponents?.url else {
            throw HttpError.invalidUrl
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = targetpoint.method.rawValue
        do {
            let (data, httpResponse) = try await urlSession.data(for: request)
            
            guard let statusCode = (httpResponse as? HTTPURLResponse)?.statusCode else {
                throw HttpError.unknown
            }
            
            switch(statusCode) {
            case (200...299):
                guard let responseData = try? JSONDecoder().decode(response.self, from: data) else {
                    throw HttpError.decodeError
                }
                return responseData

            case 404:
                throw HttpError.unauthorize
                
            case 403:
                throw HttpError.badRequest
                
            default:
                throw HttpError.unknown
            }
        } catch(let error) {
            throw error
        }
    }
}
