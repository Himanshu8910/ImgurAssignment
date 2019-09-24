//
//  ImgurGalleryResponseModel.swift
//  ImgurGalleryAssignment
//
//  Created by Himanshu Garg on 13/09/19.
//  Copyright © 2019 Attra. All rights reserved.
//

import Foundation

struct ImgurGalleryResponseModel: Codable {
    var data: [PostDetails]?
}

struct PostDetails: Codable {
    var id: Int?
    var title: String?
    var datetime: Double?
    var score: Int?
    var points: Int?
    var images: [ImageDetails]?
    
    enum CodingKeys: String, CodingKey {
        case id = "topic_id"
        case title, datetime, score, points, images
   }
}

struct ImageDetails: Codable {
    var title: String?
    var link: String?
    var datetime: Double?
    var type: String?
}

