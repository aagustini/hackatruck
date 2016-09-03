//
//  SearchTableViewController.swift
//  LosHermanosTuristas
//
//  Created by Alexandre  on 9/3/16.
//  Copyright © 2016 BR.PUCRS.INF.HACKATRUCK. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController {

    
    var photos: [PhotoSearchViewModel] = [PhotoSearchViewModel]()
    
    var searchText: String?
    
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.searchText == nil {
           searchText = "Porto Alegre"   // que se passa??
        }
        
        let hash:[String:[MockPhoto]] = MockPhotoDAO.buscarPhotos(searchText!)
        
        
        for (cidade, fotos) in hash {
            if fotos.count > 0 {
                photos.append(PhotoSearchViewModel(id: fotos[0].photoId, city: cidade, message: "Número de imagens:" + String(fotos.count), imagem: fotos[0].imageLocation!))
                }
            } //UImage(named: fotos[0].imageLocation!)!)       
    }
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

 
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "SearchTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SearchTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let photo = photos[indexPath.row]
        
        cell.cityLabel.text = photo.city
        cell.messageLabel.text = photo.message
       // cell.imageView.image = photo.imagem
        
        cell.photoImage.image = UIImage(named: photo.imagem!)
        
        return cell
    }
    

     
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     
     
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
        // Delete the row from the data source
     } else if editingStyle == .Insert {
      // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        
        // send to edit?
     }
     }


 

   

    
    
}
