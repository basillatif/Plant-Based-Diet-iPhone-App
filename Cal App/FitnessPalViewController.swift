//
//  FitnessPalViewController.swift
//  Cal App
//
//  Created by Basil Latif on 3/20/17.
//  Copyright © 2017 Basil Latif. All rights reserved.
//

import UIKit

class FitnessPalViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var web: UIWebView!
    @IBOutlet weak var url: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.web.delegate = self
        self.web.scrollView.isScrollEnabled = true
        self.web.scalesPageToFit = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func load(_ sender: Any) {
        let webpage: String = self.url.text!
        let url = URL(string: webpage)
        let request = URLRequest(url: url!)
         web.loadRequest(request)
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
