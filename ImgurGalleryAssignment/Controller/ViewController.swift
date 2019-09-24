//
//  ViewController.swift
//  ImgurGalleryAssignment
//
//  Created by Himanshu Garg on 13/09/19.
//  Copyright © 2019 Attra. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var toggleButton: UISwitch!

    var spinnerView = UIView()
    private let manager = APIManager()
    var imgurViewModel = ImgurImageViewModel()

    public let refreshControl = UIRefreshControl()

    var searchKeyword: String?

    // Adding gesture to dismiss the keyboard when tapped outside.
    lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        var gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        return gestureRecognizer
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        loadTopWeeklyImages()

        // Do any additional setup after loading the view.
    }

    private func setupTableView() {
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }

        refreshControl.addTarget(self, action: #selector(refreshImgurWeeklyData(_:)), for: .valueChanged)

        // remove empty cell separators of table view.
        tableView.tableFooterView = UIView()
    }

    @objc private func refreshImgurWeeklyData(_ sender: Any) {
        if let searchKeyword = searchKeyword, !searchKeyword.isEmpty {
            loadTopWeeklyImagesWithSearch(searchKeyword)
        } else {
            loadTopWeeklyImages()
        }
    }

    // MARK: Weekly top images.

    /**
     This function loads the default top images of the week from Ingur gallery.
    */
    func loadTopWeeklyImages() {
        manager.request(type: ImgurGalleryResponseModel.self, service: Service.allImages) { (response) in
            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
            }
            switch response {
            case let .success(model):
                if let data = model.data {
                    self.imgurViewModel.arrayOfPostDetails = data
                    self.imgurViewModel.filterImageModel()
                    self.refreshTableViewData()
                }
            case let .failure(error):
                print(error)
            case .err(let error):
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    self.addAlert(title: AlertMessages.errorTitle, message: error.localizedDescription)
                }
            }
        }
    }

    /**
     Scrolls the table view to top.
     */

    func scrollTableToTop() {
        if let model = self.imgurViewModel.imgurGalleryModel, model.count > 0 {
            let topIndex = IndexPath(row: 0, section: 0)
            self.tableView.scrollToRow(at: topIndex, at: .top, animated: true)
        }
    }

    // MARK: Weekly top images with search parameter.

    /**
     Fetches and display the weekly top images on the tableview.
     - Parameters: text to be searched on Imgur gallery.
     */
    func loadTopWeeklyImagesWithSearch(_ text: String) {
        manager.request(type: ImgurGalleryResponseModel.self, service: Service.searchImages(text: text)) { response in
            // update UI on the main thread.
            DispatchQueue.main.async {
                self.removeSpinner(spinnerView: self.spinnerView)
                self.refreshControl.endRefreshing()
            }
            switch response {
            case let .success(model):
                if let data = model.data {
                    self.imgurViewModel.arrayOfPostDetails = data
                    DispatchQueue.main.async {
                       self.imgurViewModel.filterImageModel()
                        if self.toggleButton.isOn {
                          self.imgurViewModel.filterImageModelWithPoints()
                        }
                        self.refreshTableViewData()
                    }
                }
            case let .failure(error):
                 print(error)
            case .err(let error):
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.addAlert(title: AlertMessages.noResultFoundTitle, message: error.localizedDescription)
                }
            }
        }
    }

    @objc func dismissKeyBoard() {
        searchBar.resignFirstResponder()
    }

    // MARK: Toggle Switch

    /**
     Toggle button which filters the result with the even number of sum of Points, Scores and Topic Id .
     */

    @IBAction func toggleSwitchButton(_ sender: Any) {
        if toggleButton.isOn {
           imgurViewModel.filterImageModelWithPoints()
        } else {
           imgurViewModel.filterImageModel()
        }
        refreshTableViewData()
    }

    func refreshTableViewData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.scrollTableToTop()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ImgurImageTableViewCell.identifier, for: indexPath) as? ImgurImageTableViewCell {
            cell.imgurImageObj =  self.imgurViewModel.imgurGalleryModel[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.imgurViewModel.imgurGalleryModel?.count == 0 {
            // Setting error view when no data found.
            tableView.setErrorView(title: AlertMessages.noResultFoundTitle, message: AlertMessages.noResultFoundMsg)
        } else {
            // Remove the error view from the table.
            tableView.restore()
        }
        return self.imgurViewModel.imgurGalleryModel?.count ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}

extension ViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let searchText = searchBar.text, !searchText.isEmpty else {
            searchKeyword = ""
            self.addAlert(title: AlertMessages.emptySearchBarTitle, message: AlertMessages.noResultFoundMsg)
            return
        }
        searchKeyword = searchText
        spinnerView = self.showSpinner(onView: self.view)
        loadTopWeeklyImagesWithSearch(searchText)
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        view.addGestureRecognizer(tapGestureRecognizer)
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        view.removeGestureRecognizer(tapGestureRecognizer)
    }
}
