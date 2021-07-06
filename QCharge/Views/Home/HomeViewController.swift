//
//  HomeViewController.swift
//  QCharge
//
//  Created by Prapawit Patthasirivichot on 4/7/2564 BE.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var selectionIndex = 0
    private let mockupData = [15, 20, 2]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapPromotion(_ sender: Any) {
        updateData(index: 0)
    }
    
    @IBAction func tapActivity(_ sender: Any) {
        updateData(index: 1)
    }
    
    @IBAction func tapCallCenter(_ sender: Any) {
        updateData(index: 2)
    }
    
    @IBAction func tapNotification(_ sender: Any) {
        guard let notification = ViewControllerFactory.NotificationViewController() else { return }
        navigationController?.pushViewController(notification, animated: true)
    }
    
    private func updateData(index: Int) {
        selectionIndex = index
        tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockupData[selectionIndex]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "This is mock data for ID: \(indexPath.row)"
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
}
