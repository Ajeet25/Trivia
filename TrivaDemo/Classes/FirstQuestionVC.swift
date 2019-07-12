//
//  FirstQuestionVC.swift
//  TrivaDemo
//
//  Created by kushal on 08/07/19.
//  Copyright © 2019 ajeet. All rights reserved.
//

import UIKit

class FirstQuestionVC: UIViewController {
    
    //MARK:- IBOutlets
     @IBOutlet var btnFirstOption: UIButton!
    @IBOutlet var btnSecondOption: UIButton!
    @IBOutlet var btnThirdtOption: UIButton!
    @IBOutlet var btnFourthOption: UIButton!
    
    //MARK:- Variable
    var answer = ""
    var currentTime = Int64()
    
    //MARK:- ViewDidLoad Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func CheckValidation()-> Bool{
        if answer == ""{
            onShowAlertController(title: "Error", message: kSelectOptionError)
            return false
        }
        return true
    }
   
    //MARK:- IBAction
     @IBAction func btnBack_DidSelect(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnNext_DidSelect(_ sender: Any) {
        if CheckValidation(){
            var dic =  [String:Any]()
            dic["firstanswer"] = answer
            UserDetails.shared.UpdateData(id: currentTime, userdict: dic)
            let SecondQue = self.storyboard?.instantiateViewController(withIdentifier: "SecondQuestionVC") as! SecondQuestionVC
            SecondQue.currentTime = currentTime
            self.navigationController?.pushViewController(SecondQue, animated: true)}
    }
    
    @IBAction func btnOptions(_ sender: UIButton) {
        
        if sender.tag == 101{
            answer = "Sachin Tendulkar"
            btnFirstOption.borderColor = UIColor.green
            btnSecondOption.borderColor = UIColor.white
            btnThirdtOption.borderColor = UIColor.white
            btnFourthOption.borderColor = UIColor.white
        }  else if sender.tag == 102{
            answer = "Virat Kohli"
            btnFirstOption.borderColor = UIColor.white
            btnSecondOption.borderColor = UIColor.green
            btnThirdtOption.borderColor = UIColor.white
            btnFourthOption.borderColor = UIColor.white
        } else if sender.tag == 103{
            answer = "Jacque Kallis"
            btnFirstOption.borderColor = UIColor.white
            btnSecondOption.borderColor = UIColor.white
            btnThirdtOption.borderColor = UIColor.green
            btnFourthOption.borderColor = UIColor.white
            
        } else if sender.tag == 104{
            answer = "Adam Gilchrist"
            btnFirstOption.borderColor = UIColor.white
            btnSecondOption.borderColor = UIColor.white
            btnThirdtOption.borderColor = UIColor.white
            btnFourthOption.borderColor = UIColor.green
        }
    }
}

