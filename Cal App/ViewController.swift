//
//  ViewController.swift
//  Cal App
//
//  Created by Basil Latif on 3/20/17.
//  Copyright © 2017 Basil Latif. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var data: CDControl = CDControl()
    @IBOutlet weak var DaysoftheWeek: UITableView!
    var days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"];
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
    }
    func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "week", for: indexPath)
        cell.textLabel?.text = days[indexPath.row];
        return cell;
    }
    
    @IBAction func unWindtoView(unwindSegue: UIStoryboardSegue)
    {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectedIndex: IndexPath = self.DaysoftheWeek.indexPath(for: sender as! UITableViewCell)!
        
        let name = days[selectedIndex.row];
        
        if(segue.identifier == "detailview"){
            if let viewController: DetailViewController = segue.destination as? DetailViewController {
                viewController.selectedDay = name;
            }
        }
        
    }
}

