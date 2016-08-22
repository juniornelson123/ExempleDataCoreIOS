//
//  ProductTableView.swift
//  FoodExemple
//
//  Created by junior on 20/08/16.
//  Copyright © 2016 junior. All rights reserved.
//

import UIKit
import CoreData
class ProductTableView: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!
    var products = [Product]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadProducts()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func loadProducts()
    {
        
        var photo1: UIImage!
        
        
        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context = appDel.managedObjectContext
        
        var request = NSFetchRequest(entityName: "Product")
        request.returnsObjectsAsFaults=false
        
        do{
            let results = try context.executeFetchRequest(request)
            
            for result in results{
                
                var name = result.valueForKey("name")!
                var photo = result.valueForKey("image")! as! NSData
                var rating = result.valueForKey("rating")!
                
                var image:UIImage=UIImage.init(data: photo)!
                
                var product = Product(name: name as! String, photo: image, rating: rating as! Int)
                print(image)
                print(result.valueForKey("name")!)
                print(result.valueForKey("rating")!)
                
                products.append(product!)
            }
            
        }catch{
            print("Erro ao pegar resultado")
        }

//        
//        let url = NSURL(string: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSWG8Ez3F4Y8uhdqdM532-TnbWfrQ4h4VHNhQshbBbyoNxCe0N906Co0A")
//
//        //        let urlRequest = NSURLRequest(URL: url!)
//        
//        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) -> Void in
//            
//            let imageContainer = UIImage(data: data!)
//          
//        
//            photo1 = imageContainer!
//          
//            print(photo1)
//            
//            let product1 = Product(name: "Arroz", photo: photo1, rating: 3)!
//            
//            let product2 = Product(name: "Feijão", photo: photo1, rating: 5)!
//            
//            let product3 = Product(name: "Farinha", photo: photo1, rating: 2)!
//            
//            self.products += [product1,product2,product3]
//        }
//        
//        task.resume()
//        
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentify = "ProductTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentify, forIndexPath: indexPath) as! ProductTableViewCell
        
        let product = products[indexPath.row]
        
        cell.nameLabel.text = product.name
        cell.productImageView.image = product.photo
        cell.ratingControl.rating = product.rating
        
        return cell

    }
}
