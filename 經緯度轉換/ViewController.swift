//
//  ViewController.swift
//  經緯度轉換
//
//  Created by 蔡佳穎 on 2021/5/3.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var ddLatitude1TextField: UITextField!
    @IBOutlet weak var ddLongitude1TextField: UITextField!
    
    @IBOutlet weak var dmmLatitude1TextField: UITextField!
    @IBOutlet weak var dmmLatitude2TextField: UITextField!
    @IBOutlet weak var dmmLongitude1TextField: UITextField!
    @IBOutlet weak var dmmLongitude2TextField: UITextField!
    
    @IBOutlet weak var dmsLatitude1TextField: UITextField!
    @IBOutlet weak var dmsLatitude2TextField: UITextField!
    @IBOutlet weak var dmsLatitude3TextField: UITextField!
    @IBOutlet weak var dmsLongitude1TextField: UITextField!
    @IBOutlet weak var dmsLongitude2TextField: UITextField!
    @IBOutlet weak var dmsLongitude3TextField: UITextField!
    
    @IBOutlet weak var mapMKMapView: MKMapView!
    @IBOutlet weak var annotationTextField: UITextField!
    @IBOutlet weak var clearBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func convertDd(_ sender: UIButton) {
        //收鍵盤
        view.endEditing(true)
        
        //將Text Field的內容String轉為Float
        let ddLatitude1Text = ddLatitude1TextField.text!
        let ddLongitude1Text = ddLongitude1TextField.text!
        let ddLatitude1 = Float(ddLatitude1Text)
        let ddLongitude1 = Float(ddLongitude1Text)
        
        if ddLatitude1 != nil, ddLongitude1 != nil {
            
            //【度】
            //經緯度轉Int
            let latitude1 = Int(ddLatitude1!)
            let longitude1 = Int(ddLongitude1!)
            
            //DMM & DMS 的度（整數）
            dmmLatitude1TextField.text = "\(latitude1)"
            dmsLatitude1TextField.text = "\(latitude1)"
            dmmLongitude1TextField.text = "\(longitude1)"
            dmsLongitude1TextField.text = "\(longitude1)"
            
            //【分】
            //度轉Int，之後用來轉成Float，以獲得Float型別的整數
            let tempLatitude = Int(ddLatitude1!)
            let tempLongitude = Int(ddLongitude1!)
            
            //度轉分
            var latitude2 = (ddLatitude1! - Float(tempLatitude)) * 60
            var longitude2 = (ddLongitude1! - Float(tempLongitude)) * 60
            
            ////DMM & DMS 的分
            dmmLatitude2TextField.text = String(format: "%.4f", latitude2)
            dmsLatitude2TextField.text = String(format: "%.0f", latitude2)
            dmmLongitude2TextField.text = String(format: "%.4f", longitude2)
            dmsLongitude2TextField.text = String(format: "%.0f", longitude2)

            //【秒】
            //分轉Int，之後用來轉成Float，以獲得Float型別的整數
            let tempLatitude2 = Int(latitude2)
            let tempLongitude2 = Int(longitude2)
            
            //分轉秒
            var latitude3 = (latitude2 - Float(tempLatitude2)) * 60
            var longitude3 = (longitude2 - Float(tempLongitude2)) * 60
            
            //DMS的秒
            dmsLatitude3TextField.text = String(format: "%.2f", latitude3)
            dmsLongitude3TextField.text = String(format: "%.2f", longitude3)
        } else {
            ddLatitude1TextField.text = "請輸入"
            ddLongitude1TextField.text = "請輸入"
        }
        
        //地圖座標
        let mapLatitude = Double(ddLatitude1!)
        let mapLongitude = Double(ddLongitude1!)
        
        mapMKMapView.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: mapLatitude, longitude: mapLongitude), latitudinalMeters: 1000, longitudinalMeters: 1000)
    }
    
    @IBAction func convertDmm(_ sender: UIButton) {
        //收鍵盤
        view.endEditing(true)
        
        let dmmLatitude1Text = dmmLatitude1TextField.text!
        let dmmLatitude2Text = dmmLatitude2TextField.text!
        let dmmLongitude1Text = dmmLongitude1TextField.text!
        let dmmLongitude2Text = dmmLongitude2TextField.text!
        let dmmLatitude1 = Int(dmmLatitude1Text)
        let dmmLatitude2 = Float(dmmLatitude2Text)
        let dmmLongitude1 = Int(dmmLongitude1Text)
        let dmmLongitude2 = Float(dmmLongitude2Text)
        
        
        if dmmLatitude1 != nil, dmmLatitude2 != nil, dmmLongitude1 != nil, dmmLongitude2 != nil {
            //【度】
            //DMS
            dmsLatitude1TextField.text = "\(dmmLatitude1!)"
            dmsLongitude1TextField.text = "\(dmmLongitude1!)"
            
            //DD
            let ddLatitude = Float(dmmLatitude1!) + dmmLatitude2! / 60
            let ddLongitude = Float(dmmLongitude1!) + dmmLongitude2! / 60
            
            ddLatitude1TextField.text = "\(ddLatitude)"
            ddLongitude1TextField.text = "\(ddLongitude)"
            
            //DMS【分秒】
            //分
            let dmsLatitude2 = Int(dmmLatitude2!)
            let dmsLongitude2 = Int(dmmLongitude2!)
            
            dmsLatitude2TextField.text = "\(dmsLatitude2)"
            dmsLongitude2TextField.text = "\(dmsLongitude2)"
            
            //秒
            let dmsLatitude3 = (dmmLatitude2! - Float(dmsLatitude2)) * 60
            let dmsLongitude3 = (dmmLongitude2! - Float(dmsLongitude2)) * 60
            
            dmsLatitude3TextField.text = String(format: "%.2f", dmsLatitude3)
            dmsLongitude3TextField.text = String(format: "%.2f", dmsLongitude3)
            
            
            //地圖座標
            let mapLatitude = Double(ddLatitude)
            let mapLongitude = Double(ddLongitude)
            
            mapMKMapView.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: mapLatitude, longitude: mapLongitude), latitudinalMeters: 1000, longitudinalMeters: 1000)
        } else {
            dmmLatitude1TextField.text = "請輸入"
            dmmLatitude2TextField.text = "請輸入"
            dmmLongitude1TextField.text = "請輸入"
            dmmLongitude2TextField.text = "請輸入"
        }
        

    }
    @IBAction func convertDms(_ sender: UIButton) {
        
        //收鍵盤
        view.endEditing(true)
        
        let dmsLatitude1Text = dmsLatitude1TextField.text!
        let dmsLatitude2Text = dmsLatitude2TextField.text!
        let dmsLatitude3Text = dmsLatitude3TextField.text!
        let dmsLongitude1Text = dmsLongitude1TextField.text!
        let dmsLongitude2Text = dmsLongitude2TextField.text!
        let dmsLongitude3Text = dmsLongitude3TextField.text!
        
        let dmsLatitude1 = Int(dmsLatitude1Text)
        let dmsLatitude2 = Int(dmsLatitude2Text)
        let dmsLatitude3 = Float(dmsLatitude3Text)
        let dmsLongitude1 = Int(dmsLongitude1Text)
        let dmsLongitude2 = Int(dmsLongitude2Text)
        let dmsLongitude3 = Float(dmsLongitude3Text)
        
        if dmsLatitude1 != nil, dmsLatitude2 != nil, dmsLatitude3 != nil, dmsLongitude1 != nil, dmsLongitude2 != nil, dmsLongitude3 != nil {
            
            //【DMM】
            //度
            dmmLatitude1TextField.text = "\(dmsLatitude1!)"
            dmmLongitude1TextField.text = "\(dmsLongitude1!)"
            
            //分
            let dmmLatitude2 = Float(dmsLatitude2!) + (dmsLatitude3! / 60)
            let dmmLongitude2 = Float(dmsLongitude2!) + (dmsLongitude3! / 60)
            
            dmmLatitude2TextField.text = String(format: "%.4f", dmmLatitude2)
            dmmLongitude2TextField.text = String(format: "%.4f", dmmLongitude2)
            
            //【DD】度
            let ddLatitude1 = Float(dmsLatitude1!) + (dmsLatitude3! / 60)
            let ddLongitude1 = Float(dmsLongitude1!) + (dmsLongitude3! / 60)
            
            ddLatitude1TextField.text = String(format: "%.5f", ddLatitude1)
            ddLongitude1TextField.text = String(format: "%.5f", ddLongitude1)
            
            
            //地圖座標
            let mapLatitude = Double(ddLatitude1)
            let mapLongitude = Double(ddLongitude1)
            
            mapMKMapView.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: mapLatitude, longitude: mapLongitude), latitudinalMeters: 1000, longitudinalMeters: 1000)
            
        } else {
            dmsLatitude1TextField.text = "請輸入"
            dmsLatitude2TextField.text = "請輸入"
            dmsLatitude3TextField.text = "請輸入"
            dmsLongitude1TextField.text = "請輸入"
            dmsLongitude2TextField.text = "請輸入"
            dmsLongitude3TextField.text = "請輸入"
        }
        

    }
    
    @IBAction func pinLocation(_ sender: UIButton) {
        
        //收鍵盤
        view.endEditing(true)
        
        let latitudeText = ddLatitude1TextField.text!
        let longitudeText = ddLongitude1TextField.text!
        let latitude =  Double(latitudeText)
        let longitude = Double(longitudeText)
        
        if latitude != nil, longitude != nil {
            //地圖經緯度、範圍
            mapMKMapView.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!), latitudinalMeters: 1000, longitudinalMeters: 1000)
            
            //用MKPointAnnotation加入地圖標記
            let annotation = MKPointAnnotation()
            let annotationText = annotationTextField.text!
            
            annotation.title = "\(annotationText)"
            annotation.coordinate = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
            
            //加入mapMKMapView
            mapMKMapView.addAnnotation(annotation)
        }
    }
    
    @IBAction func clear(_ sender: UIButton) {
        //清除Text Field
        ddLatitude1TextField.text = ""
        ddLongitude1TextField.text = ""
        dmmLatitude1TextField.text = ""
        dmmLatitude2TextField.text = ""
        dmmLongitude1TextField.text = ""
        dmmLongitude2TextField.text = ""
        dmsLatitude1TextField.text = ""
        dmsLatitude2TextField.text = ""
        dmsLatitude3TextField.text = ""
        dmsLongitude1TextField.text = ""
        dmsLongitude2TextField.text = ""
        dmsLongitude3TextField.text = ""
        annotationTextField.text = ""
         
        //地圖回到台灣全景
        mapMKMapView.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude:25.046184, longitude: 21.517481), latitudinalMeters: 1000, longitudinalMeters: 1000)
    }
}

