//
//  SearchTableViewCell.swift
//  LosHermanosTuristas
//
//  Created by Alexandre  on 9/3/16.
//  Copyright © 2016 BR.PUCRS.INF.HACKATRUCK. All rights reserved.
//




import UIKit

class SearchTableViewCell: UITableViewCell {

    // MARK: Properties
    
    
   
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
   
    @IBOutlet weak var photoImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
