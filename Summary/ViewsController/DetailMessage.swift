//
//  DetailMessage.swift
//  Summary
//
//  Created by diego paredes on 31/10/19.
//  Copyright © 2019 Wilman Rojas. All rights reserved.
//

struct OrderDetails {
    var nights = Int()
    var cleaningFee = Int()
    var petFee = Int()
    var lodgingTax = Int()
    var refundableDamage = Int()
    var firstPayment = Int()
    var datePayment = String()
    var total = Int()
    var orderStatus = Int()
    var paymentStatus = Int()
}

struct SectionsMessagesData {
    var opened = Bool()
    var title = String()
}

import UIKit

class DetailMessage: UIViewController {

    @IBOutlet weak var tableDetails: UITableView!
    
    var orderDetail = OrderDetails()
    var sectionsData = [SectionsMessagesData]()
    var orderDetailsInSection = SectionsMessagesData()
    
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
        
        initDemoData()
    }
    
    func initDemoData(){
        orderDetail.nights = 200
        orderDetail.cleaningFee = 200
        orderDetail.petFee = 400
        orderDetail.lodgingTax = 200
        orderDetail.refundableDamage = 350
        orderDetail.firstPayment = 200
        orderDetail.datePayment = "10/10/2018"
        orderDetail.total = 800
        orderDetail.orderStatus = 1
        orderDetail.paymentStatus = 1
        sectionsData = [
            SectionsMessagesData(opened: false, title: "QuoteDetails"),
            SectionsMessagesData(opened: false, title: "Payment Schedule")
        ]
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
            print (sectionsData[0].opened )
            print((sectionsData[0].opened == true) ? 2 : 1)
            return (sectionsData[0].opened == true) ? 2 : 1
        case 2:
            return (sectionsData[1].opened == true) ? 2 : 1
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
            //return (indexPath.row == 0) ? (titleCell!) : (contentCell!)
            if indexPath.row == 0 {
                return titleCell!
            }else{
                return contentCell!
            }
        case 2:
            //return (indexPath.row == 0) ? (titleCell!) : (contentCell!)
            if indexPath.row == 0 {
                return titleCell!
            }else{
                return contentCell!
            }
        case 3:
            return footerCell!
        default:
            return headerCell!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 && (indexPath.section == 1 || indexPath.section == 2)  {
            let sectionOfData = indexPath.section == 1 ? 0 : 1
            if sectionsData[sectionOfData].opened == true{
                sectionsData[sectionOfData].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableDetails.reloadSections(sections, with: .none)
            }else{
                sectionsData[sectionOfData].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableDetails.reloadSections(sections, with: .none)
                print()
            }
        }else{
            //is header or footer section
        }
    }
    
}
