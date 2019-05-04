//
//  CellTableView.swift
//  Assignment6
//
//  Created by Enrique on 2019-05-03.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class CellTableView: UITableViewCell {

    @IBOutlet var labelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
