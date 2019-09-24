//
//  UITableViewCell+Extension.swift
//  ImgurGalleryAssignment
//
//  Created by Himanshu Garg on 16/09/19.
//  Copyright © 2019 Attra. All rights reserved.
//

import UIKit

extension UITableViewCell {
    // Fetch TableViewCell identifier name
    static var identifier: String {
        return String(describing: self).components(separatedBy: ".").last!

    }

}
