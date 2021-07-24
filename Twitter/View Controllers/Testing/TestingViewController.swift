//
//  TestingViewController.swift
//  Twitter
//
//  Created by James on 7/23/21.
//

import UIKit
import Apollo

final class TestingViewController: UIViewController {
    
    // MARK: - Properties
    
    let apollo = ApolloClient(url: URL(string: "http://localhost:4000/graphql")!)
    var users = [UsersQuery.Data.User]()
    private var tableView = UITableView(frame: .zero)

    
    // MARK: - Lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        configureTableView()
        setupApollo()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - API
    
    private func setupApollo() {
        NetworkManager.shared.createBasicClient()
        NetworkManager.shared.apolloClient?.fetch(query: UsersQuery()) { result in
            
            switch result {
            case .success(let graphqlResult):
                print("DEBUG: \(String(describing: graphqlResult.data))")
            case .failure(let error):
                print("DEBUG:\nERROR: \(error)")
            }
        }
    }
    
    // MARK: - Actions
    
    // MARK: - Helpers
    
    private func configureLayout() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension TestingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
