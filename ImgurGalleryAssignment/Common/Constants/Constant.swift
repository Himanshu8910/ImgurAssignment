//
//  Constant.swift
//  ImgurGalleryAssignment
//
//  Created by Himanshu Garg on 15/09/19.
//  Copyright © 2019 Attra. All rights reserved.
//

struct ImgurURLConstants {
    static let baseURL = "https://api.imgur.com"
    static let gallerySearchPath = "/3/gallery/search/top/week"
    static let weeklyTopImagePath = "/3/gallery/top/top/week/0"
    static let queryParamName = "q"

}

struct DateFormat {
    static let dateFormat = "dd/MM/yyyy h:mm a"
}

struct AlertMessages {
    static let noResultFoundTitle = "No search results found."
    static let noResultFoundMsg = "Please search with a valid keyword or pull down the table to load weekly top images."
    static let emptySearchBarTitle = "Alert"
    static let emptySearchBarMessage = "Please enter a valid text or pull down the table to load weekly top images."
    static let errorTitle = "Error"

}
