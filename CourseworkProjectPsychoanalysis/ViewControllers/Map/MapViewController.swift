//
//  ViewController.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 3/24/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit
import WebKit
import MapKit

class MapViewController: UIViewController, WKUIDelegate {
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://www.103.by/cat/med/psihology/?coordinates[minLon]=27.30308532714844&coordinates[minLat]=53.76576070415373&coordinates[maxLon]=27.81944274902344&coordinates[maxLat]=54.04245742542455")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        // Do any additional setup after loading the view.
    }


}

