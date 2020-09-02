//
//  DemoTableViewCell.swift
//  MultiSelectionDemo
//
//  Created by Mac_Admin on 02/09/20.
//  Copyright © 2020 Mac_Admin. All rights reserved.
//

import UIKit

class DemoTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
