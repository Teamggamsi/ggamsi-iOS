//
//  TokenManager.swift
//  Team_ggamsi
//
//  Created by bibiga on 7/16/24.
//

import Foundation

class TokenManager: ObservableObject {
    static let shared = TokenManager()
    private let userDefaults = UserDefaults.standard
    
    @Published var token: String? {
        didSet {
            userDefaults.set(token, forKey: "token")
        }
    }
    
    private init() {
        self.token = userDefaults.string(forKey: "token")
    }
    
    func saveToken(_ token: String) {
        self.token = token
    }
    
    func getToken() -> String {
        if let token = token {
            return token
        }
        return ""
    }
    
    func deleteToken() {
        self.token = nil
        userDefaults.removeObject(forKey: "token")
    }
}
