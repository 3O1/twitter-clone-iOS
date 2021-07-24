//
//  NetworkManager.swift
//  Twitter
//
//  Created by James on 7/23/21.
//

import Foundation
import Apollo
import UIKit
import ApolloWebSocket

class NetworkManager {
    static let shared = NetworkManager()
    var apolloClient : ApolloClient?
    
    func createBasicClient() {
        self.apolloClient = {
            return ApolloClient(url: URL(string: ENDPOINT)!)
        }()
    }
}

struct NetworkInterceptorProvider: InterceptorProvider {
    
    private let store: ApolloStore
    private let client: URLSessionClient
    
    init(store: ApolloStore,
         client: URLSessionClient) {
        self.store = store
        self.client = client
    }
    
    func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        return [
            MaxRetryInterceptor(),
            CacheReadInterceptor(store: self.store),
//            UserManagementInterceptor(),
//            RequestLoggingInterceptor(),
            NetworkFetchInterceptor(client: self.client),
//            ResponseLoggingInterceptor(),
            ResponseCodeInterceptor(),
            JSONResponseParsingInterceptor(cacheKeyForObject: self.store.cacheKeyForObject),
            AutomaticPersistedQueryInterceptor(),
            CacheWriteInterceptor(store: self.store)
        ]
    }
}
