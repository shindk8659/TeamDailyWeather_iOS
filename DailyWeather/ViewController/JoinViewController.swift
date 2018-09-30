//
//  JoinViewController.swift
//  DailyWeather
//
//  Created by 신동규 on 2018. 8. 14..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class JoinViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var idTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var passCheckTF: UITextField!
    @IBOutlet weak var locationPV: UITextField!
    @IBOutlet weak var JoinBtn: UIButton!
    @IBOutlet weak var passDuplicateLB: UILabel!
    
    let joinmodule = JoinNM()
    
    @IBAction func joinAction(_ sender: Any) {
        
        joinmodule.join(id: gsno(idTF.text), pass: gsno(passTF.text), passcheck: gsno(passCheckTF.text), gu: gsno(locationPV.text)) { [weak self] join in
            if join?.success == false{
                if join?.errors?.password?.message == "Should be minimum 8 characters of alphabet and number combination!" {
                    
                    self?.JoinBtn.isEnabled = false
                    self?.JoinBtn.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
                    self?.passTF.text = ""
                    self?.passCheckTF.text = ""
                    self?.passDuplicateLB.text = "X"
                    let alertController = UIAlertController(title: "",message: "비밀번호를 8자이상 영어와 숫자조합으로 만들어주세요!", preferredStyle: UIAlertController.Style.alert)
                    let cancelButton = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
                    alertController.addAction(cancelButton)
                    self?.present(alertController,animated: true,completion: nil)
                }else if join?.errors?.username?.message == "This username already exists!"{
                    self?.JoinBtn.isEnabled = false
                    self?.JoinBtn.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
                    self?.idTF.text = ""
                    let alertController = UIAlertController(title: "",message: "아이디가 중복 입니다! 다시 기입해주세요.", preferredStyle: UIAlertController.Style.alert)
                    let cancelButton = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
                    alertController.addAction(cancelButton)
                    self?.present(alertController,animated: true,completion: nil)
                }else if join?.errors?.id?.message == "Should be 4-12 characters!"{
                    self?.JoinBtn.isEnabled = false
                    self?.JoinBtn.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
                    self?.idTF.text = ""
                    let alertController = UIAlertController(title: "",message: "아이디는 4~12 알파벳으로 만들어주세요!", preferredStyle: UIAlertController.Style.alert)
                    let cancelButton = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
                    alertController.addAction(cancelButton)
                    self?.present(alertController,animated: true,completion: nil)
                }
                
                
            }else{
                let alertController = UIAlertController(title: "",message: "회원가입이 되었습니다.", preferredStyle: UIAlertController.Style.alert)
                let cancelButton = UIAlertAction(title: "로그인하러 가기", style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
                    self?.navigationController?.popViewController(animated: true)
                })
                alertController.addAction(cancelButton)
                self?.present(alertController,animated: true,completion: nil)
            }
        }
    }
    
    var dongname = ""
    var pickOption = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"]
    var dong = ["삼성동","성내1동","수유3동","화곡6동","봉천동","자양동","구로동","시흥동","상계6.7동","방학동","용두동","노량진2동","성산동","연희동","서초2동","행당동","삼선동5가","신천동","신정6동","당산동","이태원동","녹번동","수송동","예관동","신내동"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        
        
        JoinBtn.isEnabled = false
        JoinBtn.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        passDuplicateLB.isHidden = true
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
    
        idTF.setBottomBorder(backcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), bordercolor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
        passTF.setBottomBorder(backcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), bordercolor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
        passCheckTF.setBottomBorder(backcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), bordercolor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
        locationPV.setBottomBorder(backcolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), bordercolor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
        locationPV.inputView = pickerView
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        toolBar.barStyle = UIBarStyle.blackTranslucent
        toolBar.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        toolBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        toolBar.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(donePressed))
        toolBar.setItems([doneButton], animated: true)
        locationPV.inputAccessoryView = toolBar
        
        initAddtarget()

    }
    func initAddtarget(){
        
        
        idTF.addTarget(self, action: #selector(idCheck), for: .editingChanged)
        passTF.addTarget(self, action: #selector(passCheck), for: .editingChanged)
        passCheckTF.addTarget(self, action: #selector(passCheck), for: .editingChanged)
        
        
    }
    @objc func idCheck(){
        
        isValid()
        
    }
    @objc func passCheck(){
        
        if passTF.text != passCheckTF.text{
          
            passDuplicateLB.isHidden = false
            passDuplicateLB.text = "X"
            isValid()
        }
        else if passTF.text == passCheckTF.text{
            passDuplicateLB.isHidden = false
            passDuplicateLB.text = "O"
            isValid()
         
            if passTF.text == "" && passCheckTF.text == "" {
                passDuplicateLB.isHidden = true
                passDuplicateLB.text = ""
                isValid()
                
            }
        }
        
    }
    
    @objc func donePressed(sender: UIBarButtonItem) {
        
        locationPV.resignFirstResponder()
        isValid()

    }
    
    @objc func isValid(){
        
        if (idTF.text?.isEmpty)! || (passTF.text?.isEmpty)! || (passCheckTF.text?.isEmpty)! || (locationPV.text?.isEmpty)! || passDuplicateLB.text == "X" || passDuplicateLB.text == "" {
            
            JoinBtn.isEnabled = false
            JoinBtn.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            
        }
        else {
                JoinBtn.isEnabled = true
                JoinBtn.backgroundColor = #colorLiteral(red: 0.5378260612, green: 0.7710625529, blue: 0.9162429571, alpha: 1)
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
        locationPV.text = pickOption[row]
        dongname = dong[row]
    }
    
    


}
