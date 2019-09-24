//
//  ImgurGalleryModal.swift
//  ImgurGalleryAssignment
//
//  Created by Himanshu Garg on 14/09/19.
//  Copyright © 2019 Attra. All rights reserved.
//

import UIKit

struct ImgurGalleryModal {
    let imageName: String
    let imagePostedDate: String
    let numberOfImages: Int
    let galleryImageLink: String
    let points: Int
    let score: Int
    let topicId: Int

    init(name: String, date: String, image: String, count: Int, points: Int, score: Int, topicId: Int) {
        self.imageName = name
        self.imagePostedDate = date
        self.numberOfImages = count
        self.galleryImageLink = image
        self.points = points
        self.score = score
        self.topicId = topicId
    }
}
