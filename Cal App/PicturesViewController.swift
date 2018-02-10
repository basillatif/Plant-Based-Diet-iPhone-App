//
//  PicturesViewController.swift
//  Cal App
//
//  Created by Basil Latif on 4/17/17.
//  Copyright © 2017 Basil Latif. All rights reserved.
//

import UIKit
import CoreData

class PicturesViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var chosenImage: UIImageView!
    @IBOutlet weak var loadedImage: UIImageView!
    var data: CDControl = CDControl()
    //let insertContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
    //var viewContext: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext!
    
    @IBAction func selectImage(_ sender: Any) {
        let photoPicker = UIImagePickerController ()
        photoPicker.delegate = self
        photoPicker.sourceType = .photoLibrary
        // display image selection view
        self.present(photoPicker, animated: true, completion: nil)
    }
    @IBAction func savedImage(_ sender: Any) {
//        let ent = NSEntityDescription.entity(forEntityName: "Image", in: self.insertContext!)
        
//        let newItem = Image(entity: ent!, insertInto: self.insertContext!)
        
//        newItem.name = chosenImage.description
        let imageData = UIImagePNGRepresentation(chosenImage.image!)
//
//        newItem.picture = imageData!
//
//        do {
//            try self.insertContext?.save()
//        } catch _ {
//        }
        data.add(picture: imageData! as NSData , name: "ff")
        
       //print(newItem)
    }
    @IBAction func loadImage(_ sender: Any) {
        data = CDControl()
        if data.pic.count != 0
        {
        loadedImage.image = UIImage(data: data.pic[data.pic.count - 1].picture as Data)
        }
        
        
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Image")
//    
//        if  let fetchResults = (try? viewContext.fetch(fetchRequest)) as? [Image]
//        {
//            let x = fetchResults.count
//            print(x)
//            if x != 0 {
//                
//                let l = fetchResults[0]
//                print(l)
//                let picture = UIImage(data: l.picture  as Data)
//                self.chosenImage.image = picture
//              //  self.desc.text = picture?.description
//            }
//        }
//        data = CDControl()
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
/*
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        
        picker .dismiss(animated: true, completion: nil)
        chosenImage.image=info[UIImagePickerControllerOriginalImage] as? UIImage
        
    }*/
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            chosenImage.image = image
        }
        else if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            chosenImage.image = image
        } else{
            print("Something went wrong")
        }
        
        self.dismiss(animated: true, completion: nil)
    }

}
