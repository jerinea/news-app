//
//  NewsListCell.swift
//  NewsApp
//
//  Created by Jerin Emmanuel on 12/17/20.
//

import UIKit

class NewsListCell: UITableViewCell {
    
    @IBOutlet weak var thumbImageView: LazyImageView!
    @IBOutlet weak var headLineLabel: UILabel!
    @IBOutlet weak var byLineLabel: UILabel!
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    var news: News? {
        didSet {
            self.headLineLabel.text = news?.title
            self.byLineLabel.text = news?.byline
            self.sectionLabel.text = news?.section
            self.dateLabel.text = news?.published_date
            self.thumbImageView.imageUrl = news?.thumbNail
        }
    }
}
