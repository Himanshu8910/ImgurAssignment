//
//  ImgurImageViewModel.swift
//  ImgurGalleryAssignment
//
//  Created by Himanshu Garg on 15/09/19.
//  Copyright © 2019 Attra. All rights reserved.
//

import UIKit

class ImgurImageViewModel {

    var arrayOfPostDetails: [PostDetails] = []
    var imgurGalleryModel: [ImgurGalleryModal]!

    /**
     Filters and keeps only images and gif from the result model.
     */

    func filterImageModel() {
        var imgurGalleryList: [ImgurGalleryModal] = []

        //Search results are sorted in reverse chronological order.
        let reversedPostDetailArray = arrayOfPostDetails.reversed()

        for obj in reversedPostDetailArray {

            guard let imageArray = obj.images else {
                continue
            }

            if let imageObjModel = imageArray.first(where: {$0.type?.hasSuffix("jpeg") ?? false || $0.type?.hasSuffix("jpg") ??  false || $0.type?.hasSuffix("png") ?? false || $0.type?.hasSuffix("gif") ?? false}) {

                let stringDate =  obj.datetime?.toString() ?? ""
                if let imageCount = obj.images?.count {
                    let additionalImagesCount = (imageCount  > 0) ? (imageCount - 1) : 0
                    imgurGalleryList.append(ImgurGalleryModal(name: obj.title ?? "", date: stringDate, image: imageObjModel.link ?? "", count: additionalImagesCount, points: obj.points ?? 0, score: Int(obj.score ?? 0), topicId: obj.id ?? 0))
                }
            }
        }

        imgurGalleryModel = imgurGalleryList
    }

    /**
    Filters the result with the even number of sum of Points, Scores and Topic Id
     */

    func filterImageModelWithPoints() {
        //Filter results where the sum of “points”, “score” and “topic_id” adds up to an even number
        let filteredArrayModel = imgurGalleryModel.filter {($0.score + $0.points + $0.topicId) % 2 == 0}
        imgurGalleryModel = filteredArrayModel
    }
}
