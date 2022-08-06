//
//  NewsDetailsController.swift
//  CleanCodeMVVM
//
//  Created by Chandan Jha on 06/08/22.
//

import UIKit

final class NewsDetailsController: BaseController {
    
    // MARK: IBOutlets
    @IBOutlet private weak var headlineLabel: UILabel!
    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var sourceLabel: UILabel!
    @IBOutlet private weak var bannerImage: UIImageView!
    
    // MARK: Property
    private var viewModel: NewsDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Exposed Functions
    func configure(with viewModel: NewsDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    class func loadController() -> NewsDetailsController {
        NewsDetailsController(nibName: NewsDetailsController.name, bundle: nil)
    }
    
    // MARK: Protected Functions
    private func setupUI() {
        guard viewModel != nil else {
            assertionFailure("viewModel is not initialized")
            return
        }
        headlineLabel.text = viewModel.title
        messageLabel.text = viewModel.abstract
        authorLabel.text = viewModel.author
        dateLabel.text = viewModel.dateTime
        if let source = viewModel.source {
            sourceLabel.text = "Source: \(source)"
        }
        bannerImage.kf.setImage(with: URL(string: viewModel.media?.banner ?? ""))
        bannerImage.rounded()
    }
}
