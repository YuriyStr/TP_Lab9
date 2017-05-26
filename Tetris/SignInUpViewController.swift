//
//  SignInUpViewController.swift
//  Tetris
//
//  Created by Admin on 23.05.17.
//  Copyright (c) 2017 Yury Struchkou. All rights reserved.
//

import UIKit
import CoreLocation

class SignInUpViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var login: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var pass: UITextField!
    @IBOutlet var repPass: UITextField!
    @IBOutlet var enterView: UIView!
    @IBOutlet var loginEnterField: UITextField!
    @IBOutlet var passEnterField: UITextField!
    @IBOutlet var error: UILabel!
    var locationManager: CLLocationManager!
    
    var playerInfo: PlayerInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        enterView.hidden = true;
        locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        print(error.description)
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: NSArray) {
        var currentLocation: CLLocation = locations.lastObject as CLLocation
        
        playerInfo.longitude = currentLocation.coordinate.longitude
        playerInfo.latitude = currentLocation.coordinate.latitude
        locationManager.stopUpdatingLocation();
        ModelManager.getInstance().locationUpdate(playerInfo)
        self.performSegueWithIdentifier("EnterToMenu", sender: self)
    }
    
    @IBAction func signUp(sender: AnyObject) {
        if (login.text.isEmpty || pass.text.isEmpty || repPass.text.isEmpty || email.text.isEmpty){
            error.text = "Error: some of the fields are empty"
            return
        }
        if (pass.text != repPass.text){
            error.text = "Error: you repeated your password incorrectly"
            return
        }
        var player: PlayerInfo? = PlayerInfo()
        player?.login = login.text
        player?.pass = pass.text
        player?.email = email.text
        if (ModelManager.getInstance().findPlayerWithSameLogin(player!)) {
            error.text = "Error: player with such login already exists"
        }
        else {
            if (ModelManager.getInstance().addPlayer(player!)) {
                error.text = "Sign up successful"
            }
            else {
                error.text = "Error: inserting into database failed"
            }
            
        }
    }

    @IBAction func segment(sender: AnyObject) {
        let seg = sender as UISegmentedControl
        if (seg.selectedSegmentIndex == 0){
            enterView.hidden = true;
        }
        else {
            enterView.hidden = false;
        }
    }
    
    @IBAction func enter(sender: AnyObject) {
        if (loginEnterField.text.isEmpty || passEnterField.text.isEmpty){
            error.text = "Error: some of the fields are empty"
            return
        }
        var player: PlayerInfo? = ModelManager.getInstance().getPlayer(loginEnterField.text, pass: passEnterField.text)
        if (player == nil) {
            error.text = "Error: incorrect login or password"
        }
        else {
            error.text = "Authentification successful"
            playerInfo = player!
            locationManager.startUpdatingLocation()
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "EnterToMenu"){
            var menu: MenuViewController = segue.destinationViewController as MenuViewController
            menu.playerInfo = playerInfo
        }
    }
    

}
