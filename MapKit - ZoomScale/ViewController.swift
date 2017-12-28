//
//  ViewController.swift
//  MapKit - ZoomScale
//
//  Created by 蔡松樺 on 28/12/2017.
//  Copyright © 2017 蔡松樺. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager : CLLocationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        //設置代理
        self.mapView.delegate = self

        //地圖類型 : 標準地圖
        self.mapView.mapType = MKMapType.standard

        //創建 MKCoordinateSpan 對象，設置地圖範圍 (越小越精確)
        let latDelta = 0.05
        let longDelta = 0.05
        let currentLocationSpan : MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)

        //設定中心
        let center : CLLocation = CLLocation(latitude: 32.029171, longitude: 118.788231)
        let currentRegion :MKCoordinateRegion = MKCoordinateRegion(center: center.coordinate, span: currentLocationSpan)

        //設置顯示區域
        self.mapView.setRegion(currentRegion, animated: true)

    }
    
    //縮放比例變動調整時觸發
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        label.text = "當前縮放比例 : \(mapView.zoomLevel)"
        slider.value = Float(mapView.zoomLevel)
    }

    //Slider 數值變動時觸發
    @IBAction func sliderDidChange(_ sender: Any) {
        //將 MapView 調整為縮的比例
        mapView.zoomLevel = Int(slider.value)
    }
    
}

