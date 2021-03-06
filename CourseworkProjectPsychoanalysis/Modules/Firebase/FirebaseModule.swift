//
//  AuthFirebase.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/18/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import FirebaseAuth

class FirebaseModule {
    static let shared = FirebaseModule()
    private init() {}
    
    func registration (email: String,
                       password: String,
                       loading: UIView, completion: @escaping (_ isRegistration: Bool, _ error: String) -> Void) {
        loading.isHidden = false
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            loading.isHidden = true
            if let error = error {
                completion(false, error.localizedDescription)
                print("Fail registration User \(error.localizedDescription)")
            } else {
                completion(true, "")
                print("Success registration User \(String(describing: authResult?.user))")
            }
        }
    }
    func logIn(email: String,
               password: String,
               loading: UIView,
               completion: @escaping(_ isRegistration: Bool) -> Void) {
        loading.isHidden = false
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
            loading.isHidden = true
            if let error = error {
                completion(false)
                print("Fail registration User \(error.localizedDescription)")
            } else {
                completion(true)
            }
        }
    }
    func isUser() -> Bool {
        if Auth.auth().currentUser != nil {
            return true
        }
        return false
    }
}
