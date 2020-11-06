//
//  ViewController.swift
//  LineLoginDemo
//
//  Created by Bùi Xuân Huy on 11/3/20.
//  Copyright © 2020 huy. All rights reserved.
//

import UIKit
import LineSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginWithLineAccount(_ sender: Any) {
        LoginManager.shared.login(permissions: [.profile], in: self) {
            result in
            switch result {
            case .success(let loginResult):
                print(loginResult.accessToken.value)
                if let profile = loginResult.userProfile {
                    print("User ID: \(profile.userID)")
                    print("User Display Name: \(profile.displayName)")
                    print("User Icon: \(String(describing: profile.pictureURL))")
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
}


