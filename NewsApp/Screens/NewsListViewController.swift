//
//  NewsListViewController.swift
//  NewsApp
//
//  Created by Jerin Emmanuel on 12/17/20.
//

import UIKit

class NewsListViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Private members
    
    private var newsList: [News]?
    
    private var selectedPeriod = 1
    
    // MARK: - LifeCycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        loadNews()
    }
    
    // MARK: - Private methods
    
    private func loadNews() {
        
        self.showActivity()
        NewsService.shared.getNews(period: selectedPeriod) { (result) in
            switch result{
            case let .success(newsList):
                self.newsList = newsList
                self.tableView.reloadData()
            case let .failure(error):
                self.showAlert("Error", message: error.localizedDescription)
            }
            self.hideActivity()
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let viewController = segue.destination as? NewsDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow,
                self.newsList != nil,
                self.newsList!.count > indexPath.row {
            viewController.news = self.newsList![indexPath.row]
        } else if let navController = segue.destination as? UINavigationController,
                  let viewController = navController.topViewController as? PeriodSelectionViewController {
            viewController.delegate = self
            viewController.selectedValue = selectedPeriod
        }
    }

}

// MARK: - UITableViewDataSource

extension NewsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsListCell", for: indexPath) as! NewsListCell
        cell.selectionStyle = .none
        
        if self.newsList != nil && self.newsList!.count > indexPath.row {
            cell.news = self.newsList![indexPath.row]
        }
        return cell
    }
}

// MARK: - PeriodSelectionViewControllerDelegate

extension NewsListViewController: PeriodSelectionViewControllerDelegate {
    
    func periodSelected(viewController: PeriodSelectionViewController, value: Int) {
        self.selectedPeriod = value
        self.newsList = nil
        self.tableView.reloadData()
        self.loadNews()
    }
}
