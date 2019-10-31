//
//  contentSectionDetailMessageCell.swift
//  Summary
//
//  Created by diego paredes on 31/10/19.
//  Copyright © 2019 Wilman Rojas. All rights reserved.
//

import UIKit

class contentSectionDetailMessageCell: UITableViewCell {

    @IBOutlet weak var propertyName: UILabel!
    @IBOutlet weak var propertyValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
