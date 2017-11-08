//
//  ItemTableViewCell.swift
//  training
//
//  Created by Benedykt Ziobro on 07/11/2017.
//  Copyright © 2017 Benedykt Ziobro. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var IdLabel: UILabel!
    @IBOutlet weak var TextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
