//
//  MypageViewController.swift
//  DailyWeather
//
//  Created by 신동규 on 2018. 8. 24..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class MypageViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    
    
    let pickerbackview = UIView()
    let changeguNM = ChangeGuNM()
    let main = MainViewController()
    let userdata = UserDefaults.standard
    var changgustring : String = ""
    var pickOption = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"]
    
    @IBAction func logoutAction(_ sender: Any) {
        
        
        let alertController = UIAlertController(title: "",message: "정말로 로그아웃 하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let logoutButton = UIAlertAction(title: "로그아웃", style: UIAlertAction.Style.default, handler: { [weak self](UIAlertAction) in
          
            self?.performSegue(withIdentifier: "unwindSegueToVC1", sender: self)
        })
        let cancelButton = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel, handler:nil)
        alertController.addAction(logoutButton)
        alertController.addAction(cancelButton)
        present(alertController,animated: true,completion: nil)
        
    }
    @IBOutlet weak var guLB: UILabel!
    @IBOutlet weak var changguPicker: UIPickerView!
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    @IBAction func backbutton(_ sender: Any) {
       
        dismiss(animated: true, completion: nil)
    }
    @IBAction func myfeedAction(_ sender: Any) {
        let myfeedview = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "myfeedview") as! MyfeedViewController
        navigationController?.pushViewController(myfeedview, animated: true)

        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickOption.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickOption[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        changgustring = pickOption[row]
    }
    @IBOutlet weak var pickertoolbar: UIToolbar!
    @IBAction func guChangeAction(_ sender: Any) {
        
        changguPicker.isHidden = false
        pickertoolbar.isHidden = false
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.toolbar.isHidden = true
    }
   
    @IBAction func changegu(_ sender: Any) {
        
        if changgustring != ""{
            changeguNM.changegudata(id: userdata.string(forKey: "userrealid")!, gu: changgustring, token: userdata.string(forKey: "usertoken")!) { [weak self]changegu in
                if changegu?.success == true && changegu?.data?.nModified == 1{
                    self?.changguPicker.isHidden = true
                    self?.pickertoolbar.isHidden = true
                    self?.userdata.set(self?.changgustring, forKey: "usergu")
                    self?.userdata.synchronize()
                    self?.guLB.text = self?.changgustring
                    
                    
                }
                else{
                    let alertController = UIAlertController(title: "",message: "변경되지 않았습니다.", preferredStyle: UIAlertController.Style.alert)
                    let cancelButton = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
                    alertController.addAction(cancelButton)
                    self?.present(alertController,animated: true,completion: nil)
                    
                }
                
            }
            
        }
       
        else{
            let alertController = UIAlertController(title: "",message: "구를 선택 해주세요!", preferredStyle: UIAlertController.Style.alert)
            let cancelButton = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
            alertController.addAction(cancelButton)
            self.present(alertController,animated: true,completion: nil)
            
        }
        
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.toolbar.isHidden = true
        changguPicker.delegate = self
        changguPicker.dataSource = self
        changguPicker.isHidden = true
        pickertoolbar.isHidden = true
        guLB.text = userdata.string(forKey: "usergu")
        
        
       
    }

    

}
