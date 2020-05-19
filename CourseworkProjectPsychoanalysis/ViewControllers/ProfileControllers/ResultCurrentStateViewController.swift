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
    
    var progressBarHealth: GTProgressBar?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        progressBarHealth = createProgressView(view: healthProgressView)
        // Do any additional setup after loading the view.
    }
    
    func createProgressView(view: UIView) ->  GTProgressBar{
        let progressBar = GTProgressBar(frame: CGRect(x: 0, y: 0, width: view.bounds.width-40, height: view.bounds.height))
        progressBar.progress = 0.75
        progressBar.barBorderColor = UIColor(red:0.35, green:0.80, blue:0.36, alpha:1.0)
        progressBar.barFillColor = UIColor(red:0.35, green:0.80, blue:0.36, alpha:1.0)
        progressBar.barBackgroundColor = UIColor(red:0.77, green:0.93, blue:0.78, alpha:1.0)
        progressBar.barBorderWidth = 1
        progressBar.barFillInset = 2
        progressBar.labelTextColor = UIColor(red:0.35, green:0.80, blue:0.36, alpha:1.0)
        progressBar.progressLabelInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        progressBar.font = UIFont.boldSystemFont(ofSize: 25)
        progressBar.labelPosition = GTProgressBarLabelPosition.right
        progressBar.barMaxHeight = 20
        progressBar.direction = GTProgressBarDirection.clockwise
        view.addSubview(progressBar)
        return progressBar
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
