//
//  PhotListViewController.swift
//  Albums
//
//  Created by Zibra Coders on 05/05/2020.
//  Copyright © 2020 Fanovic. All rights reserved.
//

import UIKit

class PhotListViewController: UIViewController, PhotosViewProtocol {
    @IBOutlet weak var tableView: UITableView!
    var presenter: PhotosPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateTableView()
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PhotoTableViewCell", bundle: nil), forCellReuseIdentifier: "PhotoCell")
    }
    
    func updateTableView() {
        presenter?.getPhotos()
    }
    
    func showError(_ error: String) {
        print(error)
    }
       
    func showPhotos() {
        tableView.reloadData()
    }

}
extension PhotListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell") as! PhotoTableViewCell
        if let photo = presenter?.list?[indexPath.section] {
            cell.configure(with: photo)
        }
        return cell
    }
    
    
}
