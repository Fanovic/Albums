//
//  AlbumsViewController.swift
//  Albums
//
//  Created Zibra Coders on 04/05/2020.
//  Copyright © 2020 Fanovic. All rights reserved.
//
//  Template generated by Zibra Co.
//

import UIKit

class AlbumsViewController: UIViewController, AlbumsViewProtocol {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
	var presenter: AlbumsPresenterProtocol?
    var filteredAlbumsArray = [Album]()

	override func viewDidLoad() {
        super.viewDidLoad()
        title = "Album list"
        configureTableView()
        configureSearchBar()
    }
    override func viewDidAppear(_ animated: Bool) {
        updateTableView()
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "AlbumTableViewCell", bundle: nil), forCellReuseIdentifier: "AlbumCell")
    }
    
    func configureSearchBar() {
        searchBar.delegate = self
    }
    
    func showAlbums() {
        filteredAlbumsArray = presenter?.list ?? [Album]()
        tableView.reloadData()
    }
    
    func showError(_ error: String) {
        print(error)
    }
    
    func updateTableView() {
        presenter?.getAlbums()
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        searchBar.endEditing(true)
    }
    
}

extension AlbumsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return filteredAlbumsArray.count//presenter?.list?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell") as! AlbumTableViewCell
        cell.configure(with: filteredAlbumsArray[indexPath.section])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.showPhotosViewController(with: filteredAlbumsArray[indexPath.section].id)
    }
}

extension AlbumsViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let albums = presenter?.list else  { return }
        if searchText.isEmpty {
            filteredAlbumsArray = albums
            return
        }
        filteredAlbumsArray = albums.filter({ (album) -> Bool in
            album.title.contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print(#function)
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        print(#function)
        searchBar.endEditing(true)
        return true
    }
}
