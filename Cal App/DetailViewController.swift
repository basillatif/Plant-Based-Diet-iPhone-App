//
//  DetailViewController.swift
//  Cal App
//
//  Created by Basil Latif on 3/20/17.
//  Copyright © 2017 Basil Latif. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    var selectedDay = String();
    
    @IBOutlet weak var bCal: UITextField!
    @IBOutlet weak var bFiber: UITextField!
    @IBOutlet weak var lCal: UITextField!
    @IBOutlet weak var lFiber: UITextField!
    @IBOutlet weak var dCal: UITextField!
    @IBOutlet weak var dFiber: UITextField!
    @IBOutlet weak var tCal: UITextField!
    @IBOutlet weak var tFiber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func totalClicked(_ sender: Any) {
        let total:Int=Int(self.bCal.text!)!+Int(self.lCal.text!)!+Int(self.dCal.text!)!
        self.tCal.text=String(total) //cast to an int
        
        let fibtotal:Int=Int(self.bFiber.text!)!+Int(self.lFiber.text!)!+Int(self.dFiber.text!)!
        self.tFiber.text=String(fibtotal)
    }
    
    override func didReceiveMemoryWarning() {
       
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindDetail(unwindSegue: UIStoryboardSegue) {
    
    }

   

}
