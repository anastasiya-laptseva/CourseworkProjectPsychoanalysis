//
//  MainPrrofile.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 3/27/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit

class MainProfileViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var basicInfoButton: BorderButton!
    @IBOutlet weak var currentStateButton: BorderButton!
    @IBOutlet weak var resultButton: BorderButton!
//    view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        SaveManager.shared.backgroundSwitch(controller: self,
                                            navigation: self.navigationController,
                                            views: [self.view, scrollView, stackView])
        let duration = 0.5
        AnimationManager.shared.animationFromFade(view: imageView, duration: duration, delay: 0.0)
        AnimationManager.shared.animationFromFade(view: nameLabel, duration: duration, delay: 0.0)
        AnimationManager.shared.animationFromFade(view: basicInfoButton, duration: duration, delay: 0.25)
        AnimationManager.shared.animationFromFade(view: currentStateButton, duration: duration, delay: 0.5)
        AnimationManager.shared.animationFromFade(view: resultButton, duration: duration, delay: 0.75)
    }
//    view will appear
    override func viewWillAppear(_ animated: Bool) {
        let profile = SaveManager.shared.loadProfile()
        if let imagePathData = profile?.imagePath {
            if let infoDic = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(imagePathData) as? NSDictionary {
                if let info = infoDic as? [UIImagePickerController.InfoKey: Any] {
                    if let image = info[.originalImage] as? UIImage {
                            imageView.image = image
                    }
                }
            }
            nameLabel.text = profile?.name ?? ""
        }
    }
}
