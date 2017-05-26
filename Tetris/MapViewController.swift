//
//  MapViewController.swift
//  Tetris
//
//  Created by Admin on 23.05.17.
//  Copyright (c) 2017 Yury Struchkou. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    var playerInfo: PlayerInfo!
    //var annotations: [MKPointAnnotation]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setAnnotationsToMap()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var map: MKMapView!
    
    @IBAction func goBack(sender: AnyObject) {
        self.performSegueWithIdentifier("MapToMenu", sender: self)
    }
    
    func setAnnotationsToMap() {
        var players = ModelManager.getInstance().selectAllPlayers()
        for player in players {
            var geocoder = CLGeocoder()
            var location = CLLocation(latitude: (player as PlayerInfo).latitude as CLLocationDegrees, longitude: (player as PlayerInfo).longitude as CLLocationDegrees)
            geocoder.reverseGeocodeLocation(location, completionHandler: { (placemarks: [AnyObject]!, error: NSError!) in
                if ((error) != nil) {
                    print ("Geocode failed with error \(error)")
                    return
                }
                for placemark in placemarks {
                    var annotation = MKPointAnnotation()
                    annotation.coordinate = location.coordinate
                    annotation.subtitle = (player as PlayerInfo).email
                    annotation.title = (player as PlayerInfo).login
                    //self.annotations.append(annotation)
                    self.map.addAnnotation(annotation)
                    //self.map.viewForAnnotation(annotation).canShowCallout = true
                }
            })
            
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
