//
//  MyfeedViewController.swift
//  DailyWeather
//
//  Created by 신동규 on 2018. 8. 24..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class MyfeedViewController: UIViewController {

    @IBOutlet weak var feedTV: UITableView!
    
    let heat = ["","따뜻해요","더워요","너무더워요"]
    let humidity = ["","건조해요","적당해요","습해요"]
    let wind = ["","시원해요","적당해요","추워요"]
    let top = ["","나시","반팔","5/7부","긴팔"]
    let bottom = ["","반바지","긴바지","짧은치마","긴치마"]
    let outer = ["","가디건","자켓","패딩","코트","겉옷없음"]
    var feedmodel: Feed?
    let getmyfeed = DeleteDataNM()
    let userdata = UserDefaults.standard

    override func viewDidLoad() {
       
        super.viewDidLoad()
        feedTV.delegate = self
        feedTV.dataSource = self
        
        getmyfeed.getmyfeeddata(user_id: userdata.string(forKey: "userid")!, token: userdata.string(forKey: "usertoken")!) { [weak self]feed in
            
            if feed?.success == true{
                
                self?.feedmodel = feed
                self?.feedTV.reloadData()
                
            }
        }
       
    }
    override func viewWillAppear(_ animated: Bool) {
        getmyfeed.getmyfeeddata(user_id: userdata.string(forKey: "userid")!, token: userdata.string(forKey: "usertoken")!) { [weak self]feed in
            
            if feed?.success == true{
                
                self?.feedmodel = feed
                self?.feedTV.reloadData()
                
            }
        }
    }

    

}


extension MyfeedViewController : UITableViewDelegate{
    
    
    
}
extension MyfeedViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if gino(feedmodel?.data?.count) == 0{
            navigationController?.toolbar.isHidden = false
            return 1
        }
        else{
            navigationController?.toolbar.isHidden = false
            return gino(feedmodel?.data?.count)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if gino(feedmodel?.data?.count) == 0{
            tableView.separatorStyle = .none
            let cell = tableView.dequeueReusableCell(withIdentifier: "defaultcell") as! DefaultTableViewCell
            return cell
        }else{
            tableView.separatorStyle = .singleLine
            let cell = tableView.dequeueReusableCell(withIdentifier: "feedcell") as! FeedTableViewCell
            cell.timeLB.text = feedmodel?.data?[indexPath.row].created_at
            cell.postImg.imageFromUrl(feedmodel?.data?[indexPath.row].image, defaultImgPath: "sunnyG")
            cell.contentLB.text = feedmodel?.data?[indexPath.row].content
            cell.statisticsLB.text = "\(heat[(feedmodel?.data?[indexPath.row].heat)!])|\(humidity[(feedmodel?.data?[indexPath.row].humidity)!])|\(wind[(feedmodel?.data?[indexPath.row].air_volume)!])|\(top[(feedmodel?.data?[indexPath.row].user_top)!])|\(bottom[(feedmodel?.data?[indexPath.row].user_bottom)!])|\(outer[(feedmodel?.data?[indexPath.row].user_outer)!])"
            cell.statisticsLB.sizeToFit()
            return cell
        }
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nextview = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailview") as! DetailViewController
        nextview.data = feedmodel?.data?[indexPath.row]
        nextview.modifycount = 1
        
        navigationController?.toolbar.isHidden = false
        navigationController?.pushViewController(nextview, animated: true)
    }
    
    
    
    
}
