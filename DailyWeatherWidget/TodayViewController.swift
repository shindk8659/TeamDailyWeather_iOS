//
//  TodayViewController.swift
//  DailyWeatherWidget
//
//  Created by 신동규 on 4/3/19.
//  Copyright © 2019 신동규. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    
    
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var locationLB: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        if let weatherData = UserDefaults.init(suiteName: "group.io.DailyWeather.Widget")?.value(forKey: "weatherData") {
            temp.text = "\(weatherData)°"
        }
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
