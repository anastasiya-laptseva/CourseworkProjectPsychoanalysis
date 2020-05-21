//
//  BasicInformationsViewController.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 3/27/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class BasicInformationsViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var nameEdit: UITextField!
    @IBOutlet weak var ageEdit: UITextField!
    @IBOutlet weak var genderSegment: UISegmentedControl!
    @IBOutlet weak var infoEdit: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    
    
    
    var profile = Profile(imagePath: nil, name: "", age: 0, gender: 0, info: "")
    var isEdit: Bool = false
    
    var imagePicker = UIImagePickerController()
    var info : [UIImagePickerController.InfoKey : Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SaveManager.shared.backgroundSwitch(controller: self, navigation: self.navigationController, views: [self.view,stackView,scrollView,photoView])
        
        if let p = SaveManager.shared.loadProfile(){
            profile = p
            isEdit = false
        }
        else{
            isEdit = true
        }
        
        updateComponents()
        updateProfile()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }

    func updateComponents() {
        nameLabel.isHidden = isEdit
        ageLabel.isHidden = isEdit
        genderLabel.isHidden = isEdit
        infoLabel.isHidden = isEdit
        
        photoButton.isHidden = !isEdit
        nameEdit.isHidden = !isEdit
        ageEdit.isHidden = !isEdit
        genderSegment.isHidden = !isEdit
        infoEdit.isHidden = !isEdit
        
        var selector : Selector? = nil
        if isEdit {
            selector = #selector(saveClick)
        }
        else{
            selector = #selector(editClick)
        }
        
        let saveStr = LocalizationManager.shared.getText(key: LocalizationManager.KEY_SAVE)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: isEdit ? saveStr : "Edit", style: .plain, target: self, action: selector)
    }
    
    func updateProfile() {
        if let imagePathData = profile.imagePath{
            if let infoDic: NSDictionary? = NSKeyedUnarchiver.unarchiveObject(with: imagePathData)! as? NSDictionary{
                if let info = infoDic as? [UIImagePickerController.InfoKey : Any] {
                    if let image = info[.originalImage] as? UIImage {
                            photoView.image = image
                    }
                }
            }
        }
        
        if isEdit {
            nameEdit.text = profile.name
            ageEdit.text = "\(profile.age)"
            genderSegment.selectedSegmentIndex = profile.gender
            infoEdit.text = profile.info
        }
        else {
            nameLabel.text = profile.name
            ageLabel.text = "Age: \(profile.age)"
            genderLabel.text = "Gender: \(profile.gender == 0 ? "Male" : (profile.gender == 1 ? "Female" : "NotToSay"))"
            infoLabel.text = "Info: \(profile.info)"
        }
    }
    
    @objc func saveClick() {
        print("Save")
        if let dataImage = info{
            profile.imagePath = NSKeyedArchiver.archivedData(withRootObject: dataImage)
        }
        profile.name = nameEdit.text ?? ""
        let ageStr = ageEdit.text ?? "0"
        profile.age = Int(ageStr)!
        profile.gender = genderSegment.selectedSegmentIndex
        profile.info = infoEdit.text ?? ""
        SaveManager.shared.saveProfile(profile: profile)
        switchComponents()
    }
    
    @objc func editClick() {
        print("Edit")
        switchComponents()
    }
    
    func switchComponents() {
        isEdit = !isEdit
        updateComponents()
        updateProfile()
    }
    
    @IBAction func photoLibraryClick(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            //указываем что у нас реализованы протоколы получения фото
            imagePicker.delegate = self
            //указываем тип что мы хотим иметь: альбом или камеру
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            //открываем альбом
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage{
            self.info = info
            photoView.image = image
        } else {
            print("Other source")
        }
        
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
