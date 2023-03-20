//
//  WelcomeViewController.swift
//  Get Fit
//
//  Created by Mu Yu on 9/5/22.
//

import UIKit
import Firebase

class WelcomeViewController: BaseViewController {
    private let titleView = UILabel()
    private let googleLoginButton = TextButton(frame: .zero, buttonType: .primary)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureConstraints()
        configureSignals()
    }
}
// MARK: - Actions
extension WelcomeViewController {
    private func didTapGoogleLogin() {
        appCoordinator?.requestLogin()
    }
}
// MARK: - View Config
extension WelcomeViewController {
    private func configureViews() {
        titleView.text = AppText.appName
        titleView.font = UIFont.h2
        titleView.textColor = UIColor.label
        view.addSubview(titleView)
        
        googleLoginButton.tapHandler = {[weak self] in
            self?.didTapGoogleLogin()
        }
        googleLoginButton.text = AppText.Auth.continueWithGoogle
        view.addSubview(googleLoginButton)
    }
    private func configureConstraints() {
        titleView.snp.remakeConstraints { make in
            make.center.equalToSuperview()
        }
        googleLoginButton.snp.remakeConstraints { make in
            make.leading.trailing.bottom.equalTo(view.layoutMarginsGuide)
        }
    }
    private func configureSignals() {
        
    }
}
