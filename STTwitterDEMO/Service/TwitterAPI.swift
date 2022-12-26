//
//  TwitterAPI.swift
//  STTwitterDEMO
//
//  Created by PaulmaX on 20.12.22.
//

import Foundation
import STTwitter
import Combine

struct TwitterAPI {
    let key = "CPS9SxC0j3INTMhdSDx8s8eft"                               // use your own key here
    let secret = "gXAD0ePzX7cgLFduwes26kMW3BxUhv6SG291Perdr9Na8PQmN6"   // use your own secrete here
    var api: STTwitterAPI
    
    init() { api = STTwitterAPI(appOnlyWithConsumerKey: key, consumerSecret: secret) }
    
    func verifyCredentials() -> Future<(String?, String?), Error> {
        Future { promise in
            api.verifyCredentials(userSuccessBlock: { (username, userId) in
                promise(.success((username, userId)))
            }, errorBlock: { (err) in
                promise(Result.failure(err!))
            })
        }
    }
    
    func getSearchTweets(with query: String) -> AnyPublisher<[Tweet], Error> {
        Future { promise in
            api.getSearchTweets(withQuery: query, successBlock: { (data, res) in
                promise(.success(res))
            }, errorBlock: { (err) in
                promise(.failure(err!))
            })
        }
        .compactMap({ $0 })
//        .print("🆕", to: print("➡️") as? TextOutputStream)
        .tryMap { try JSONSerialization.data(withJSONObject: $0,  options: .prettyPrinted)  }
        .decode(type: [Tweet].self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
    }
}
