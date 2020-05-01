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
    let photos = ["BruceBenner","CarolDanvers","DoctorStrange","NatashaRomanoff","PeterParker", "StevenRogers", "ThorOdson", "TonyStark"]
    
    private init(){}
    
    func registrationUser(name: String, login: String, password: String) {
        let user = User(name: name, login: login, password: password)
        do {
            let jsonData = try JSONEncoder().encode(user)
            let jsonString = String(data: jsonData, encoding: .utf8)!
            if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
                let fileUrl = dir.appendingPathComponent(fileName)
                do {
                    try jsonString.write(to: fileUrl, atomically: false, encoding: .utf8)
                }
                catch {}
            }
            print(jsonString)
        } catch { print(error) }
    }
    
    func IsUser(login: String, password: String)-> Bool {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let fileUrl = dir.appendingPathComponent(fileName)
            do {
                let userJson = try String(contentsOf: fileUrl, encoding: .utf8)
                let jsonData = userJson.data(using: .utf8)!
                let user = try JSONDecoder().decode(User.self, from: jsonData)
                if user.login.elementsEqual(login) && user.password.elementsEqual(password) {
                    return true
                }
            }
            catch {}
        }
        return false
    }
    
    func saveLogin(state: Bool) -> Void {
        let cache = UserDefaults.standard
        cache.set(state, forKey: keyLogin)
        cache.synchronize()
    }
    
    func IsLogin() -> Bool {
        return UserDefaults.standard.bool(forKey: keyLogin)
    }
    
    func getImageName(id: Int) -> String {
        let number = id-1
        if number<0 || number>=photos.count{
            return ""
        }
        
        return photos[number]
    }
}


