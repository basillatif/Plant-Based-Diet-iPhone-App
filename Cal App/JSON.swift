//
//  JSON.swift
//  Cal App
//
//  Created by Basil Latif on 4/18/17.
//  Copyright © 2017 Basil Latif. All rights reserved.
//

import UIKit
import MapKit

class JSON: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var veg: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var price: UILabel!
    var counter: Int = 0
    
    @IBAction func next(_ sender: Any) {
        counter += 1
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func pullData(_ sender: Any) {
        let urlAsString = "http://www.vegguide.org/search/by-address/1130+University+Dr+Tempe+AZ"
        let url = URL(string: urlAsString)!
        let urlSession = URLSession.shared
        let jsonQuery = urlSession.dataTask(with: url, completionHandler: { data, response, error -> Void in
            if (error != nil) {
                print(error!.localizedDescription)
            }
            var err: NSError?
            var jsonResult = (try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
            if (err != nil) {
                print("JSON Error \(err!.localizedDescription)")
            }
            print(jsonResult)
            let setOne = (jsonResult["entries"] as? NSArray) as Array?
            let y = setOne?[0] as? [String: AnyObject]
            var name: String = (setOne?[self.counter]["name"] as! String)
            self.name.text = name
            
            var veg: String = (setOne?[self.counter]["veg_level"] as! String)
            self.veg.text=veg
            var phone: String=(setOne?[self.counter]["phone"] as! String)
            self.phone.text=phone
            var price: String = (setOne?[self.counter]["price_range"] as! String)
            self.price.text=price
        })
        jsonQuery.resume()
        
}
}
