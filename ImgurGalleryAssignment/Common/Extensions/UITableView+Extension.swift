//
//  UITableView+Extension.swift
//  ImgurGalleryAssignment
//
//  Created by Himanshu Garg on 15/09/19.
//  Copyright © 2019 Attra. All rights reserved.
//

import UIKit

extension UITableView {
    func setErrorView(title: String, message: String) {
        let height = self.bounds.size.height
        let width = self.bounds.size.width
        let errorView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: width, height: height))
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        messageLabel.textColor = UIColor.lightGray
        messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        errorView.addSubview(titleLabel)
        errorView.addSubview(messageLabel)
        titleLabel.topAnchor.constraint(equalTo: errorView.topAnchor, constant: 60).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: errorView.centerXAnchor).isActive = true
        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: errorView.leftAnchor, constant: 20).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: errorView.rightAnchor, constant: -20).isActive = true
        titleLabel.text = title
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        // The only tricky part is here:
        self.backgroundView = errorView
        self.separatorStyle = .none
    }

    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}
