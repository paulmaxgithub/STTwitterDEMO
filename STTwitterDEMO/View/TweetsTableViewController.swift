//
//  TweetsTableViewController.swift
//  STTwitterDEMO
//
//  Created by PaulmaX on 20.12.22.
//

import UIKit
import STTwitter
import LBTATools
import SDWebImage
import Combine

class TweetsTableViewController: UITableViewController, UISearchControllerDelegate {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var subscription = Set<AnyCancellable>()
    
    let viewModel = TweetViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBarListeners()
        
        navigationItem.title = "Search Tweets"
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.navigationBar.sizeToFit()
    }
    
    fileprivate func setupSearchBarListeners() {
        
        let publisher = NotificationCenter.default.publisher(for: UISearchTextField.textDidChangeNotification,
                                                                object: searchController.searchBar.searchTextField)
        
        publisher
            .compactMap { ($0.object as? UISearchTextField)?.text }
            .sink { [unowned self] value in
                viewModel.searchText.send(value)
            }.store(in: &subscription)
        
        viewModel.tweets.sink { [unowned self] _ in
            tableView.reloadData()
        }.store(in: &subscription)
    }
}

//MARK: - UITableViewDataSource
extension TweetsTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tweets.value.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TweetCell(style: .subtitle, reuseIdentifier: "cell")
        let tweet = viewModel.tweets.value[indexPath.row]
        cell.nameLabel.text = tweet.user.name
        cell.tweetTextLabel.text = tweet.text
        cell.profileImage.sd_setImage(with: URL(string: tweet.user.profileImageURL))
        return cell
    }
}

//MARK: - UISearchBarDelegate
extension TweetsTableViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        if viewModel.tweets.value.isEmpty {
            viewModel.searchText.send("Elon Marsk")
            viewModel.setupFetchTweets()
        }
    }
}
