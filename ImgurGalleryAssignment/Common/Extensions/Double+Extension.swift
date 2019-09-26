//
//  Double+Extension.swift
//  ImgurGalleryAssignment
//
//  Created by Himanshu Garg on 24/09/19.
//  Copyright © 2019 Attra. All rights reserved.
//

import Foundation

extension Double {
    // Convert UNIX Timestamp to String
    func toString() -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set desired timezone
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = DateFormat.dateFormat //Specify date format
        let strDate = dateFormatter.string(from: date)
        return strDate

    }

}
