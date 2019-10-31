//
//  DetailMessage.swift
//  Summary
//
//  Created by diego paredes on 31/10/19.
//  Copyright © 2019 Wilman Rojas. All rights reserved.
//

struct sectionsMessagesData {
    var opened = Bool()
    var title = String()
    var data = [String:Any]()
}

import UIKit

class DetailMessage: UIViewController {

    @IBOutlet weak var tableDetails: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //binding cell for header
        let headerCellNib = UINib(nibName: "headerDetailMessageCell", bundle: nil)
        tableDetails.register(headerCellNib, forCellReuseIdentifier: "_headerDetailMessageCell")
        //binding cell for title
        let titleCellNib = UINib(nibName: "TitleSectionDetailMessageCell", bundle: nil)
        tableDetails.register(titleCellNib, forCellReuseIdentifier: "_TitleSectionDetailMessageCell")
        //binding cell for content
        let contentCellNib = UINib(nibName: "contentSectionDetailMessageCell", bundle: nil)
        tableDetails.register(contentCellNib, forCellReuseIdentifier: "_contentSectionDetailMessageCell")
        //binding cell for footer
        let footerCellNib = UINib(nibName: "footerDetailMessageCell", bundle: nil)
        tableDetails.register(footerCellNib, forCellReuseIdentifier: "_footerDetailMessageCell")

    }
    
}

extension DetailMessage: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        case 2:
            return 2
        case 3:
            return 1
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cell header
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "_headerDetailMessageCell") as? headerDetailMessageCell
        //cell header
        let titleCell = tableView.dequeueReusableCell(withIdentifier: "_TitleSectionDetailMessageCell") as? TitleSectionDetailMessageCell
        //cell header
        let contentCell = tableView.dequeueReusableCell(withIdentifier: "_contentSectionDetailMessageCell") as? contentSectionDetailMessageCell
        //cell header
        let footerCell = tableView.dequeueReusableCell(withIdentifier: "_footerDetailMessageCell") as? footerDetailMessageCell
       
        switch indexPath.section {
        case 0:
            return headerCell!
        case 1:
            return (indexPath.row == 0) ? (titleCell!) : (contentCell!)
        case 2:
            return (indexPath.row == 0) ? (titleCell!) : (contentCell!)
        case 3:
            return footerCell!
        default:
            return headerCell!
        }
    }
    
    
}
