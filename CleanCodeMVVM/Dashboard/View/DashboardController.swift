//
//  DashboardController.swift
//  CleanCodeMVVM
//
//  Created by Chandan Jha on 04/08/22.
//

import UIKit
import Combine

final class DashboardController: BaseController {
    
    // MARK: IBOutlets
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private(set) weak var newsTableView: UITableView! {
        didSet {
            registerCells()
        }
    }
    
    // MARK: Property
    private(set) var viewModel: DashboardViewModel?
    private var disposer = Set<AnyCancellable>()
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
                                    #selector(handleRefresh(_:)),
                                 for: .valueChanged)
        refreshControl.tintColor = AppColor.theme.value
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
        fetchNews()
        newsTableView .addSubview(self.refreshControl)
    }
    
    func configure(viewModel: DashboardViewModel) {
        self.viewModel = viewModel
    }
    
    class func loadController() -> DashboardController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: DashboardController.name) as? DashboardController
    }
}

//MARK: API REQUEST
private extension DashboardController {
    
    func fetchNews() {
        viewModel?.isLoading = !refreshControl.isRefreshing
        viewModel?.fetchNews()
    }
    
    func setupBinding() {
        viewModel?.$isLoading
            .receive(on: DispatchQueue.main, options: nil)
            .sink { [weak self] state in
                if state {
                    self?.activityIndicator.startAnimating()
                } else {
                    self?.activityIndicator.stopAnimating()
                    self?.handleError()
                }
                self?.reload()
            }
            .store(in: &disposer)
    }
    
    func handleError() {
        guard let error = viewModel?.error else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.showAlert(message: error.description)
        }
    }
}


private extension DashboardController {
    
    func reload() {
        newsTableView.reloadData()
        refreshControl.endRefreshing()
    }

    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        fetchNews()
    }
}
