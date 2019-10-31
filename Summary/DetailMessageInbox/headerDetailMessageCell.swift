//
//  headerDetailMessageCell.swift
//  Summary
//
//  Created by diego paredes on 30/10/19.
//  Copyright © 2019 Wilman Rojas. All rights reserved.
//

import UIKit

class headerDetailMessageCell: UITableViewCell {

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var legend: UILabel!
    @IBAction func editQuote(_ sender: Any) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
