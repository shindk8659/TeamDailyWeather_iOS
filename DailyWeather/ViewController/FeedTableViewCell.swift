//
//  FeedTableViewCell.swift
//  DailyWeather
//
//  Created by 신동규 on 2018. 8. 24..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var statisticsLB: UILabel!
    
    @IBOutlet weak var contentLB: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var timeLB: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
