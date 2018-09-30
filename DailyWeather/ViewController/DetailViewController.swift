//
//  DetailViewController.swift
//  DailyWeather
//
//  Created by 신동규 on 2018. 7. 27..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    //통계 라벨
    
    @IBOutlet weak var heatLB: UILabel!
    @IBOutlet weak var humidityLB: UILabel!
    @IBOutlet weak var windLB: UILabel!
    @IBOutlet weak var topLB: UILabel!
    @IBOutlet weak var bottomLB: UILabel!
    @IBOutlet weak var outerLB: UILabel!
    @IBOutlet weak var heatbtn: UIButton!
    @IBOutlet weak var humbtn: UIButton!
    @IBOutlet weak var windbtn: UIButton!
    @IBOutlet weak var topbtn: UIButton!
    @IBOutlet weak var bottombtn: UIButton!
    @IBOutlet weak var outerbtn: UIButton!
    @IBOutlet weak var stackoutlet: UIStackView!
    @IBOutlet weak var guLB: UILabel!
    @IBOutlet weak var postimg: UIImageView!
    @IBOutlet weak var contentTV: UITextView!
    @IBOutlet weak var timeitem: UIBarButtonItem!
    @IBOutlet weak var singoBtnoutlet: UIBarButtonItem!
    @IBAction func singoBtn(_ sender: Any) {
    
    }
    
    var data : FeedData?
    let deleteNM = DeleteDataNM()
    let userdata = UserDefaults.standard
    let heat = ["","따뜻해요","더워요","너무더워요"]
    let humidity = ["","건조해요","적당해요","습해요"]
    let wind = ["","선선해요","적당해요","바람이세요"]
    let top = ["","나시","반팔","5/7부","긴팔"]
    let bottom = ["","반바지","긴바지","짧은치마","긴치마"]
    let outer = ["","가디건","자켓","패딩","코트","겉옷없음"]
    let heatimg = [nil,#imageLiteral(resourceName: "hot1B"),#imageLiteral(resourceName: "hot2B"),#imageLiteral(resourceName: "hot3B")]
    let humidityimg = [nil,#imageLiteral(resourceName: "humidity1B"),#imageLiteral(resourceName: "humidity2B"),#imageLiteral(resourceName: "humidity3B")]
    let windimg = [nil,#imageLiteral(resourceName: "wind1B"),#imageLiteral(resourceName: "wind2B"),#imageLiteral(resourceName: "wind3B")]
    let topimg = [nil,#imageLiteral(resourceName: "sleevelessB"),#imageLiteral(resourceName: "tshirtsB"),#imageLiteral(resourceName: "sleeve7B"),#imageLiteral(resourceName: "longSleeveB")]
    let bottomimg = [nil,#imageLiteral(resourceName: "shortsB"),#imageLiteral(resourceName: "trouserB"),#imageLiteral(resourceName: "shortSkirtB"),#imageLiteral(resourceName: "longSkirtB")]
    let outerimg = [nil,#imageLiteral(resourceName: "cardiganB"),#imageLiteral(resourceName: "jacketB"),#imageLiteral(resourceName: "paddingB"),#imageLiteral(resourceName: "coatB"),#imageLiteral(resourceName: "noOuterB")]
    var modifycount: Int = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.toolbar.isHidden = false
        guLB.text = "서울특별시 " + (data?.gu)!
        heatLB.text = heat[(data?.heat)!]
        humidityLB.text = humidity[(data?.humidity)!]
        windLB.text = wind[(data?.air_volume)!]
        topLB.text = top[(data?.user_top)!]
        bottomLB.text = bottom[(data?.user_bottom)!]
        outerLB.text = outer[(data?.user_outer)!]
        timeitem.title = data?.created_at
        heatbtn.setImage(heatimg[(data?.heat)!], for: .normal)
        humbtn.setImage(humidityimg[(data?.humidity)!], for: .normal)
        windbtn.setImage(windimg[(data?.air_volume)!], for: .normal)
        topbtn.setImage(topimg[(data?.user_top)!], for: .normal)
        bottombtn.setImage(bottomimg[(data?.user_bottom)!], for: .normal)
        outerbtn.setImage(outerimg[(data?.user_outer)!], for: .normal)
        
        postimg.imageFromUrl(data?.image, defaultImgPath: "sunnyG")
        contentTV.text = data?.content
        
        if modifycount == 1{
            MypageNaviViewController().toolbar.isHidden = false
            let rightButton = UIBarButtonItem(title: "삭제하기", style: .plain, target: self, action: #selector(self.modifyview))
            navigationItem.rightBarButtonItem = rightButton
            
        }
        
    }
    @objc func modifyview(){
        let alertController = UIAlertController(title: "",message: "정말 삭제 하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let deleteButton = UIAlertAction(title: "삭제하기", style: UIAlertAction.Style.default, handler: {[weak self](UIAlertAction) in
            
            self?.deleteNM.deletedata(_id: (self?.data?._id)!, token:(self?.userdata.string(forKey: "usertoken"))! , completion: { [weak self]delete in
                if delete?.success == true{
                    
                    self?.navigationController?.popViewController(animated: true)
                }
            })
        })
        let cancelButton = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel, handler:nil)
        alertController.addAction(cancelButton)
        alertController.addAction(deleteButton)
        self.present(alertController,animated: true,completion: nil)
        
       
        
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
