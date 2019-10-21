//
//  OwnerSummary.swift
//  Summary
//
//  Created by diego paredes on 21/10/19.
//  Copyright © 2019 Wilman Rojas. All rights reserved.
//

import UIKit

struct OrderSummary {
    var travelerPhoto : String = ""
    var propertyPhoto : String = ""
    var email : String = ""
    var phone : String = ""
    var propertyName : String = ""
    var dateCheckin : String = ""
    var dateCheckout : String = ""
    var dateSubmited : String = ""
    var idStatus : Int = 0
    var statusName : String = ""
    var nightsNumber : Int = 0
    var peopleNumber : Int = 0
    var total : Double = 0
}


class OwnerSummary: UIViewController {

    @IBOutlet weak var propertyPhoto: UIImageView!
    @IBOutlet weak var travelerPhotoImg: UIImageView!
    @IBOutlet weak var propertyNameLabel: UILabel!
    @IBOutlet weak var checkinDateLabel: UILabel!
    @IBOutlet weak var checkoutDateLabel: UILabel!
    @IBOutlet weak var nightsNumberLabel: UILabel!
    @IBOutlet weak var peopleNumberLabel: UILabel!
    @IBOutlet weak var dateSubmitedLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var summary : OrderSummary = OrderSummary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDemoInfo()
        renderInfo(summary: summary)
        // Do any additional setup after loading the view.
    }

    func initDemoInfo(){
        summary.travelerPhoto = "http://lorempixel.com/400/200/"
        summary.propertyPhoto = "http://lorempixel.com/400/200/"
        summary.propertyName = "502 Del Prado 2"
        summary.dateCheckin = "Jun 18, 2019"
        summary.dateCheckout = "Jun 20, 2019"
        summary.nightsNumber = 2
        summary.peopleNumber = 1
        summary.dateSubmited = "May 29, 2019"
        summary.idStatus = 0
        summary.statusName = "Blocked"
        summary.total = 180
    }
    
    func renderInfo(summary:OrderSummary){
        propertyNameLabel.text = summary.propertyName
        checkinDateLabel.text = summary.dateCheckin
        checkoutDateLabel.text = summary.dateCheckout
        nightsNumberLabel.text = String(summary.nightsNumber)
        peopleNumberLabel.text = String(summary.peopleNumber)
        dateSubmitedLabel.text = summary.dateSubmited
        statusLabel.text = summary.statusName
        totalLabel.text = String(summary.total)
        if summary.idStatus == 0 { statusLabel.textColor = .red }
        setImage(urlImage: summary.propertyPhoto, image: propertyPhoto)
        setImage(urlImage: summary.travelerPhoto, image: travelerPhotoImg)
    }
    
    func setImage(urlImage : String, image : UIImageView){
        ImageDownloadCaching.getImage(urlArg: urlImage, accesstokenArg: "")  { (remoteImage) in
            image.image = remoteImage
        }
    }
    
    @IBAction func emailAction(_ sender: Any) {
    }
    @IBAction func phoneAction(_ sender: Any) {
    }
    @IBAction func goToCalendarAction(_ sender: Any) {
    }
    @IBAction func editQuoteAction(_ sender: Any) {
    }
    @IBAction func cancelAction(_ sender: Any) {
    }
    
}
