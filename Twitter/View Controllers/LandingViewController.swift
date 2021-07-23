//
//  LandingViewController.swift
//  Twitter
//
//  Created by James on 7/23/21.
//

import UIKit

final class LandingViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - API
    
    // MARK: - Actions
    
    // MARK: - Helpers
    
    private func configureLayout() {
        view.backgroundColor = .systemBackground
    }
}
