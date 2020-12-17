//
//  NewsDetailViewController.swift
//  NewsApp
//
//  Created by Jerin Emmanuel on 12/17/20.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var thumbImageView: LazyImageView!
    @IBOutlet weak var headLineLabel: UILabel!
    @IBOutlet weak var byLineLabel: UILabel!
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var abstractLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: - Public members
    
    var news: News?
    
    // MARK: - Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = news?.title
        self.headLineLabel.text = news?.title
        self.byLineLabel.text = news?.byline
        self.sectionLabel.text = news?.section
        self.dateLabel.text = news?.published_date
        self.abstractLabel.text = news?.abstract
        self.thumbImageView.imageUrl = news?.bigImage
    }

}
