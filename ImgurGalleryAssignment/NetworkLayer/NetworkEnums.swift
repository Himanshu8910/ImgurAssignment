//
//  NetworkEnums.swift
//  ImgurGalleryAssignment
//
//  Created by Himanshu Garg on 15/09/19.
//  Copyright © 2019 Attra. All rights reserved.
//

typealias Parameters = [String: Any]

enum Task {
    case requestPlain
    case requestParameters(Parameters)
}

enum ParametersEncoding {
    case url
    case json
}

enum NetworkError {
    case networkError
    case unknown
    case noJSONData
}

enum NetworkResponse<T> {
    case success(T)
    case failure(NetworkError)
    case err(Error)
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}
