//
//  CustomAlert2ViewController.swift
//  DailyWeather
//
//  Created by 신동규 on 2018. 8. 22..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit
protocol SendWeatherDataDelegate{
    
    func sendWeatherPressed(hvalue:UIImage,hcount:Int,humvalue:UIImage,humcount:Int,wvalue:UIImage,wcount:Int)
    
    
}

class CustomAlert2ViewController: UIViewController {

    var heatcount : Int = 0
    var heatimage : UIImage = #imageLiteral(resourceName: "hot1G")
    var humiditycount: Int = 0
    var humidityimage: UIImage = #imageLiteral(resourceName: "humidity1G")
    var windcount:Int = 0
    var windimage:UIImage = #imageLiteral(resourceName: "wind1G")
    
    var delegate: SendWeatherDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        // Do any additional setup after loading the view.
    }
   
    @IBOutlet weak var heat1Btn: UIButton!
    @IBOutlet weak var heat2Btn: UIButton!
    @IBOutlet weak var heat3Btn: UIButton!
    @IBOutlet var humidityBtn: [UIButton]!
    @IBOutlet var windBtn: [UIButton]!
    
    @IBOutlet var heatLB: [UILabel]!
    @IBOutlet var humidityLB: [UILabel]!
    @IBOutlet var windLB: [UILabel]!
    
    
    @IBAction func selectBtn(_ sender: Any) {
        self.delegate?.sendWeatherPressed(hvalue: heatimage,hcount: heatcount,humvalue:humidityimage,humcount:humiditycount,wvalue:windimage,wcount:windcount)
    view.removeFromSuperview()

    }
    
    @IBAction func heat1(_ sender: Any) {
        if heatcount == 0{
            heatcount = 1
            heat1Btn.setImage(#imageLiteral(resourceName: "hot1B"), for: UIControl.State.normal)
            heatimage = #imageLiteral(resourceName: "hot1B")
            heatLB[0].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
            print(heatcount)
        } else{
            if heatcount == 1{
                heatcount = 0
                heat1Btn.setImage(#imageLiteral(resourceName: "hot1G"), for: UIControl.State.normal)
                heatimage = #imageLiteral(resourceName: "hot1G")
                heatLB[0].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(heatcount)
            }else{
                heatcount = 1
                heat1Btn.setImage(#imageLiteral(resourceName: "hot1B"), for: UIControl.State.normal)
                heat2Btn.setImage(#imageLiteral(resourceName: "hot2G"), for: .normal)
                heat3Btn.setImage(#imageLiteral(resourceName: "hot3G"), for: .normal)
                heatLB[1].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                heatLB[2].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                heatimage = #imageLiteral(resourceName: "hot1B")
                heatLB[0].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
                print(heatcount)
            }
        }
    }
    @IBAction func heat2(_ sender: Any) {
        if heatcount == 0{
            heatcount = 2
            heat2Btn.setImage(#imageLiteral(resourceName: "hot2B"), for: UIControl.State.normal)
            heatimage = #imageLiteral(resourceName: "hot2B")
            heatLB[1].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
            print(heatcount)
        } else{
            if heatcount == 2{
                heatcount = 0
                heat2Btn.setImage(#imageLiteral(resourceName: "hot2G"), for: UIControl.State.normal)
                heatimage = #imageLiteral(resourceName: "hot1G")
                heatLB[1].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(heatcount)
            }else{
                heatcount = 2
                heat2Btn.setImage(#imageLiteral(resourceName: "hot2B"), for: UIControl.State.normal)
                heat1Btn.setImage(#imageLiteral(resourceName: "hot1G"), for: .normal)
                heat3Btn.setImage(#imageLiteral(resourceName: "hot3G"), for: .normal)
                heatLB[0].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                heatLB[2].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                heatimage = #imageLiteral(resourceName: "hot2B")
                heatLB[1].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
                print(heatcount)
            }
        }
    }
    
    @IBAction func heat3(_ sender: Any) {
        if heatcount == 0{
            heatcount = 3
            heat3Btn.setImage(#imageLiteral(resourceName: "hot3B"), for: UIControl.State.normal)
            heatimage = #imageLiteral(resourceName: "hot3B")
            heatLB[2].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
            print(heatcount)
        } else{
            if heatcount == 3{
                heatcount = 0
                heat3Btn.setImage(#imageLiteral(resourceName: "hot3G"), for: UIControl.State.normal)
                heatimage = #imageLiteral(resourceName: "hot1G")
                heatLB[2].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(heatcount)
            }else{
                heatcount = 3
                heat3Btn.setImage(#imageLiteral(resourceName: "hot3B"), for: UIControl.State.normal)
                heat1Btn.setImage(#imageLiteral(resourceName: "hot1G"), for: .normal)
                heat2Btn.setImage(#imageLiteral(resourceName: "hot2G"), for: .normal)
                heatLB[1].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                heatLB[0].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                heatimage = #imageLiteral(resourceName: "hot3B")
                heatLB[2].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
                print(heatcount)
            }
        }
        
    }
    @IBAction func humidity1(_ sender: Any) {
        if humiditycount == 0{
            humiditycount = 1
            humidityBtn[0].setImage(#imageLiteral(resourceName: "humidity1B"), for: UIControl.State.normal)
            humidityimage = #imageLiteral(resourceName: "humidity1B")
            humidityLB[0].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
            print(humiditycount)
        } else{
            if humiditycount == 1{
                humiditycount = 0
                humidityBtn[0].setImage(#imageLiteral(resourceName: "humidity1G"), for: UIControl.State.normal)
                humidityimage = #imageLiteral(resourceName: "humidity1G")
                humidityLB[0].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(humiditycount)
            }else{
                humiditycount = 1
                humidityBtn[0].setImage(#imageLiteral(resourceName: "humidity1B"), for: UIControl.State.normal)
                humidityBtn[1].setImage(#imageLiteral(resourceName: "humidity2G"), for: .normal)
                humidityBtn[2].setImage(#imageLiteral(resourceName: "humidity3G"), for: .normal)
                humidityLB[1].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                humidityLB[2].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                humidityimage = #imageLiteral(resourceName: "humidity1B")
                humidityLB[0].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
                print(humiditycount)
            }
        }
        
    }
    
    @IBAction func humidity2(_ sender: Any) {
        if humiditycount == 0{
            humiditycount = 2
            humidityBtn[1].setImage(#imageLiteral(resourceName: "humidity2B"), for: UIControl.State.normal)
            humidityimage = #imageLiteral(resourceName: "humidity2B")
            humidityLB[1].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
            print(humiditycount)
        } else{
            if humiditycount == 2{
                humiditycount = 0
                humidityBtn[1].setImage(#imageLiteral(resourceName: "humidity2G"), for: UIControl.State.normal)
                humidityimage = #imageLiteral(resourceName: "humidity1G")
                humidityLB[1].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(humiditycount)
            }else{
                humiditycount = 2
                humidityBtn[1].setImage(#imageLiteral(resourceName: "humidity2B"), for: UIControl.State.normal)
                humidityBtn[0].setImage(#imageLiteral(resourceName: "humidity1G"), for: .normal)
                humidityBtn[2].setImage(#imageLiteral(resourceName: "humidity3G"), for: .normal)
                humidityLB[0].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                humidityLB[2].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                humidityimage = #imageLiteral(resourceName: "humidity2B")
                humidityLB[1].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
                print(humiditycount)
            }
        }
    }
    
    @IBAction func humidity3(_ sender: Any) {
        if humiditycount == 0{
            humiditycount = 3
            humidityBtn[2].setImage(#imageLiteral(resourceName: "humidity3B"), for: UIControl.State.normal)
            humidityimage = #imageLiteral(resourceName: "humidity3B")
            humidityLB[2].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
            print(humiditycount)
        } else{
            if humiditycount == 3{
                humiditycount = 0
                humidityBtn[2].setImage(#imageLiteral(resourceName: "humidity3G"), for: UIControl.State.normal)
                humidityimage = #imageLiteral(resourceName: "humidity1G")
                humidityLB[2].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(heatcount)
            }else{
                humiditycount = 3
                humidityBtn[2].setImage(#imageLiteral(resourceName: "humidity3B"), for: UIControl.State.normal)
                humidityBtn[0].setImage(#imageLiteral(resourceName: "humidity1G"), for: .normal)
                humidityBtn[1].setImage(#imageLiteral(resourceName: "humidity2G"), for: .normal)
                humidityLB[1].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                humidityLB[0].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                humidityimage = #imageLiteral(resourceName: "humidity3B")
                humidityLB[2].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
                print(humiditycount)
            }
        }

        
    }
    @IBAction func wind1(_ sender: Any) {
        if windcount == 0{
            windcount = 1
            windBtn[0].setImage(#imageLiteral(resourceName: "wind1B"), for: UIControl.State.normal)
            windimage = #imageLiteral(resourceName: "wind1B")
            windLB[0].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
            print(windcount)
        } else{
            if windcount == 1{
                windcount = 0
                windBtn[0].setImage(#imageLiteral(resourceName: "wind1G"), for: UIControl.State.normal)
                windimage = #imageLiteral(resourceName: "wind1G")
                windLB[0].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(humiditycount)
            }else{
                windcount = 1
                windBtn[0].setImage(#imageLiteral(resourceName: "wind1B"), for: UIControl.State.normal)
                windBtn[1].setImage(#imageLiteral(resourceName: "wind2G"), for: .normal)
                windBtn[2].setImage(#imageLiteral(resourceName: "wind3G"), for: .normal)
                windLB[1].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                windLB[2].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                windimage = #imageLiteral(resourceName: "wind1B")
                windLB[0].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
                print(windcount)
            }
        }
    }
    
    @IBAction func wind2(_ sender: Any) {
        if windcount == 0{
            windcount = 2
            windBtn[1].setImage(#imageLiteral(resourceName: "wind2B"), for: UIControl.State.normal)
            windimage = #imageLiteral(resourceName: "wind2B")
            windLB[1].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
            print(windcount)
        } else{
            if windcount == 2{
                windcount = 0
                windBtn[1].setImage(#imageLiteral(resourceName: "wind2G"), for: UIControl.State.normal)
                windimage = #imageLiteral(resourceName: "wind1G")
                windLB[1].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(windcount)
            }else{
                windcount = 2
                windBtn[1].setImage(#imageLiteral(resourceName: "wind2B"), for: UIControl.State.normal)
                windBtn[0].setImage(#imageLiteral(resourceName: "wind1G"), for: .normal)
                windBtn[2].setImage(#imageLiteral(resourceName: "wind3G"), for: .normal)
                windLB[0].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                windLB[2].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                windimage = #imageLiteral(resourceName: "wind2B")
                windLB[1].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
                print(windcount)
            }
        }
    }
    
    @IBAction func wind3(_ sender: Any) {
        if windcount == 0{
            windcount = 3
            windBtn[2].setImage(#imageLiteral(resourceName: "wind3B"), for: UIControl.State.normal)
            windimage = #imageLiteral(resourceName: "wind3B")
            windLB[2].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
            print(windcount)
        } else{
            if windcount == 3{
                windcount = 0
                windBtn[2].setImage(#imageLiteral(resourceName: "wind3G"), for: UIControl.State.normal)
                windimage = #imageLiteral(resourceName: "wind1G")
                windLB[2].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(windcount)
            }else{
                windcount = 3
                windBtn[2].setImage(#imageLiteral(resourceName: "wind3B"), for: UIControl.State.normal)
                windBtn[0].setImage(#imageLiteral(resourceName: "wind1G"), for: .normal)
                windBtn[1].setImage(#imageLiteral(resourceName: "wind2G"), for: .normal)
                windLB[1].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                windLB[0].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                windimage = #imageLiteral(resourceName: "wind3B")
                windLB[2].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
                print(windcount)
            }
        }

    }
    
}
