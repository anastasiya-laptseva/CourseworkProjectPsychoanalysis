//
//  UsersManager.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/1/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class UsersManager {
    static let shared = UsersManager()
    let fileName = "User.txt"
    let keyLogin = "User.login"
    private init() {}
    
    func registrationUser(name: String,
                          login: String,
                          password: String,
                          loading: UIView,
                          completion: @escaping(_ isRegistration: Bool,_ error: String) -> Void) {
        FirebaseModule.shared.registration(email: login, password: password, loading: loading) { (state, error) in
            if state {
                let user = User(name: name, login: login, password: password)
                do {
                    let jsonData = try JSONEncoder().encode(user)
                    let jsonString = String(data: jsonData, encoding: .utf8)!
                    if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                        let fileUrl = dir.appendingPathComponent(self.fileName)
                        do {
                            try jsonString.write(to: fileUrl, atomically: false, encoding: .utf8)
                        } catch {}
                    }
                    print(jsonString)
                } catch { print(error) }
                completion(true, "")
            } else {
                completion(false, error)
            }
        }
    }
    func isUser(login: String, password: String) -> Bool {
//        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
//            let fileUrl = dir.appendingPathComponent(fileName)
//            do {
//                let userJson = try String(contentsOf: fileUrl, encoding: .utf8)
//                let jsonData = userJson.data(using: .utf8)!
//                let user = try JSONDecoder().decode(User.self, from: jsonData)
//                if user.login.elementsEqual(login) && user.password.elementsEqual(password) {
//                    return true
//                }
//            }
//            catch {}
//        }
        return FirebaseModule.shared.isUser()
    }
    
    func saveLogin(state: Bool) {
        let cache = UserDefaults.standard
        cache.set(state, forKey: keyLogin)
        cache.synchronize()
    }
    func isLogin() -> Bool {
        return FirebaseModule.shared.isUser()
            //UserDefaults.standard.bool(forKey: keyLogin)
    }
}
