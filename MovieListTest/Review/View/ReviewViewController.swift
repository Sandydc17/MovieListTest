//
//  ReviewViewController.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 05/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    var presenter: ReviewViewToPresenter?
    
    @IBOutlet weak var reviewListView: UITableView!
    
    var movieID: Int?
    var index: Int?
    var page: Int = 1
    var dataReview: [Review] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.getReview(movieID: movieID ?? 0, page: page)
    }
    
    func addNewPage() {
        presenter?.getReview(movieID: movieID ?? 0, page: page)
    }

}

extension ReviewViewController: ReviewPresenterToView {
    
    func showError() {
        let alert = UIAlertController(title: "Error", message: Constant.errorMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showReview(review: ReviewModel) {
        if(page == 1 && review.reviews?.count == 0) {
            noDataView()
        }
        
        let (start, end) = (dataReview.count, review.reviews!.count + dataReview.count)
        let indexPath = (start..<end).map {return IndexPath(row: $0, section: 0)}
        
        dataReview.append(contentsOf: review.reviews!)
        reviewListView.insertRows(at: indexPath, with: .automatic)
        page+=1
        reviewListView.finishInfiniteScroll()
    }
    
    func setupView() {
        reviewListView.separatorColor = UIColor.white
        
        let nib = UINib(nibName: "ReviewCell", bundle: nil)
        self.reviewListView.register(nib, forCellReuseIdentifier: "reviewCell")
        
        self.reviewListView.backgroundColor = UIColor(rgb: Constant.movieCellBg[(self.index ?? 0) % Constant.movieCellBg.count])
        self.view.backgroundColor = UIColor(rgb: Constant.movieCellBg[(self.index ?? 0) % Constant.movieCellBg.count])
        
        reviewListView.addInfiniteScroll { (collectionView) -> Void in
            self.addNewPage()
        }
    }
    
    func noDataView() {
        let noDataLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: reviewListView.bounds.size.width, height: reviewListView.bounds.size.height))
        noDataLabel.text = "No Review"
        noDataLabel.textColor = UIColor.white
        noDataLabel.textAlignment = NSTextAlignment.center
        noDataLabel.font = noDataLabel.font.withSize(20)
        reviewListView.backgroundView = noDataLabel
        reviewListView.separatorStyle = .none
        reviewListView.alwaysBounceVertical = false
    }
    
}

extension ReviewViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataReview.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reviewCell", for: indexPath) as? ReviewCell else { fatalError() }

        let review = (dataReview[indexPath.item])
        cell.setupCell(review: review, index: self.index ?? 0)
        return cell
    }
}
