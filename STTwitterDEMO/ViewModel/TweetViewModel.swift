//
//  TweetViewModel.swift
//  STTwitterDEMO
//
//  Created by PaulmaX on 20.12.22.
//

import Foundation
import STTwitter
import Combine

class TweetViewModel {
    
    var tweets = CurrentValueSubject<[Tweet], Never>([Tweet]())
    
    var searchText = CurrentValueSubject<String, Never>("Paul Hudson")
    
    let twitterAPI = TwitterAPI()
    
    var subscription = Set<AnyCancellable>()
    
    init() {
        twitterAPI.verifyCredentials()
            .sink { (completion) in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished: break
                }
            } receiveValue: { [unowned self] (username, id) in
//                print("success!!!")
                setupFetchTweets()
            }.store(in: &subscription)
    }
    
    public func setupFetchTweets() {
        searchText
            .removeDuplicates()
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .map { [unowned self] (text) -> AnyPublisher<[Tweet], Never> in
                
            

          
                //MARK: to catch error and get description uncomment the code
//                twitterAPI.getSearchTweets(with: text).sink { completion in
//                    switch completion {
//                    case .failure(let error): print("🆘 \(error)")
//                    case .finished: break
//                    }
//                } receiveValue: { _tweets in
//                    _tweets.forEach({ print($0) })
//                }.store(in: &subscription)

                
                return twitterAPI.getSearchTweets(with: text)
                    .subscribe(on: DispatchQueue.global())
                    .catch ({ _ in Just([Tweet]()) })
                    .eraseToAnyPublisher()
            }
            .switchToLatest()
            .sink { [unowned self] _tweets in
//                print("✅ - \(_tweets)")
                
                print("\(Thread.isMainThread)")
                
                tweets.send(_tweets)
            }.store(in: &subscription)
    }
}
