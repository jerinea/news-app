//
//  PeriodSelectionViewController.swift
//  NewsApp
//
//  Created by Jerin Emmanuel on 12/17/20.
//

import UIKit

// MARK: - PeriodSelectionViewControllerDelegate

protocol PeriodSelectionViewControllerDelegate: NSObjectProtocol {
    func periodSelected(viewController: PeriodSelectionViewController, value: Int)
}

class PeriodSelectionViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Private members
    
    private var items = [(title: String, value: Int)]()
    
    // MARK: - Public members
    
    weak var delegate: PeriodSelectionViewControllerDelegate?
    
    var selectedValue: Int = 1
    
    // MARK: - LifeCycle methods

    override func viewDidLoad() {
        super.viewDidLoad()

        addCloseButton()
        
        items.append((title: "Today", value: 1))
        items.append((title: "Last 7 days", value: 7))
        items.append((title: "Last 30 days", value: 30))
    }
    
    // MARK: - Private methods
    
    private func addCloseButton() {
        let button = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(onClose))
        navigationItem.leftBarButtonItem = button
    }

    @objc func onClose(){
        self.dismiss(animated: true, completion: nil)
    }

}

// MARK: - UITableViewDataSource

extension PeriodSelectionViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.selectionStyle = .none
        
        if self.items.count > indexPath.row {
            let item = self.items[indexPath.row]
            cell.textLabel?.text = item.title
            cell.accessoryType = item.value == selectedValue ? .checkmark : .none
        }
        return cell
    }
}

// MARK: - UITableViewDelegate

extension PeriodSelectionViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if self.items.count > indexPath.row {
            let item = self.items[indexPath.row]
            delegate?.periodSelected(viewController: self, value: item.value)
            self.dismiss(animated: true, completion: nil)
        }
    }
}
