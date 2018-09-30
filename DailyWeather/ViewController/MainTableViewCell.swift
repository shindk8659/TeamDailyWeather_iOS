//
//  MainTableViewCell.swift
//  DailyWeather
//
//  Created by 신동규 on 2018. 7. 26..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

   

    let declarNM = DeclarNM()
   
    var _id :String = ""
    let userdata = UserDefaults.standard
    @IBOutlet weak var statisticsLB: UILabel!
    @IBOutlet weak var contentLB: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var timeLB: UILabel!
    @IBAction func declarationAction(_ sender: Any) {
        
   

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
