//
//  SearchViewController.swift
//  AppStore
//
//  Created by Enrique on 2019-04-25.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class SearchViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "resultCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Pass the layout object
        collectionView.register(SearchCollectionViewsCells.self, forCellWithReuseIdentifier: cellId)
        
        // Set the background color to white
        collectionView.backgroundColor = .white
        
        // Call the JSON
        fetchSearchResultsApps()
    }
    
    // MARK
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 200
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
        
        
        return cell
    }
    
    init() {
        // Flow layout object
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func fetchSearchResultsApps() {
        // Call the URL
        let urlStr = "https://itunes.apple.com/search?term=facebook&entity=software"
        guard let url = URL(string: urlStr) else { return }
        
        // Send the request
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                print("Failed to fetch the app!", err)
                return
            }
            
            guard let data = data else { return }
            do  {
                // Parse the response
                let searchResult = try JSONDecoder().decode(SearchResultApp.self, from: data)
                searchResult.results.forEach({(result) in
                    print(result.trackName, result.primaryGenreName)
                })
            } catch {
                print("Failed to decode JSON!", error)
            }
        }.resume()
        
    }
}
