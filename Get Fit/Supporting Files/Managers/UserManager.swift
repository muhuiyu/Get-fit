//
//  UserManager.swift
//  Why am I so poor
//
//  Created by Mu Yu on 8/2/22.
//

import UIKit

typealias UserID = String

class UserManager {
    static let shared = UserManager()
    
    private var userID: UserID
    private var username: String
    private var email: String
    private var profileImageURLString: String?
    
    init() {
        self.userID = ""
        self.username = ""
        self.email = ""
        self.profileImageURLString = ""
    }
}
extension UserManager {
    func clearData() {
        userID = ""
        username = ""
        email = ""
        profileImageURLString = nil
    }
}
extension UserManager {
    var getUserEmail: String? {
        return email.isEmpty ? nil : email
    }
}
extension UserManager {
    func setUserEmail(to email: String) {
        self.email = email
    }
}
