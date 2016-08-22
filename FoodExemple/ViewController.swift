//
//  ViewController.swift
//  FoodExemple
//
//  Created by junior on 20/08/16.
//  Copyright © 2016 junior. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITextFieldDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    @IBOutlet var productLabel: UILabel!
    @IBOutlet var productTextField: UITextField!
    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var ratingControl: RatingControl!
    
    var appDel: AppDelegate!
    var context: NSManagedObjectContext!
    var product:Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        
        context = appDel.managedObjectContext
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loadImage(sender: AnyObject) {
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = .PhotoLibrary
        
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let selectionImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        productImageView.image = selectionImage
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func registerProduct(sender: AnyObject) {
        productLabel.text=productTextField.text
        
        let name = productTextField.text ?? ""
        let photo = productImageView.image
        let rating = ratingControl.rating
        
        product=Product(name: name, photo: photo, rating: rating)
        
        var newProduct = NSEntityDescription.insertNewObjectForEntityForName("Product", inManagedObjectContext: context)
        
        var data = UIImagePNGRepresentation(photo!);
        
        newProduct.setValue(name, forKey: "name")
        newProduct.setValue(data, forKey: "image")
        newProduct.setValue(rating, forKey: "rating")
        
        do{
        
            try context.save()
       
        }catch{
            print("Erro")
        }

    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        productTextField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        self.view.endEditing(true)
    }
    
}

