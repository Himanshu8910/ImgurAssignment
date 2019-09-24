//
//  APIConfiguration.swift
//  ImgurGalleryAssignment
//
//  Created by Himanshu Garg on 15/09/19.
//  Copyright © 2019 Attra. All rights reserved.
//

import Foundation

enum Service: ServiceProtocol {
    
    case allImages
    case searchImages(text: String)
    
    var baseURL: URL {
        return URL(string: ImgurURLConstants.baseURL)!
    }

    var path: String {
        switch self {
        case .allImages:
            return ImgurURLConstants.weeklyTopImagePath
        case .searchImages:
            return ImgurURLConstants.gallerySearchPath
        }
    }

    var method: HTTPMethod {
        return .get
    }

    var task: Task {
        switch self {
        case .allImages:
            return .requestPlain
        case let .searchImages(text):
            let parameters = [ImgurURLConstants.queryParamName: text]
            return .requestParameters(parameters)
        }
    }
    
    var headers: Headers? {
        if let clientId: String = Bundle.main.object(forInfoDictionaryKey: "Authorization") as? String {
            return ["Authorization": String("Client-ID \(clientId)")]
        }
        return [:]
    }

    var parametersEncoding: ParametersEncoding {
        return .url
    }
}
