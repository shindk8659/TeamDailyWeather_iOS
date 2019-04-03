//
//  LoginViewController.swift
//  DailyWeather
//
//  Created by 신동규 on 2018. 8. 9..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let login = LoginNM()
    let weatherModule = TNM()
    var weather: TWeahter?
    let userdata = UserDefaults.standard
    
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) {
        userdata.removeObject(forKey: "usertoken")
        userdata.removeObject(forKey: "userid")
        userdata.removeObject(forKey: "usergu")
        userdata.removeObject(forKey: "userrealid")
        userdata.synchronize()
    }
    @IBOutlet weak var idTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        
        idTF.setBottomBorder(backcolor: #colorLiteral(red: 0.1568627451, green: 0.4941176471, blue: 0.7882352941, alpha: 1), bordercolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        passTF.setBottomBorder(backcolor: #colorLiteral(red: 0.1568627451, green: 0.4941176471, blue: 0.7882352941, alpha: 1), bordercolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        
        weatherModule.TWeather(city: "서울", county: "강남구" , village: "삼성동") { [weak self] temp in
            if temp != nil{
                self?.weather = temp
                UserDefaults.init(suiteName: "group.io.DailyWeather.Widget")?.setValue(temp?.weather?.minutely?[0].temperature?.tc, forKey: "weatherData")
               
            }
        }
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }

    @IBAction func loginAction(_ sender: Any) {
        
        if idTF.text == "" || passTF.text ==  ""{
            
            if idTF.text == ""{
            let alertController = UIAlertController(title: "",message: "아이디를 입력해주세요.", preferredStyle: UIAlertController.Style.alert)
            let cancelButton = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
            alertController.addAction(cancelButton)
                self.present(alertController,animated: true,completion: nil)}
            else{
                let alertController = UIAlertController(title: "",message: "비밀번호를 입력해주세요.", preferredStyle: UIAlertController.Style.alert)
                let cancelButton = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
                alertController.addAction(cancelButton)
                self.present(alertController,animated: true,completion: nil)}
        }
        else{
            login.login(id: gsno(idTF.text), pass:gsno(passTF.text)) { [weak self] success in

               if success?.success == true{
                let userdata = UserDefaults.standard
                userdata.set(success?.data, forKey: "usertoken")
                userdata.set(success?.gu, forKey: "usergu")
                userdata.set(success?._id, forKey: "userid")
                userdata.set(success?.id, forKey: "userrealid")
                userdata.synchronize()

                let main = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainnavi") as! MainNaviViewController
                self?.present(main, animated: true, completion: nil)
               } else if success?.success == false{
                let alertController = UIAlertController(title: "",message: "정보를 제대로 입력해주세요.", preferredStyle: UIAlertController.Style.alert)
                let cancelButton = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
                alertController.addAction(cancelButton)
                self?.present(alertController,animated: true,completion: nil)
                }
            }
        }
        
        
    }
  
    
}
