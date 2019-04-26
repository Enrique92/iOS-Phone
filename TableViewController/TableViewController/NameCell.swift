//
//  NameCellTableViewCell.swift
//  TableViewController
//
//  Created by Enrique on 2019-04-26.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class NameCell: UITableViewCell {
    @IBOutlet var nameCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
