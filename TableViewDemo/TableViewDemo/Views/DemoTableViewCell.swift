//
//  DemoTableViewCell.swift
//  TableViewDemo
//
//  Created by David McLaren on 4/28/17.
//  Copyright © 2017 David McLaren. All rights reserved.
//

import UIKit

class DemoTableViewCell: UITableViewCell {
    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
