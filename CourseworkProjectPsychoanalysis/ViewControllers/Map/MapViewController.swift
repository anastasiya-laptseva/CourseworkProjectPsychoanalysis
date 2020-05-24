//
//  ViewController.swift
//  CourseworkProjectPsychoanalysis
//
//  Created by Anastasiya Laptseva on 3/24/20.
//  Copyright © 2020 Anastasiya Laptseva. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet private var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Init start pos
//        let initialLocayion = CLLocation(latitude: 53.9171149, longitude: 27.5006956)
//        let region = MKCoordinateRegion(center: initialLocayion.coordinate, latitudinalMeters: 20000, longitudinalMeters: 20000)
//        mapView.setRegion(region, animated: true)
        
        //First ps
        let minsk1 = Point(title: "Ирина Смирнова",
                           coordinate: CLLocationCoordinate2D(latitude: 53.8689116, longitude: 27.5219082),
                           info: "ул. Берута 3б, Минск, 8 029 120-70-54")
        let minsk2 = Point(title: "Частный психолог в Минске | Олеся Будрик",
                           coordinate: CLLocationCoordinate2D(latitude: 53.8958545, longitude: 27.4740663),
                           info: "ул. Мележа 1, Минск, 8 029 145-15-29")
        let minsk3 = Point(title: "Центр успешных отношений",
                           coordinate: CLLocationCoordinate2D(latitude: 53.8958545, longitude: 27.4740663),
                           info: "улица Заводская 10, Минск, 8 029 338-90-33")
        let homel = Point(title: "Психологический центр \"Вместе\"",
                          coordinate: CLLocationCoordinate2D(latitude: 52.434595, longitude: 30.9598493),
                          info: "Речицкий просп. 135, Гомель, 8 029 144-59-66")
        let brest = Point(title: "Психотерапевтический центр Сергея Шиманского в Бресте",
                          coordinate: CLLocationCoordinate2D(latitude: 52.0873776, longitude: 23.6377466),
                          info: "ул. Пионерская 52-10, Брест, 8 033 652-75-27")
        let vitebsk = Point(title: "Психологический центр Виктории Плешковой",
                          coordinate: CLLocationCoordinate2D(latitude: 55.1857709, longitude: 30.2178852),
                          info: "улица Гоголя 14, Витебск, 8 033 316-13-17")
        let grodno = Point(title: "Психолог Ващейко Екатерина Евгеньевна",
                          coordinate: CLLocationCoordinate2D(latitude: 53.6732243, longitude: 23.8280134),
                          info: "ул. Мостовая 40А, Гродно, 8 033 689-11-99")
        let mogileov = Point(title: "Консультация психолога Ольга Биндасова",
                          coordinate: CLLocationCoordinate2D(latitude: 53.9305226, longitude: 30.3423575),
                          info: "ул. Белинского 20, Могилёв, 8 029 160-62-40")
        
        
        mapView.addAnnotation(minsk1)
        mapView.addAnnotation(minsk2)
        mapView.addAnnotation(minsk3)
        mapView.addAnnotation(homel)
        mapView.addAnnotation(brest)
        mapView.addAnnotation(vitebsk)
        mapView.addAnnotation(grodno)
        mapView.addAnnotation(mogileov)
        
    }
    
    public class Point: NSObject, MKAnnotation{
        var title: String?
        var coordinate: CLLocationCoordinate2D
        var subtitle: String?
        
        init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
            self.title = title
            self.coordinate = coordinate
            self.subtitle = info
        }
    }
}

