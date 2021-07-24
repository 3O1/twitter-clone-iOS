//
//  LoginViewController.swift
//  Twitter
//
//  Created by James on 7/23/21.
//

import UIKit

final class LoginViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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
