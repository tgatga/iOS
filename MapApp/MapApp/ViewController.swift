//
//  ViewController.swift
//  MapApp
//
//  Created by Assel Tolebayeva on 27.03.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import MapKit
import Cartography
import CoreData

protocol Delegate{
    var places:[NSManagedObject]{set get}
    var willRemoveIndex:Int{get set}
}

class ViewController: UIViewController,Delegate, MKMapViewDelegate {
    var selectedTitle:NSManagedObject?{
        didSet{
            if let place = selectedTitle{
                zoomRegion(place)
            }
        }
    }
    
    var places:[NSManagedObject] = []
    var willRemoveIndex: Int = -1
    var controllerPlacesIndex:Int = 0
    let typesMK:Dictionary<Int, MKMapType> = [
        0: MKMapType.standard,
        1: MKMapType.satellite,
        2: MKMapType.hybrid
    ]
    
    let segment:UISegmentedControl = {
        let segment = UISegmentedControl.init()
        segment.insertSegment(withTitle: "Standard", at: 0, animated: true)
        segment.insertSegment(withTitle: "Satellite", at: 1 , animated: false)
        segment.insertSegment(withTitle: "Hybrid", at: 2, animated: false)
        segment.tintColor = .black
        segment.selectedSegmentIndex = 0
        segment.isUserInteractionEnabled = true
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.addTarget(self, action: #selector(segmentAction), for: UIControlEvents.valueChanged)
        return segment
    }()
    
    lazy var viewEffect:UIVisualEffectView = {
        let view =  UIVisualEffectView(effect: UIBlurEffect(style: .light))
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let map:MKMapView = {
        let map = MKMapView.init(frame: UIScreen.main.bounds)
        return map
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstrains()
        map.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        setAllAnnotation()
        map.mapType = typesMK[segment.selectedSegmentIndex]!
        controllerPlacesIndex = places.count - 1
    }
    
    func setupView() -> Void {
        self.view.backgroundColor = UIColor.red
        let rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .organize, target: self, action: #selector(toListPlaces))
        self.navigationItem.setRightBarButton(rightBarButtonItem, animated: true)
        let longPressed = UILongPressGestureRecognizer.init(target: self, action: #selector(long_pressed))
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(taptap))
        viewEffect.addGestureRecognizer(tap)
        map.addGestureRecognizer(longPressed)
        view.addSubview(map)
        view.addSubview(viewEffect)
        view.addSubview(segment)
    }
    
    func setupConstrains() -> Void {
        constrain(viewEffect,segment){view,segment in
            view.width == (view.superview?.width)!
            view.height == (view.superview?.width)!/4
            view.centerX == (view.superview?.centerX)!
            view.bottom == (view.superview?.bottom)!
            segment.center == view.center
            segment.height == view.height/2.5
        }
    }
    
    @objc func segmentAction(sender:UISegmentedControl) -> Void {
        map.mapType = typesMK[sender.selectedSegmentIndex]!
    }
    
    @objc func toListPlaces() -> Void {
        let vc = SecondViewController.init(places: self)
        self.title = ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func taptap(sender: UITapGestureRecognizer) -> Void {
        let right = self.view.bounds.width/2 - segment.bounds.width/2 - 5
        let left = self.view.bounds.width/2 + segment.bounds.width/2 + 5
        if right <= sender.location(in: viewEffect).x{
            controllerPlacesIndex = min(controllerPlacesIndex+1,places.count-1)
            if (places.count != 0){
                zoomRegion(places[controllerPlacesIndex])
            }
        }
        else if left >= sender.location(in: viewEffect).x{
            controllerPlacesIndex = max(controllerPlacesIndex-1,0)
            if (places.count != 0){
                zoomRegion(places[controllerPlacesIndex])
            }
        }
    }
    
    func zoomRegion(_ place:NSManagedObject) -> Void {
        self.title = ( place.value(forKey: "title") as! String)
        let location = CLLocationCoordinate2D.init(latitude: (place.value(forKey: "x") as? Double)!, longitude: (place.value(forKey: "y") as? Double)!)
        let region = MKCoordinateRegionMakeWithDistance(location, 1000, 1000)
        self.map.setRegion(region, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotetionView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "identifiers")
        annotetionView.canShowCallout = true
        let infoButton = UIButton(type: .infoLight)
        annotetionView.rightCalloutAccessoryView = infoButton
        infoButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)

        
        annotetionView.pinTintColor = .green
        return annotetionView
    }
    
    @objc func infoButtonTapped() -> Void {
        let vc = ThirdViewController()
        self.title = ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func long_pressed(sender:UILongPressGestureRecognizer) -> Void {
        let location = map.convert(sender.location(in: map), toCoordinateFrom: self.view)
        let alert = UIAlertController(title: "Title", message: "Subtitle", preferredStyle: .alert)
        alert.addTextField { (textField) -> Void in
            textField.placeholder = "Title"
        }
        alert.addTextField { (textField) -> Void in
            textField.placeholder = "Subtitle"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (_) -> Void in
            print("Cancel")
        }
        let saveAction = UIAlertAction(title: "Save", style: .default) { (_) -> Void in
            let title = alert.textFields?[0].text!
            let subtitle = alert.textFields?[1].text!
            if(title != "" && subtitle != ""){
                let region = MKCoordinateRegionMakeWithDistance(location, 1000, 1000)
                self.map.setRegion(region, animated: true)
                self.addAnnotation(title: title!, subtitle: subtitle!, location: location)
                self.saveData(title: title!, subtitle: subtitle!, x: location.latitude, y: location.longitude)
            }
            else{
                let alert = UIAlertController(title: "Error", message: "Try again..", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .default) { (_) -> Void in
                    print("OK")
                }
                alert.addAction(cancelAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func saveData(title:String,subtitle:String,x:Double,y:Double) -> Void {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Entity", in: context!)
        let item = NSManagedObject.init(entity: entity!, insertInto: context)
        item.setValue(x, forKey: "x")
        item.setValue(y, forKey: "y")
        item.setValue(title, forKey: "title")
        item.setValue(subtitle, forKey: "subtitle")
        do{
            try context?.save()
            places.append(item)
        }
        catch{
            print("error")
        }
    }
    
    func addAnnotation(title:String,subtitle:String,location:CLLocationCoordinate2D) -> Void {
        let pin = MKPointAnnotation.init()
        pin.title = title
        pin.subtitle = subtitle
        pin.coordinate = location
        self.map.addAnnotation(pin)
    }
    
    func setAllAnnotation() -> Void {
        for i in map.annotations{
            map.removeAnnotation(i)
        }
        for i in places{
            let location = CLLocationCoordinate2D.init(latitude: (i.value(forKey: "x") as? Double)!, longitude: (i.value(forKey: "y") as? Double)!)
            addAnnotation(title: (i.value(forKey: "title") as? String)! , subtitle: (i.value(forKey: "subtitle") as? String)!, location: location)
        }
    }
    
    func getData() -> Void {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        let fetch = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Entity")
        
        do{
            let result = try context?.fetch(fetch) as? [NSManagedObject]
            places = result!
        }
        catch{return}
    }
}
