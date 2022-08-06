//
//  NewsTableViewCell.swift
//  CleanCodeMVVM
//
//  Created by Chandan Jha on 06/08/22.
//

import UIKit
import Kingfisher

final class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var iconView: UIImageView!
    
    func setup(with model: News) {
        titleLabel.text = model.title
        subTitleLabel.text = model.byline
        authorLabel.text = model.source
        dateLabel.text = model.published_date
        let url = URL(string: model.thumbnail)
        iconView.kf.setImage(with: url)
        iconView.addCircle(with: AppColor.theme.value)
    }
    
}
