//
//  TargetType.swift
//  AAA_Test
//
//  Created by Geetika Gupta on 12/09/23.
//

import Foundation

protocol TargetType {
    var method: HttpMethod { get }
    var parameter: [String: String]? { get }
    var basePath: String { get }
    var endPath: String { get }
}

extension TargetType {
    var method: HttpMethod {
        return HttpMethod.get
    }
}

enum HttpMethod: String {
    case get = "get"
    case post = "post"
}

