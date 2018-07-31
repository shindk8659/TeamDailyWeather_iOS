//
//  ViewController.swift
//  DailyWeather
//
//  Created by 신동규 on 2018. 7. 26..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    

    
    var pickOption = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"]
    var dong = ["삼성동","성내1동","수유3동","화곡6동","봉천동","자양동","구로동","시흥동","상계6.7동","방학동","용두동","노량진2동","성산동","연희동","서초2동","행당동","삼선동","신천동","신정6동","당산동","이태원동","녹번동","수송동","광희동","신내동"]
    
    
    @IBOutlet weak var mainTV: UITableView!
    @IBOutlet weak var selectGuPV: UITextField!
    @IBOutlet weak var tempLB: UILabel!
    @IBOutlet weak var guLB: UILabel!
    @IBOutlet weak var compareLB: UILabel!
    @IBOutlet weak var realLB: UILabel!
    @IBOutlet weak var uvLB: UILabel!
    @IBOutlet weak var uvcommentLB: UILabel!
    
    let weatherModel = TNM()

    var weather: TWeahter?
    var dongname = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherModel.TWeather(city: "서울", county: "동대문구", village: "용두동") { [weak self] temp in
            if temp != nil{
                self?.weather = temp
                let stringtemp = temp?.weather?.minutely?[0].temperature?.tc
                let doubletemp: Double = Double(stringtemp!)!
                let inttemp:Int = Int(doubletemp)
                self?.tempLB.text = "\(String(describing: inttemp))°"
                self?.guLB.text = "서울시 동대문구"
                self?.compareLB.text = temp?.weather?.minutely?[0].sky?.name
                
                self?.weatherModel.TUV(lon: (temp?.weather?.minutely?[0].station?.longitude)!, lat: (temp?.weather?.minutely?[0].station?.latitude)!, completion: { [weak self] uv in
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
                
                self?.weatherModel.TWCT(lon: (temp?.weather?.minutely?[0].station?.longitude)!, lat: (temp?.weather?.minutely?[0].station?.latitude)!, completion: { [weak self] wct in
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
        
        
        navigationController?.navigationBar.isHidden = true
        let pickerView = UIPickerView()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        selectGuPV.setBottomBorder()
        selectGuPV.inputView = pickerView
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        toolBar.barStyle = UIBarStyle.blackTranslucent
        toolBar.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        toolBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        toolBar.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(donePressed))
        toolBar.setItems([doneButton], animated: true)
        
        selectGuPV.inputAccessoryView = toolBar
        mainTV.delegate = self
        mainTV.dataSource = self
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
         navigationController?.navigationBar.isHidden = true
    }
    @objc func donePressed(sender: UIBarButtonItem) {
        
        selectGuPV.resignFirstResponder()
        if  selectGuPV.text != nil{
            
            weatherModel.TWeather(city: "서울", county: selectGuPV.text!, village: dongname) { [weak self] temp in
            if temp != nil{
                self?.weather = temp
                let stringtemp = temp?.weather?.minutely?[0].temperature?.tc
                let doubletemp: Double = Double(stringtemp!)!
                let inttemp:Int = Int(doubletemp)
                self?.tempLB.text = "\(String(describing: inttemp))°"
                self?.guLB.text = "서울시 \(String(describing: (self?.selectGuPV.text)!))"
                self?.compareLB.text = temp?.weather?.minutely?[0].sky?.name
                
                self?.weatherModel.TUV(lon: (temp?.weather?.minutely?[0].station?.longitude)!, lat: (temp?.weather?.minutely?[0].station?.latitude)!, completion: { [weak self] uv in
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
                
                self?.weatherModel.TWCT(lon: (temp?.weather?.minutely?[0].station?.longitude)!, lat: (temp?.weather?.minutely?[0].station?.latitude)!, completion: { [weak self] wct in
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
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "maincell") as! MainTableViewCell
       
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nextview = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailview") as! DetailViewController
        navigationController?.navigationBar.isHidden = false
        navigationController?.pushViewController(nextview, animated: true)
    }
    
    
    
    
}
