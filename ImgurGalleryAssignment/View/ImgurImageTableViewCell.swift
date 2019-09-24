//
//  ImgurImageTableViewCell.swift
//  ImgurGalleryAssignment
//
//  Created by Himanshu Garg on 13/09/19.
//  Copyright © 2019 Attra. All rights reserved.
//

import UIKit
import SDWebImage
class ImgurImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageTitle: UILabel!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var availableImages: UILabel!
    @IBOutlet weak var imgurImage: UIImageView!

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    /**
     Holds the model object of type ImgurGalleryModal.
     */

    var imgurImageObj: ImgurGalleryModal? {
        didSet {
            cellDataSet()
        }
    }

    /**
     Configure the cell attributes with the ImgurGalleryModal data.
     */

    func cellDataSet() {
        imageTitle.text = imgurImageObj?.imageName ?? ""
        postDate.text = imgurImageObj?.imagePostedDate ?? ""
        availableImages.text = String("More \(imgurImageObj?.numberOfImages ?? 0)")
        guard let stringUrl = imgurImageObj?.galleryImageLink else { return }
        if let url = URL(string: stringUrl) {
            self.imgurImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
            self.imgurImage.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder.png"))
        }
    }
}
