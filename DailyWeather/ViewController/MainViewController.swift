//
//  ViewController.swift
//  DailyWeather
//
//  Created by 신동규 on 2018. 7. 26..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit
import Floaty
class MainViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate{
    

    var pickOption = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"]
    var dong = ["삼성동","성내1동","수유3동","화곡6동","봉천동","자양동","구로동","시흥동","상계6.7동","방학동","용두동","노량진2동","성산동","연희동","서초2동","행당동","삼선동5가","신천동","신정6동","당산동","이태원동","녹번동","수송동","예관동","신내동"]
    let heat = ["","따뜻해요","더워요","너무더워요"]
    let humidity = ["","건조해요","적당해요","습해요"]
    let wind = ["","시원해요","적당해요","바람이세요"]
    let top = ["","나시","반팔","5/7부","긴팔"]
    let bottom = ["","반바지","긴바지","짧은치마","긴치마"]
    let outer = ["","가디건","자켓","패딩","코트","겉옷없음"]
    let heatimg = [nil,#imageLiteral(resourceName: "hot1W"),#imageLiteral(resourceName: "hot2W"),#imageLiteral(resourceName: "hot3W")]
    let humidityimg = [nil,#imageLiteral(resourceName: "humidity1W"),#imageLiteral(resourceName: "humidity2W"),#imageLiteral(resourceName: "humidity3W")]
    let windimg = [nil,#imageLiteral(resourceName: "wind1W"),#imageLiteral(resourceName: "wind2W"),#imageLiteral(resourceName: "wind3W")]
    let topimg = [nil,#imageLiteral(resourceName: "sleevelessW"),#imageLiteral(resourceName: "tshirtsW"),#imageLiteral(resourceName: "sleeve7W"),#imageLiteral(resourceName: "longSleeveW")]
    let bottomimg = [nil,#imageLiteral(resourceName: "shortsW"),#imageLiteral(resourceName: "trouserW"),#imageLiteral(resourceName: "shortSkirtW"),#imageLiteral(resourceName: "longSkirtW")]
    let outerimg = [nil,#imageLiteral(resourceName: "cardiganW"),#imageLiteral(resourceName: "jacketW"),#imageLiteral(resourceName: "paddingW"),#imageLiteral(resourceName: "coatW"),#imageLiteral(resourceName: "noOuterW")]
    let userdata = UserDefaults.standard
   
    @IBOutlet weak var heatavgimg: UIImageView!
    @IBOutlet weak var humavgimg: UIImageView!
    @IBOutlet weak var windavgimg: UIImageView!
    @IBOutlet weak var topavgimg: UIImageView!
    @IBOutlet weak var bottomavgimg: UIImageView!
    @IBOutlet weak var outeravgimg: UIImageView!
    @IBOutlet weak var mainTV: UITableView!
    @IBOutlet weak var selectGuPV: UITextField!
    @IBOutlet weak var tempLB: UILabel!
    @IBOutlet weak var guLB: UILabel!
    @IBOutlet weak var compareLB: UILabel!
    @IBOutlet weak var realLB: UILabel!
    @IBOutlet weak var uvLB: UILabel!
    @IBOutlet weak var uvcommentLB: UILabel!
    @IBOutlet weak var heatavgLB: UILabel!
    @IBOutlet weak var humavgLB: UILabel!
    @IBOutlet weak var windavgLB: UILabel!
    @IBOutlet weak var bottomavgLB: UILabel!
    @IBOutlet weak var outeravgLB: UILabel!
    @IBOutlet weak var topavgLB: UILabel!
    @IBOutlet weak var avcommentLB: UILabel!
    
    let weatherModule = TNM()
    let feedMoudule = FeedDataNM()
    let avgNM = GetAvgNM()
    var weather: TWeahter?
    var feedmodel: Feed?
    var dongname = ""


    override func viewDidLoad() {
        super.viewDidLoad()
       
        avcommentLB.isHidden = true
        navigationController?.toolbar.isHidden = true
        let floaty = Floaty()
        floaty.plusColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        floaty.buttonColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
        floaty.addItem("", icon: #imageLiteral(resourceName: "compose"), handler: { [weak self] item in
            let gotopost = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "postview") as! PostViewController
           
            self?.navigationController?.toolbar.isHidden = false
            self?.navigationController?.pushViewController(gotopost , animated: true)
            
            floaty.close()
        }).buttonColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
        floaty.addItem("", icon: #imageLiteral(resourceName: "profile"), handler: { [weak self] item in
            let gotomypage = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mypagenavi") as! MypageNaviViewController
            self?.present(gotomypage, animated: true, completion: nil)
            
            floaty.close()
        }).buttonColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
       

        self.view.addSubview(floaty)
        
        navigationController?.navigationBar.isHidden = true
        let pickerView = UIPickerView()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        selectGuPV.setBottomBorder(backcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0), bordercolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0))
        selectGuPV.inputView = pickerView
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height - 20.0)
        toolBar.barStyle = UIBarStyle.blackTranslucent
        toolBar.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        toolBar.tintColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
        toolBar.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let doneButton = UIBarButtonItem(title: "확인", style: UIBarButtonItem.Style.done, target: self, action:#selector(donePressed))
        toolBar.setItems([doneButton], animated: true)
     
        
        selectGuPV.inputAccessoryView = toolBar
        mainTV.delegate = self
        mainTV.dataSource = self
        
        getfirstweather()
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)]
        navigationController?.navigationBar.isHidden = true
        navigationController?.toolbar.isHidden = true
        selectGuPV.text = "오늘 그곳의 날씨는?"
        getfirstweather()
        
        
    }
    func getfirstweather(){
        for i in 0..<pickOption.count{
            if pickOption[i] == userdata.string(forKey: "usergu"){
                
                weatherModule.TWeather(city: "서울", county: gsno(userdata.string(forKey: "usergu")) , village: dong[i]) { [weak self] temp in
                    if temp != nil{
                        self?.weather = temp
                        let stringtemp = temp?.weather?.minutely?[0].temperature?.tc
                        let doubletemp: Double = Double(stringtemp!)!
                        let inttemp:Int = Int(doubletemp)
                        self?.tempLB.text = "\(String(describing: inttemp))°"
                        self?.guLB.text = "서울시 \((self?.userdata.string(forKey: "usergu"))!)"
                        self?.compareLB.text = temp?.weather?.minutely?[0].sky?.name
                        
                        // 구별 데이터 리스트 보여주기
                        self?.feedMoudule.getfeeddata(gu: (self?.userdata.string(forKey: "usergu"))!, token: (self?.userdata.string(forKey: "usertoken"))!, completion: { [weak self] feed in
                            
                            if feed?.success == true{
                                
                                self?.feedmodel = feed
                                self?.mainTV.reloadData()
                            }
                            if feed?.data?.count == 0{
                                self?.avcommentLB.isHidden = false
                                self?.heatavgimg.isHidden = true
                                self?.humavgimg.isHidden = true
                                self?.windavgimg.isHidden = true
                                self?.topavgimg.isHidden = true
                                self?.bottomavgimg.isHidden = true
                                self?.outeravgimg.isHidden = true
                                
                                self?.heatavgLB.isHidden = true
                                self?.humavgLB.isHidden = true
                                self?.windavgLB.isHidden = true
                                self?.topavgLB.isHidden = true
                                self?.bottomavgLB.isHidden = true
                                self?.outeravgLB.isHidden = true
                                
                            }
                            else{
                                self?.avgNM.deletedata(gu: (self?.userdata.string(forKey: "usergu"))!, completion: { [weak self]avg in
                                     self?.avcommentLB.isHidden = true
                                    self?.heatavgimg.isHidden = false
                                    self?.humavgimg.isHidden = false
                                    self?.windavgimg.isHidden = false
                                    self?.topavgimg.isHidden = false
                                    self?.bottomavgimg.isHidden = false
                                    self?.outeravgimg.isHidden = false
                                    
                                    self?.heatavgLB.isHidden = false
                                    self?.humavgLB.isHidden = false
                                    self?.windavgLB.isHidden = false
                                    self?.topavgLB.isHidden = false
                                    self?.bottomavgLB.isHidden = false
                                    self?.outeravgLB.isHidden = false
                                    if avg?.success == true{
                                        self?.heatavgimg.image = self?.heatimg[(avg?.heat)!]
                                        self?.humavgimg.image = self?.humidityimg[(avg?.humidity)!]
                                        self?.windavgimg.image = self?.windimg[(avg?.air_volume)!]
                                        self?.topavgimg.image = self?.topimg[(avg?.user_top)!]
                                        self?.bottomavgimg.image = self?.bottomimg[(avg?.user_bottom)!]
                                        self?.outeravgimg.image = self?.outerimg[(avg?.user_outer)!]
                                        
                                        self?.heatavgLB.text = self?.heat[(avg?.heat)!]
                                        self?.humavgLB.text = self?.humidity[(avg?.humidity)!]
                                        self?.windavgLB.text = self?.wind[(avg?.air_volume)!]
                                        self?.topavgLB.text = self?.top[(avg?.user_top)!]
                                        self?.bottomavgLB.text = self?.bottom[(avg?.user_bottom)!]
                                        self?.outeravgLB.text = self?.outer[(avg?.user_outer)!]
                                        
                                    }
                                    
                                    
                                })

                            }
                            
                            
                        })
                        self?.weatherModule.TUV(lon: (temp?.weather?.minutely?[0].station?.longitude)!, lat: (temp?.weather?.minutely?[0].station?.latitude)!, completion: { [weak self] uv in
                            if uv != nil{
                                if uv?.weather?.wIndex?.uvindex?[0].day00?.index == ""{
                                    self?.uvcommentLB.text = ""
                                    self?.uvLB.text = "오늘은 해가 저물었어요!"
                                }
                                else{
                                    let stringuv = uv?.weather?.wIndex?.uvindex?[0].day00?.index
                                    let doubleuv :Double = Double(stringuv!)!
                                    let intuv = Int(doubleuv)
                                    self?.uvLB.text = "자외선 \(String(describing: intuv/10))"
                                    self?.uvcommentLB.text = uv?.weather?.wIndex?.uvindex?[0].day00?.comment
                                }
                            }
                        })
                        
                        self?.weatherModule.TWCT(lon: (temp?.weather?.minutely?[0].station?.longitude)!, lat: (temp?.weather?.minutely?[0].station?.latitude)!, completion: { [weak self] wct in
                            if wct != nil{
                                let stringmin = self?.weather?.weather?.minutely?[0].temperature?.tmin
                                let stringmax = self?.weather?.weather?.minutely?[0].temperature?.tmax
                                let wcttemp = wct?.weather?.wIndex?.wctIndex?[0].current?.index
                                let doublemin: Double = Double(stringmin!)!
                                let doublemax: Double = Double(stringmax!)!
                                let doublewct:Double = Double(wcttemp!)!
                                let intmin = Int(doublemin)
                                let intmax = Int(doublemax)
                                let intwct = Int(doublewct)
                                self?.realLB.text = "\(intmin)° / \(intmax)° | 체감온도 : \(intwct)°"
                            }
                        })
                        
                    }
                }
                break
                
            }
        }
    }
    @objc func donePressed(sender: UIBarButtonItem) {
        
        selectGuPV.resignFirstResponder()
        if  selectGuPV.text != "오늘 그곳의 날씨는?"{
            
            weatherModule.TWeather(city: "서울", county: selectGuPV.text!, village: dongname) { [weak self] temp in
            if temp != nil{
                self?.weather = temp
                let stringtemp = temp?.weather?.minutely?[0].temperature?.tc
                let doubletemp: Double = Double(stringtemp!)!
                let inttemp:Int = Int(doubletemp)
                self?.tempLB.text = "\(String(describing: inttemp))°"
                self?.guLB.text = "서울시 \(String(describing: (self?.selectGuPV.text)!))"
                self?.compareLB.text = temp?.weather?.minutely?[0].sky?.name
                
                // 구별 데이터 리스트 보여주기
                self?.feedMoudule.getfeeddata(gu: (self?.selectGuPV.text)!, token: (self?.userdata.string(forKey: "usertoken"))!, completion: { [weak self] feed in
                    
                    if feed?.success == true{
                        
                        self?.feedmodel = feed
                        self?.mainTV.reloadData()
                    }
                    if feed?.data?.count == 0{
                         self?.avcommentLB.isHidden = false
                        self?.heatavgimg.isHidden = true
                        self?.humavgimg.isHidden = true
                        self?.windavgimg.isHidden = true
                        self?.topavgimg.isHidden = true
                        self?.bottomavgimg.isHidden = true
                        self?.outeravgimg.isHidden = true
                        
                        self?.heatavgLB.isHidden = true
                        self?.humavgLB.isHidden = true
                        self?.windavgLB.isHidden = true
                        self?.topavgLB.isHidden = true
                        self?.bottomavgLB.isHidden = true
                        self?.outeravgLB.isHidden = true
                        
                    }
                    else{
                        self?.avgNM.deletedata(gu: (self?.selectGuPV.text)!, completion: { [weak self]avg in
                            self?.avcommentLB.isHidden = true
                            self?.heatavgimg.isHidden = false
                            self?.humavgimg.isHidden = false
                            self?.windavgimg.isHidden = false
                            self?.topavgimg.isHidden = false
                            self?.bottomavgimg.isHidden = false
                            self?.outeravgimg.isHidden = false
                            
                            self?.heatavgLB.isHidden = false
                            self?.humavgLB.isHidden = false
                            self?.windavgLB.isHidden = false
                            self?.topavgLB.isHidden = false
                            self?.bottomavgLB.isHidden = false
                            self?.outeravgLB.isHidden = false
                            
                            if avg?.success == true{
                                self?.heatavgimg.image = self?.heatimg[(avg?.heat)!]
                                self?.humavgimg.image = self?.humidityimg[(avg?.humidity)!]
                                self?.windavgimg.image = self?.windimg[(avg?.air_volume)!]
                                self?.topavgimg.image = self?.topimg[(avg?.user_top)!]
                                self?.bottomavgimg.image = self?.bottomimg[(avg?.user_bottom)!]
                                self?.outeravgimg.image = self?.outerimg[(avg?.user_outer)!]
                                
                                self?.heatavgLB.text = self?.heat[(avg?.heat)!]
                                self?.humavgLB.text = self?.humidity[(avg?.humidity)!]
                                self?.windavgLB.text = self?.wind[(avg?.air_volume)!]
                                self?.topavgLB.text = self?.top[(avg?.user_top)!]
                                self?.bottomavgLB.text = self?.bottom[(avg?.user_bottom)!]
                                self?.outeravgLB.text = self?.outer[(avg?.user_outer)!]
                                
                            }
                            
                            
                        })
                        
                    }
                    
                    
                })
                
                self?.weatherModule.TUV(lon: (temp?.weather?.minutely?[0].station?.longitude)!, lat: (temp?.weather?.minutely?[0].station?.latitude)!, completion: { [weak self] uv in
                    if uv != nil{
                        if uv?.weather?.wIndex?.uvindex?[0].day00?.index == ""{
                            self?.uvcommentLB.text = ""
                            self?.uvLB.text = "오늘은 해가 저물었어요!"
                        }
                        else{
                          
                            let stringuv = uv?.weather?.wIndex?.uvindex?[0].day00?.index
                            let doubleuv :Double = Double(stringuv!)!
                            let intuv = Int(doubleuv)
                            self?.uvLB.text = "자외선 \(String(describing: intuv/10))"
                            self?.uvcommentLB.text = uv?.weather?.wIndex?.uvindex?[0].day00?.comment
                        }
                    }
                })
                
                self?.weatherModule.TWCT(lon: (temp?.weather?.minutely?[0].station?.longitude)!, lat: (temp?.weather?.minutely?[0].station?.latitude)!, completion: { [weak self] wct in
                    if wct != nil{
                        let stringmin = self?.weather?.weather?.minutely?[0].temperature?.tmin
                        let stringmax = self?.weather?.weather?.minutely?[0].temperature?.tmax
                        let wcttemp = wct?.weather?.wIndex?.wctIndex?[0].current?.index
                        let doublemin: Double = Double(stringmin!)!
                        let doublemax: Double = Double(stringmax!)!
                        let doublewct:Double = Double(wcttemp!)!
                        let intmin = Int(doublemin)
                        let intmax = Int(doublemax)
                        let intwct = Int(doublewct)
                        
                        
                        self?.realLB.text = "\(intmin)° / \(intmax)° | 체감온도 : \(intwct)°"
                    }
                })
                
            }
        }
        
        }
        else{
            let alertController = UIAlertController(title: "",message: "구를 선택해주세요!", preferredStyle: UIAlertController.Style.alert)
            let cancelButton = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
            alertController.addAction(cancelButton)
            self.present(alertController,animated: true,completion: nil)
            
        }
        
    }
 
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return pickOption.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickOption[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectGuPV.text = pickOption[row]
        dongname = dong[row]
    }
    


}
extension MainViewController : UITableViewDelegate{
    
    
    
}
extension MainViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if gino(feedmodel?.data?.count) == 0{
            return 1
        }
        else{
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "maincell") as! MainTableViewCell
            cell.timeLB.text = feedmodel?.data?[indexPath.row].created_at
            cell.postImg.imageFromUrl(feedmodel?.data?[indexPath.row].image, defaultImgPath: "sunnyG")
            cell.contentLB.text = feedmodel?.data?[indexPath.row].content
            cell.statisticsLB.text = "\(heat[(feedmodel?.data?[indexPath.row].heat)!])|\(humidity[(feedmodel?.data?[indexPath.row].humidity)!])|\(wind[(feedmodel?.data?[indexPath.row].air_volume)!])|\(top[(feedmodel?.data?[indexPath.row].user_top)!])|\(bottom[(feedmodel?.data?[indexPath.row].user_bottom)!])|\(outer[(feedmodel?.data?[indexPath.row].user_outer)!])"
            cell.statisticsLB.sizeToFit()
            return cell
        }

        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if gino(feedmodel?.data?.count) != 0{
        let nextview = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailview") as! DetailViewController
        nextview.data = feedmodel?.data?[indexPath.row]
      
        navigationController?.navigationBar.isHidden = false
        navigationController?.pushViewController(nextview, animated: true)
        }
        
    }
    
    
    
    
}
