//
//  CustomAlert1ViewController.swift
//  DailyWeather
//
//  Created by 신동규 on 2018. 8. 22..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

protocol SendClothDataDelegate{
    
    func sendClothPressed(tvalue:UIImage,tcount:Int,bvalue:UIImage,bcount:Int,ovalue:UIImage,ocount:Int)
    
    
}

class CustomAlert1ViewController: UIViewController {
    
    var topcount:Int = 0
    var topimage:UIImage = #imageLiteral(resourceName: "sleevelessG")
    var bottomcount:Int = 0
    var bottomimage:UIImage = #imageLiteral(resourceName: "shortsG")
    var outercount:Int = 0
    var outerimage:UIImage = #imageLiteral(resourceName: "cardiganG")
    
    
    @IBOutlet var topBtn: [UIButton]!
    @IBOutlet var bottomBtn: [UIButton]!
    @IBOutlet var outerBtn: [UIButton]!
    
    @IBOutlet var topLB: [UILabel]!
    @IBOutlet var bottomLB: [UILabel]!
    @IBOutlet var outerLB: [UILabel]!
    var delegate : SendClothDataDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func selectAction(_ sender: Any) {
        self.delegate?.sendClothPressed(tvalue: topimage, tcount: topcount, bvalue: bottomimage, bcount: bottomcount, ovalue: outerimage, ocount: outercount)
        view.removeFromSuperview()
        
    }
    @IBAction func top1(_ sender: Any) {
        if topcount == 0{
            topcount = 1
            topBtn[0].setImage(#imageLiteral(resourceName: "sleevelessB"), for: UIControl.State.normal)
            topimage = #imageLiteral(resourceName: "sleevelessB")
            topLB[0].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
            print(topcount)
        } else{
            if topcount == 1{
                topcount = 0
                topBtn[0].setImage(#imageLiteral(resourceName: "sleevelessG"), for: UIControl.State.normal)
                topimage = #imageLiteral(resourceName: "sleevelessG")
                topLB[0].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(topcount)
            }else{
                topcount = 1
                topBtn[0].setImage(#imageLiteral(resourceName: "sleevelessB"), for: UIControl.State.normal)
                topBtn[1].setImage(#imageLiteral(resourceName: "tshirtsG"), for: .normal)
                topBtn[2].setImage(#imageLiteral(resourceName: "sleeve7G"), for: .normal)
                topBtn[3].setImage(#imageLiteral(resourceName: "longSleeveG"), for: .normal)
                
                topimage = #imageLiteral(resourceName: "sleevelessB")
                topLB[0].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
                topLB[1].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                topLB[2].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                topLB[3].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(topcount)
            }
        }
    }
    @IBAction func top2(_ sender: Any) {
        if topcount == 0{
            topcount = 2
            topBtn[1].setImage(#imageLiteral(resourceName: "tshirtsB"), for: UIControl.State.normal)
            topimage = #imageLiteral(resourceName: "tshirtsB")
            topLB[1].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
            print(topcount)
        } else{
            if topcount == 2{
                topcount = 0
                topBtn[1].setImage(#imageLiteral(resourceName: "tshirtsG"), for: UIControl.State.normal)
                topimage = #imageLiteral(resourceName: "sleevelessG")
                topLB[1].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(topcount)
            }else{
                topcount = 2
                topBtn[1].setImage(#imageLiteral(resourceName: "tshirtsB"), for: UIControl.State.normal)
                topBtn[0].setImage(#imageLiteral(resourceName: "sleevelessG"), for: .normal)
                topBtn[2].setImage(#imageLiteral(resourceName: "sleeve7G"), for: .normal)
                topBtn[3].setImage(#imageLiteral(resourceName: "longSleeveG"), for: .normal)
                topimage = #imageLiteral(resourceName: "tshirtsB")
                topLB[1].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
                topLB[0].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                topLB[2].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                topLB[3].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(topcount)
            }
        }
    }
    @IBAction func top3(_ sender: Any) {
        if topcount == 0{
            topcount = 3
            topBtn[2].setImage(#imageLiteral(resourceName: "sleeve7B"), for: UIControl.State.normal)
            topimage = #imageLiteral(resourceName: "sleeve7B")
            topLB[2].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
            print(topcount)
        } else{
            if topcount == 3{
                topcount = 0
                topBtn[2].setImage(#imageLiteral(resourceName: "sleeve7G"), for: UIControl.State.normal)
                topimage = #imageLiteral(resourceName: "sleevelessG")
                topLB[2].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(topcount)
            }else{
                topcount = 3
                topBtn[2].setImage(#imageLiteral(resourceName: "sleeve7B"), for: UIControl.State.normal)
                topBtn[0].setImage(#imageLiteral(resourceName: "sleevelessG"), for: .normal)
                topBtn[1].setImage(#imageLiteral(resourceName: "tshirtsG"), for: .normal)
                topBtn[3].setImage(#imageLiteral(resourceName: "longSleeveG"), for: .normal)
                topimage = #imageLiteral(resourceName: "sleeve7B")
                topLB[2].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
                topLB[0].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                topLB[1].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                topLB[3].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
            
                print(topcount)
            }
        }
    }
    @IBAction func top4(_ sender: Any) {
        if topcount == 0{
            topcount = 4
            topBtn[3].setImage(#imageLiteral(resourceName: "longSleeveB"), for: UIControl.State.normal)
            topimage = #imageLiteral(resourceName: "longSleeveB")
            topLB[3].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
            print(topcount)
        } else{
            if topcount == 4{
                topcount = 0
                topBtn[3].setImage(#imageLiteral(resourceName: "longSleeveG"), for: UIControl.State.normal)
                topimage = #imageLiteral(resourceName: "sleevelessG")
                topLB[3].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(topcount)
            }else{
                topcount = 4
                topBtn[3].setImage(#imageLiteral(resourceName: "longSleeveB"), for: UIControl.State.normal)
                topBtn[0].setImage(#imageLiteral(resourceName: "sleevelessG"), for: .normal)
                topBtn[2].setImage(#imageLiteral(resourceName: "sleeve7G"), for: .normal)
                topBtn[1].setImage(#imageLiteral(resourceName: "tshirtsG"), for: .normal)
                topimage = #imageLiteral(resourceName: "longSleeveB")
                topLB[3].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
                topLB[0].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                topLB[2].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                topLB[1].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(topcount)
            }
        }
    }
    @IBAction func bottom1(_ sender: Any) {
        if bottomcount == 0{
            bottomcount = 1
            bottomBtn[0].setImage(#imageLiteral(resourceName: "shortsB"), for: UIControl.State.normal)
            bottomimage = #imageLiteral(resourceName: "shortsB")
            bottomLB[0].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
            print(bottomcount)
        } else{
            if bottomcount == 1{
                bottomcount = 0
                bottomBtn[0].setImage(#imageLiteral(resourceName: "shortsG"), for: UIControl.State.normal)
                bottomimage = #imageLiteral(resourceName: "shortsG")
                bottomLB[0].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(bottomcount)
            }else{
                bottomcount = 1
                bottomBtn[0].setImage(#imageLiteral(resourceName: "shortsB"), for: UIControl.State.normal)
                bottomBtn[1].setImage(#imageLiteral(resourceName: "trouserG"), for: .normal)
                bottomBtn[2].setImage(#imageLiteral(resourceName: "shortSkirtG"), for: .normal)
                bottomBtn[3].setImage(#imageLiteral(resourceName: "longSkirtG"), for: .normal)
                bottomimage = #imageLiteral(resourceName: "shortsB")
                bottomLB[0].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
                bottomLB[1].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                bottomLB[2].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                bottomLB[3].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(bottomcount)
            }
        }
    }
    @IBAction func bottom2(_ sender: Any) {
        if bottomcount == 0{
            bottomcount = 2
            bottomBtn[1].setImage(#imageLiteral(resourceName: "trouserB"), for: UIControl.State.normal)
            bottomimage = #imageLiteral(resourceName: "trouserB")
            bottomLB[1].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
            print(bottomcount)
        } else{
            if bottomcount == 2{
                bottomcount = 0
                bottomBtn[1].setImage(#imageLiteral(resourceName: "trouserG"), for: UIControl.State.normal)
                bottomimage = #imageLiteral(resourceName: "shortsG")
                bottomLB[1].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(bottomcount)
            }else{
                bottomcount = 2
                bottomBtn[1].setImage(#imageLiteral(resourceName: "trouserB"), for: UIControl.State.normal)
                bottomBtn[0].setImage(#imageLiteral(resourceName: "shortsG"), for: .normal)
                bottomBtn[2].setImage(#imageLiteral(resourceName: "shortSkirtG"), for: .normal)
                bottomBtn[3].setImage(#imageLiteral(resourceName: "longSkirtG"), for: .normal)
                bottomimage = #imageLiteral(resourceName: "trouserB")
                bottomLB[1].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
                bottomLB[0].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                bottomLB[2].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                bottomLB[3].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(bottomcount)
            }
        }
    }
    @IBAction func bottom3(_ sender: Any) {
        if bottomcount == 0{
            bottomcount = 3
            bottomBtn[2].setImage(#imageLiteral(resourceName: "shortSkirtB"), for: UIControl.State.normal)
            bottomimage = #imageLiteral(resourceName: "shortSkirtB")
            bottomLB[2].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
            print(bottomcount)
        } else{
            if bottomcount == 3{
                bottomcount = 0
                bottomBtn[2].setImage(#imageLiteral(resourceName: "shortSkirtG"), for: UIControl.State.normal)
                bottomimage = #imageLiteral(resourceName: "shortsG")
                bottomLB[2].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(bottomcount)
            }else{
                bottomcount = 3
                bottomBtn[2].setImage(#imageLiteral(resourceName: "shortSkirtB"), for: UIControl.State.normal)
                bottomBtn[0].setImage(#imageLiteral(resourceName: "shortsG"), for: .normal)
                bottomBtn[1].setImage(#imageLiteral(resourceName: "trouserG"), for: .normal)
                bottomBtn[3].setImage(#imageLiteral(resourceName: "longSkirtG"), for: .normal)
                bottomimage = #imageLiteral(resourceName: "shortSkirtB")
                bottomLB[2].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
                bottomLB[0].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                bottomLB[1].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                bottomLB[3].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(bottomcount)
            }
        }
    }
    @IBAction func bottom4(_ sender: Any) {
        if bottomcount == 0{
            bottomcount = 4
            bottomBtn[3].setImage(#imageLiteral(resourceName: "longSkirtB"), for: UIControl.State.normal)
            bottomimage = #imageLiteral(resourceName: "longSkirtB")
            bottomLB[3].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
            print(bottomcount)
        } else{
            if bottomcount == 4{
                bottomcount = 0
                bottomBtn[3].setImage(#imageLiteral(resourceName: "longSkirtG"), for: UIControl.State.normal)
                bottomimage = #imageLiteral(resourceName: "shortsG")
                bottomLB[3].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(bottomcount)
            }else{
                bottomcount = 4
                bottomBtn[3].setImage(#imageLiteral(resourceName: "longSkirtB"), for: UIControl.State.normal)
                bottomBtn[0].setImage(#imageLiteral(resourceName: "shortsG"), for: .normal)
                bottomBtn[2].setImage(#imageLiteral(resourceName: "shortSkirtG"), for: .normal)
                bottomBtn[1].setImage(#imageLiteral(resourceName: "trouserG"), for: .normal)
                bottomimage = #imageLiteral(resourceName: "longSkirtB")
                bottomLB[3].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
                bottomLB[0].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                bottomLB[2].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                bottomLB[1].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(bottomcount)
            }
        }
    }
    
    @IBAction func outer1(_ sender: Any) {
        if outercount == 0{
            outercount = 1
            outerBtn[0].setImage(#imageLiteral(resourceName: "cardiganB"), for: UIControl.State.normal)
            outerimage = #imageLiteral(resourceName: "cardiganB")
            outerLB[0].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
            print(outercount)
        } else{
            if outercount == 1{
                outercount = 0
                outerBtn[0].setImage(#imageLiteral(resourceName: "cardiganG"), for: UIControl.State.normal)
                outerimage = #imageLiteral(resourceName: "cardiganG")
                outerLB[0].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(outercount)
            }else{
                outercount = 1
                outerBtn[0].setImage(#imageLiteral(resourceName: "cardiganB"), for: UIControl.State.normal)
                outerBtn[1].setImage(#imageLiteral(resourceName: "jacketG"), for: .normal)
                outerBtn[2].setImage(#imageLiteral(resourceName: "paddingG"), for: .normal)
                outerBtn[3].setImage(#imageLiteral(resourceName: "coatG"), for: .normal)
                outerBtn[4].setImage(#imageLiteral(resourceName: "noOuterG"), for: UIControl.State.normal)
                outerimage = #imageLiteral(resourceName: "cardiganB")
                outerLB[0].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
                outerLB[1].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                outerLB[2].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                outerLB[3].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                outerLB[4].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                
                print(outercount)
            }
        }
    }
    @IBAction func outer2(_ sender: Any) {
        if outercount == 0{
            outercount = 2
            outerBtn[1].setImage(#imageLiteral(resourceName: "jacketB"), for: UIControl.State.normal)
            outerimage = #imageLiteral(resourceName: "jacketB")
            outerLB[1].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
            print(outercount)
        } else{
            if outercount == 2{
                outercount = 0
                outerBtn[1].setImage(#imageLiteral(resourceName: "jacketG"), for: UIControl.State.normal)
                outerimage = #imageLiteral(resourceName: "cardiganG")
                outerLB[1].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(outercount)
            }else{
                outercount = 2
                outerBtn[1].setImage(#imageLiteral(resourceName: "jacketB"), for: UIControl.State.normal)
                outerBtn[0].setImage(#imageLiteral(resourceName: "cardiganG"), for: .normal)
                outerBtn[2].setImage(#imageLiteral(resourceName: "paddingG"), for: .normal)
                outerBtn[3].setImage(#imageLiteral(resourceName: "coatG"), for: .normal)
                outerBtn[4].setImage(#imageLiteral(resourceName: "noOuterG"), for: UIControl.State.normal)
                outerimage = #imageLiteral(resourceName: "jacketB")
                outerLB[1].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
                outerLB[0].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                outerLB[2].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                outerLB[3].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                outerLB[4].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(outercount)
            }
        }
    }
    @IBAction func outer3(_ sender: Any) {
        if outercount == 0{
           outercount = 3
            outerBtn[2].setImage(#imageLiteral(resourceName: "paddingB"), for: UIControl.State.normal)
            outerimage = #imageLiteral(resourceName: "paddingB")
            outerLB[2].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
            print(outercount)
        } else{
            if outercount == 3{
                outercount = 0
               outerBtn[2].setImage(#imageLiteral(resourceName: "paddingG"), for: UIControl.State.normal)
                outerimage = #imageLiteral(resourceName: "cardiganG")
                outerLB[2].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(outercount)
            }else{
                outercount = 3
                outerBtn[2].setImage(#imageLiteral(resourceName: "paddingB"), for: UIControl.State.normal)
                outerBtn[0].setImage(#imageLiteral(resourceName: "cardiganG"), for: .normal)
                outerBtn[1].setImage(#imageLiteral(resourceName: "jacketG"), for: .normal)
                outerBtn[3].setImage(#imageLiteral(resourceName: "coatG"), for: .normal)
                outerBtn[4].setImage(#imageLiteral(resourceName: "noOuterG"), for: UIControl.State.normal)
                outerimage = #imageLiteral(resourceName: "paddingB")
                outerLB[2].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
                outerLB[0].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                outerLB[1].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                outerLB[3].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                outerLB[4].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(outercount)
            }
        }
    }
    @IBAction func ounter4(_ sender: Any) {
        if outercount == 0{
            outercount = 4
            outerBtn[3].setImage(#imageLiteral(resourceName: "coatB"), for: UIControl.State.normal)
            outerimage = #imageLiteral(resourceName: "coatB")
            outerLB[3].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
            print(outercount)
        } else{
            if outercount == 4{
                outercount = 0
                outerBtn[3].setImage(#imageLiteral(resourceName: "coatG"), for: UIControl.State.normal)
                outerimage = #imageLiteral(resourceName: "cardiganG")
                outerLB[3].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(outercount)
            }else{
                outercount = 4
                outerBtn[3].setImage(#imageLiteral(resourceName: "coatB"), for: UIControl.State.normal)
                outerBtn[0].setImage(#imageLiteral(resourceName: "cardiganG"), for: .normal)
                outerBtn[2].setImage(#imageLiteral(resourceName: "paddingG"), for: .normal)
                outerBtn[1].setImage(#imageLiteral(resourceName: "jacketG"), for: .normal)
                outerBtn[4].setImage(#imageLiteral(resourceName: "noOuterG"), for: UIControl.State.normal)
                outerimage = #imageLiteral(resourceName: "coatB")
                outerLB[3].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
                outerLB[0].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                outerLB[2].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                outerLB[1].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                outerLB[4].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(outercount)
            }
        }
    }
    @IBAction func outer5(_ sender: Any) {
        if outercount == 0{
            outercount = 5
            outerBtn[4].setImage(#imageLiteral(resourceName: "noOuterB"), for: UIControl.State.normal)
            outerimage = #imageLiteral(resourceName: "noOuterB")
            outerLB[4].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
            print(outercount)
        } else{
            if outercount == 5{
                outercount = 0
                outerBtn[4].setImage(#imageLiteral(resourceName: "noOuterG"), for: UIControl.State.normal)
                outerimage = #imageLiteral(resourceName: "cardiganG")
                outerLB[4].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(outercount)
            }else{
                outercount = 5
                outerBtn[4].setImage(#imageLiteral(resourceName: "noOuterB"), for: UIControl.State.normal)
                outerBtn[0].setImage(#imageLiteral(resourceName: "cardiganG"), for: .normal)
                outerBtn[2].setImage(#imageLiteral(resourceName: "paddingG"), for: .normal)
                outerBtn[1].setImage(#imageLiteral(resourceName: "jacketG"), for: .normal)
                outerBtn[3].setImage(#imageLiteral(resourceName: "coatG"), for: UIControl.State.normal)
                outerimage = #imageLiteral(resourceName: "noOuterB")
                outerLB[4].textColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
                outerLB[0].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                outerLB[2].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                outerLB[1].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                outerLB[3].textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                print(outercount)
            }
        }
    }
    
    
    
   
}
