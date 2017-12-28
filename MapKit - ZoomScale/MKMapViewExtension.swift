//
//  MKMapViewExtension.swift
//  MapKit - ZoomScale
//
//  Created by 蔡松樺 on 28/12/2017.
//  Copyright © 2017 蔡松樺. All rights reserved.
//

import Foundation
import MapKit

//因為 KMapView 無偵測與授與 Zoom 的功能，需使用者自行擴充
extension MKMapView {
    //縮放級別 (缩放级是：2 - 20（其中 2 為世界地图))
    var zoomLevel : Int {
        //獲取縮放級別
        get {
            return Int(log2(360 * (Double(self.frame.size.width/256) / self.region.span.longitudeDelta))+1)
        }
        //設置縮放級別
        set (newZoomLevel) {
            setCenterCoordinate(coordinate: self.centerCoordinate, zoomLevel: newZoomLevel, animated: false)
        }
    }

    //設定縮放級別時調用
    private func setCenterCoordinate(coordinate : CLLocationCoordinate2D, zoomLevel : Int, animated : Bool){
        let span = MKCoordinateSpanMake(0, 360 / pow(2, Double(zoomLevel)) * Double(self.frame.size.width) / 256)
        setRegion(MKCoordinateRegionMake(centerCoordinate, span), animated: animated)
    }
}


