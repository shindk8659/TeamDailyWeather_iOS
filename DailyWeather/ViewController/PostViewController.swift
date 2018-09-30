//
//  PostViewController.swift
//  DailyWeather
//
//  Created by 신동규 on 2018. 8. 22..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit




class PostViewController: UIViewController ,UIPickerViewDataSource,UIPickerViewDelegate,SendWeatherDataDelegate,SendClothDataDelegate, UITextViewDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    let picker = UIImagePickerController()
    
    let postimageview = UIImageView()
    let postNM = PostDataNM()
    var data : FeedData?
    var imagedata:Data? = nil
    let userdata = UserDefaults.standard
    var pickOption = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"]
    var dong = ["삼성동","성내1동","수유3동","화곡6동","봉천동","자양동","구로동","시흥동","상계6.7동","방학동","용두동","노량진2동","성산동","연희동","서초2동","행당동","삼선동5가","신천동","신정6동","당산동","이태원동","녹번동","수송동","예관동","신내동"]
    
    var heatcount:Int = 0
    var humiditycount:Int = 0
    var windcount:Int = 0
    var topcount:Int = 0
    var bottomcount:Int = 0
    var outercount:Int = 0
    var placeholderLabel : UILabel!
   
    let customalert2 = CustomAlert2ViewController(nibName: "CustomAlert2ViewController", bundle: nil)
    let customalert1 = CustomAlert1ViewController(nibName: "CustomAlert1ViewController", bundle: nil)
   
    //border 위한 outlet
   
    @IBOutlet weak var conview: UIView!
    @IBOutlet weak var topview: UIStackView!
    /////////////////////////
    @IBOutlet weak var heatBtn: UIButton!
    @IBOutlet weak var humidityBtn: UIButton!
    @IBOutlet weak var windBtn: UIButton!
    @IBOutlet weak var topBtn: UIButton!
    @IBOutlet weak var bottomBtn: UIButton!
    @IBOutlet weak var outerBtn: UIButton!
    @IBOutlet weak var heatLB: UILabel!
    @IBOutlet weak var humidityLB: UILabel!
    @IBOutlet weak var windLB: UILabel!
    @IBOutlet weak var topLB: UILabel!
    @IBOutlet weak var bottomLB: UILabel!
    @IBOutlet weak var outerLB: UILabel!
    @IBOutlet weak var postcontentTV: UITextView!
    @IBOutlet weak var contentview: UIView!
    @IBOutlet weak var postcontentTVlength: NSLayoutConstraint!
    @IBOutlet weak var selectGuPV: UITextField!
    
    @IBAction func backBtn(_ sender: Any) {
    
        navigationController?.popViewController(animated: true)
    }
   
   
    @IBAction func cameraBtn(_ sender: Any) {
        // imageview 추가
        picker.allowsEditing = true
        picker.sourceType = .camera
        present(picker, animated: true, completion: nil)
        
    }
    
    @IBAction func writeBtn(_ sender: Any) {

       
        if heatcount == 0 || humiditycount == 0 || windcount == 0 || topcount == 0 || bottomcount == 0 || outercount == 0  || postcontentTV.text == "" || selectGuPV.text == nil || selectGuPV.text == "장소를 선택해주세요."{
            if heatcount == 0 || humiditycount == 0 || windcount == 0 || topcount == 0 || bottomcount == 0 || outercount == 0  {
                
                let alertController = UIAlertController(title: "",message: "통계를 위해 날씨와 옷 선택을 완성해주세요!", preferredStyle: UIAlertController.Style.alert)
                let cancelButton = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
                alertController.addAction(cancelButton)
                self.present(alertController,animated: true,completion: nil)
            }
            else if selectGuPV.text == "장소를 선택해주세요." || selectGuPV.text == nil{
                let alertController = UIAlertController(title: "",message: "지역구를 해주세요!", preferredStyle: UIAlertController.Style.alert)
                let cancelButton = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
                alertController.addAction(cancelButton)
                self.present(alertController,animated: true,completion: nil)
            }
            else{
                let alertController = UIAlertController(title: "",message: "글을 작성해주세요!", preferredStyle: UIAlertController.Style.alert)
                let cancelButton = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
                alertController.addAction(cancelButton)
                self.present(alertController,animated: true,completion: nil)
                
            }
        }
        else{
            
            if postimageview.image != nil{
                imagedata = postimageview.image!.pngData()!
                postNM.join(token: userdata.string(forKey: "usertoken")!, image: imagedata!, user_id: userdata.string(forKey: "userid")!, gu: selectGuPV.text!, air_volume: String(windcount), heat: String(heatcount), cold: String(0), humidity: String(humiditycount), user_outer: String(outercount), user_top: String(topcount), user_bottom: String(bottomcount), content: postcontentTV.text) { [weak self] post in
                    
                   if post?.success == true{
                    self?.navigationController?.popViewController(animated: true)
                        
                    }
                   else{
                    let alertController = UIAlertController(title: "",message: "네트워크 오류입니다.", preferredStyle: UIAlertController.Style.alert)
                    let cancelButton = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
                    alertController.addAction(cancelButton)
                    self?.present(alertController,animated: true,completion: nil)
                    
                    }
                }
                
            }else{
                imagedata = #imageLiteral(resourceName: "defaultimg").pngData()!
                postNM.join(token: userdata.string(forKey: "usertoken")!, image: imagedata!, user_id: userdata.string(forKey: "userid")!, gu: selectGuPV.text!, air_volume: String(windcount), heat: String(heatcount), cold: String(0), humidity: String(humiditycount), user_outer: String(outercount), user_top: String(topcount), user_bottom: String(bottomcount), content: postcontentTV.text) {[weak self] post in
                   if post?.success == true{
                    self?.navigationController?.popViewController(animated: true)
                        
                    }
                   else{
                    let alertController = UIAlertController(title: "",message: "네트워크 오류입니다.", preferredStyle: UIAlertController.Style.alert)
                    let cancelButton = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
                    alertController.addAction(cancelButton)
                    self?.present(alertController,animated: true,completion: nil)
                    
                    }
        
                }
            }
        }
        
    }
    
    
    @IBAction func weather1(_ sender: Any) {
        heatselect()
    }
    @IBAction func weather2(_ sender: Any) {
        heatselect()
    }
    @IBAction func weather3(_ sender: Any) {
        heatselect()
    }
    @IBAction func weather4(_ sender: Any) {
        heatselect()
    }
    
    func heatselect(){
        navigationController?.toolbar.isHidden = true
        customalert2.view.frame.size = view.frame.size
        customalert2.view.center = view.center
        self.view.addSubview(customalert2.view)
        
    }
   
    @IBAction func cloth1(_ sender: Any) {
        clothselect()
    }
    @IBAction func cloth2(_ sender: Any) {
        clothselect()
    }
    @IBAction func cloth3(_ sender: Any) {
        clothselect()
    }
    @IBAction func cloth4(_ sender: Any) {
        clothselect()
    }
    func clothselect(){
        navigationController?.toolbar.isHidden = true
        customalert1.view.frame.size = view.frame.size
        customalert1.view.center = view.center
        self.view.addSubview(customalert1.view)
        
    }
    var dongname = ""
   
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[.originalImage] as? UIImage {
                
                postimageview.image = image
                postimageview.contentMode = .scaleToFill
                postimageview.frame.size.width = postcontentTV.layer.bounds.width
                postimageview.frame.size.height = postcontentTV.layer.bounds.width
                postimageview.frame.origin.y = 10
                postimageview.center.x = postcontentTV.center.x
                postcontentTVlength.constant =  postcontentTV.layer.bounds.width + 10
                contentview.addSubview(postimageview)
                //do something with an image
                
            } else {
                print("Not able to get an image")
            }

        
        dismiss(animated: true, completion: nil)
        
    }
    func sendClothPressed(tvalue: UIImage, tcount: Int, bvalue: UIImage, bcount: Int, ovalue: UIImage, ocount: Int) {
        navigationController?.toolbar.isHidden = false
        topBtn.setImage(tvalue, for: .normal)
        topcount = tcount
        bottomBtn.setImage(bvalue, for: .normal)
        bottomcount = bcount
        outerBtn.setImage(ovalue, for: .normal)
        outercount = ocount
        print("여기")
        print(ocount)
        if tcount == 0{
            topLB.isHidden = true
            topLB.text = ""
            
        }else if tcount == 1{
            topLB.isHidden = false
            topLB.text = "나시"
            
        }else if tcount == 2{
            topLB.isHidden = false
            topLB.text = "반팔"
            
        }else if tcount == 3{
            topLB.isHidden = false
            topLB.text = "5/7부"
        }
        else if tcount == 4{
            topLB.isHidden = false
            topLB.text = "긴팔"
        }
        
        if bcount == 0{
            bottomLB.isHidden = true
            bottomLB.text = ""
            
        }else if bcount == 1{
            bottomLB.isHidden = false
            bottomLB.text = "반바지"
            
        }else if bcount == 2{
            bottomLB.isHidden = false
            bottomLB.text = "긴바지"
            
        }else if bcount == 3{
            bottomLB.isHidden = false
            bottomLB.text = "짧은치마"
            
        }else if bcount == 4{
            bottomLB.isHidden = false
            bottomLB.text = "긴치마"
        }
        
        if ocount == 0{
            outerLB.isHidden = true
            outerLB.text = ""
            
        }else if ocount == 1{
            outerLB.isHidden = false
            outerLB.text = "가디건"
            
        }else if ocount == 2{
            outerLB.isHidden = false
            outerLB.text = "자켓"
            
        }else if ocount == 3{
            outerLB.isHidden = false
            outerLB.text = "패딩"
            
        }else if ocount == 4{
            outerLB.isHidden = false
            outerLB.text = "코트"
        }else if ocount == 5{
            outerLB.isHidden = false
            outerLB.text = "겉옷없음"
        }
        
        
    }
    
    func sendWeatherPressed(hvalue: UIImage, hcount: Int, humvalue: UIImage, humcount: Int,wvalue:UIImage,wcount:Int) {
        navigationController?.toolbar.isHidden = false
        heatBtn.setImage(hvalue, for: .normal)
        heatcount = hcount
        humidityBtn.setImage(humvalue, for: .normal)
        humiditycount = humcount
        windBtn.setImage(wvalue, for: .normal)
        windcount = wcount
        
        if hcount == 0 {
            heatLB.isHidden = true
            heatLB.text = ""
        }else if hcount == 1{
            heatLB.isHidden = false
            heatLB.text = "따뜻해요"
        }else if hcount == 2{
            heatLB.isHidden = false
            heatLB.text = "더워요"
        }else if hcount == 3{
            heatLB.isHidden = false
            heatLB.text = "너무더워요"
        }
        if humcount == 0 {
            humidityLB.isHidden = true
            humidityLB.text = ""
            
        }else if humcount == 1{
            humidityLB.isHidden = false
            humidityLB.text = "건조해요"
            
        }else if humcount == 2{
            humidityLB.isHidden = false
            humidityLB.text = "적당해요"
        }else if humcount == 3{
            humidityLB.isHidden = false
            humidityLB.text = "습해요"
        }
        if wcount == 0 {
            windLB.isHidden = true
            windLB.text = ""
            
        }else if wcount == 1{
            windLB.isHidden = false
            windLB.text = "시원해요"
            
        }else if wcount == 2{
            windLB.isHidden = false
            windLB.text = "적당해요"
            
        }else if wcount == 3{
            windLB.isHidden = false
            windLB.text = "바람이세요"
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationController?.navigationBar.isHidden = true
       
            heatLB.isHidden = true
            humidityLB.isHidden = true
            windLB.isHidden = true
            topLB.isHidden = true
            bottomLB.isHidden = true
            outerLB.isHidden = true
     
        picker.delegate = self
        topview.addTopBorderWithColor(color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), width: 0.5)
        conview.addTopBorderWithColor(color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), width: 0.5)
        postcontentTV.delegate = self
        placeholderLabel = UILabel()
        placeholderLabel.text = "여기를 눌러서 글을 작성할 수 있습니다."
        placeholderLabel.font = UIFont.italicSystemFont(ofSize: (postcontentTV.font?.pointSize)!)
        placeholderLabel.sizeToFit()
        postcontentTV.addSubview(placeholderLabel)
        placeholderLabel.frame.origin = CGPoint(x: 5, y: (postcontentTV.font?.pointSize)! / 2)
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.isHidden = !postcontentTV.text.isEmpty
   
        
        self.customalert2.delegate = self
        self.customalert1.delegate = self
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
        
        
    
    }
    @objc func donePressed(sender: UIBarButtonItem) {
        
        selectGuPV.resignFirstResponder()
        
    }
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
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
