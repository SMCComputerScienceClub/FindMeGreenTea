//
//  SplashScreenViewController.swift
//  googleMap
//
//  Created by Stewart Dulaney on 11/8/18.
//  Copyright © 2018 Vinson Han. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    @IBAction func splashScreenButton(_ sender: UIButton) {
        performSegue(withIdentifier: "splashScreenSegue", sender: self)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
