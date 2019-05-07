//
//  SearchViewController.swift
//  AppStore
//
//  Created by Enrique on 2019-04-25.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit
import SDWebImage

class SearchViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    private let cellId = "resultCell"
    
    // Data to storage the information
    private var searchResult = [ResultsApp]()
    
    // Search controller
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    // Made a timer
    var time: Timer?
    
    
    fileprivate func setUpSearchBar() {
        // Set the warning
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        
        // Set the navigation Item
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Search throttling
        time?.invalidate()
        time = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: {} in )
        
        
        NetworkService.shared.fetchSearchResult(searchText) {
            (result, err) in self.searchResult = result
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Pass the layout object
        collectionView.register(SearchCollectionViewsCells.self, forCellWithReuseIdentifier: cellId)
        
        // Set the background color to white
        collectionView.backgroundColor = .white
        
        // Call the search bar
        setUpSearchBar()
    }
    
    // MARK
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResult.count
    }
    
    // MARK
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // The size as the width of the screen(frame)
        return CGSize(width: view.frame.width, height: 200)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as!
        SearchCollectionViewsCells
        cell.backgroundColor = .purple
        
        cell.nameLabel.text = self.searchResult[indexPath.row].trackName
        cell.categoryLabel.text = searchResult[indexPath.row].primaryGenreName
        cell.ratingLabel.text = "\(searchResult[indexPath.row].averageUserRating ?? 0)"
        // Set the imageView
        cell.iconImageView.sd_setImage(with: URL(string: resultApp.screenshot))
        
        
        return cell
    }
    
    init() {
        // Flow layout object
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
