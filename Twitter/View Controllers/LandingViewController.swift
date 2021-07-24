//
//  LandingViewController.swift
//  Twitter
//
//  Created by James on 7/23/21.
//

import UIKit

enum LandingButtonType {
    case login
    case signup
}

final class LandingViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: - Properties
    
    private let HORIZONTAL_PADDING:CGFloat = 35
    
    private let bannerImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = UIImage(named: "twitter-mask-bg")
        return iv
    }()
    
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "twitter-logo-small")
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "See what's happening in the world right now."
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var loginButton: LandingButton = {
        let button = LandingButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        return button
    }()
    
    private lazy var signUpButton: LandingButton = {
        let button = LandingButton(type: .system)
        button.setTitle("Signup", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.masksToBounds = true
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(didTapSignup), for: .touchUpInside)
        return button
    }()
    
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
    
    @objc func didTapLogin() {
        handleNavigation(type: .login)
    }
    
    @objc func didTapSignup() {
        handleNavigation(type: .signup)
    }
    
    // MARK: - Helpers
    
    private func configureLayout() {
        view.backgroundColor = .white
        
        view.addSubview(bannerImageView)
        bannerImageView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor)
        
        view.addSubview(logoImageView)
        logoImageView.anchor(top: bannerImageView.bottomAnchor, left: view.leftAnchor, paddingTop: 40, paddingLeft: HORIZONTAL_PADDING)
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 16, paddingLeft: HORIZONTAL_PADDING, paddingRight: HORIZONTAL_PADDING)
        
        let buttonStack = UIStackView(arrangedSubviews: [loginButton, signUpButton])
        buttonStack.axis = .vertical
        buttonStack.spacing = 24
        view.addSubview(buttonStack)
        buttonStack.centerX(inView: view)
        buttonStack.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: HORIZONTAL_PADDING, paddingBottom: 70, paddingRight: HORIZONTAL_PADDING)
    }
    
    private func handleNavigation(type: LandingButtonType) {
        switch type {
        case .login:
            DispatchQueue.main.async {
                let vc = LoginViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        case .signup:
            DispatchQueue.main.async {
                let vc = SignupViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
