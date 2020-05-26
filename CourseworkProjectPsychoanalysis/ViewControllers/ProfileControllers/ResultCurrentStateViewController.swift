//
//  ResultCurrentStateViewController.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 5/19/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit
import GTProgressBar

class ResultCurrentStateViewController: UIViewController {
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var healthProgressView: UIView!
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var activityProgressView: UIView!
    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var moodProgressView: UIView!
    var progressBarHealth: GTProgressBar?
    var progressBarActivity: GTProgressBar?
    var progressBarMood: GTProgressBar?
    let maxPoints = 70.0
    override func viewDidLoad() {
        super.viewDidLoad()

        let colorHealthBar = UIColor(named: "progressBarHealth") ?? .green
        let colorActivityBar = UIColor(named: "progressBarActivity")  ?? .green
        let colorMoodBar = UIColor(named: "progressBarMood")  ?? .green
        let backgroundHealthBar = UIColor(named: "backgroundProgressBarHealth") ?? .green
        let backgroundActivityBar = UIColor(named: "backgroundProgressBarActivity")  ?? .green
        let backgroundMoodBar = UIColor(named: "backgroundProgressBarMood")  ?? .green
        progressBarHealth = createProgressView(view: healthProgressView,
                                               color: colorHealthBar,
                                               backgroundColor: backgroundHealthBar)
        progressBarActivity = createProgressView(view: activityProgressView,
                                                 color: colorActivityBar,
                                                 backgroundColor: backgroundActivityBar)
        progressBarMood = createProgressView(view: moodProgressView,
                                             color: colorMoodBar,
                                             backgroundColor: backgroundMoodBar)
        let data = CurrentStateData()
        let healthPoints = data.get(key: .currentStateHealth)
        let activityPoints = data.get(key: .currentStateActivity)
        let moodPoint = data.get(key: .currentStateMood)
        progressBarHealth?.progress = CGFloat(Double(healthPoints)/maxPoints)
        progressBarActivity?.progress = CGFloat(Double(activityPoints)/maxPoints)
        progressBarMood?.progress = CGFloat(Double(moodPoint)/maxPoints)
        // Do any additional setup after loading the view.
    }
    func createProgressView(view: UIView, color: UIColor, backgroundColor: UIColor) -> GTProgressBar {
        let progressBar = GTProgressBar(frame: CGRect(x: 0, y: 0,
                                                      width: view.bounds.width-40,
                                                      height: view.bounds.height))
        progressBar.progress = 0.0
        progressBar.barBorderColor = color
        progressBar.barFillColor = color
        progressBar.barBackgroundColor = backgroundColor
        progressBar.barBorderWidth = 1
        progressBar.barFillInset = 2
        progressBar.labelTextColor = color
        progressBar.progressLabelInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        progressBar.font = UIFont.boldSystemFont(ofSize: 25)
        progressBar.labelPosition = GTProgressBarLabelPosition.right
        progressBar.barMaxHeight = 20
        progressBar.direction = GTProgressBarDirection.clockwise
        view.addSubview(progressBar)
        return progressBar
    }
    @IBAction func clickButton(_ sender: Any) {
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: MainProfileViewController.self) {
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
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
