//
//  SettingViewController.swift
//  QCharge
//
//  Created by Prapawit Patthasirivichot on 5/7/2564 BE.
//

import UIKit

private struct MockData {
    var image: String
    var title: String
    var data: [String] = []
}

class SettingViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private let dataMock = [
        MockData(image: "person.fill", title: "Account", data: ["Disable Account", "Change E-mail", "Change car brand", "Change car model"]),
        MockData(image: "lock.fill", title: "Security", data: ["Change password", "Set password"]),
        MockData(image: "hourglass", title: "How to use"),
        MockData(image: "dollarsign.circle.fill", title: "Payment"),
        MockData(image: "esim", title: "Contact"),
        MockData(image: "globe", title: "Language", data: ["English", "Thai"]),
        MockData(image: "deskclock", title: "Logout")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        navigationItem.title = "Setting"
        tableView.delegate = self
        tableView.reloadData()
    }

}

extension SettingViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataMock[section].data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = dataMock[indexPath.section].data[indexPath.row]
        cell.imageView?.image = UIImage(systemName: "arrow.right")
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataMock[section].title
    }
}

extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 6 {
            UIApplication.shared.windows.first?.rootViewController = ViewControllerFactory.loginViewController()
        }
    }
}
