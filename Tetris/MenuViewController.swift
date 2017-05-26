//
//  MenuViewController.swift
//  Tetris
//
//  Created by Admin on 23.05.17.
//  Copyright (c) 2017 Yury Struchkou. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    var playerInfo: PlayerInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func play(sender: AnyObject) {
        self.performSegueWithIdentifier("MenuToPlay", sender: self)
    }
    
    @IBAction func show(sender: AnyObject) {
        self.performSegueWithIdentifier("MenuToMap", sender: self)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "MenuToMap") {
            var vc: MapViewController = segue.destinationViewController as MapViewController
            vc.playerInfo = playerInfo
        }
    }
    

}
