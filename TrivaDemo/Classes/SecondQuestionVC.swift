//
//  SecondQuestionVC.swift
//  TrivaDemo
//
//  Created by kushal on 08/07/19.
//  Copyright © 2019 ajeet. All rights reserved.
//

import UIKit

class SecondQuestionVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet var btnFirstOption: UIButton!
    @IBOutlet var btnSecondOption: UIButton!
    @IBOutlet var btnThirdtOption: UIButton!
    @IBOutlet var btnFourthOption: UIButton!
    
   //MARK:- Variable
    var answer = ""
    var strSecondAnswer = ""
    var currentTime = Int64()
    var arrSelectedAnswer = [String]()
    
   //MARK:- ViewDidLoad Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
          // Do any additional setup after loading the view.
    }
  
    func CheckValidation()-> Bool{
        if strSecondAnswer == ""{
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
            var dic = [String:Any]()
            dic["secondanswer"] = strSecondAnswer
             UserDetails.shared.UpdateData(id: currentTime, userdict: dic)
            
            let AnswersPage = self.storyboard?.instantiateViewController(withIdentifier: "AnserwsVC") as! AnserwsVC
            AnswersPage.currentTime = self.currentTime
            self.navigationController?.pushViewController(AnswersPage, animated: true)
         }
    }
    
    @IBAction func btnOptions(_ sender: UIButton) {
        if sender.tag == 101{
            answer = "White"
            btnFirstOption.isSelected = !btnFirstOption.isSelected
            if btnFirstOption.isSelected == true{
                btnFirstOption.borderColor = UIColor.green
            }else{
                btnFirstOption.borderColor = UIColor.white
            }
         }  else if sender.tag == 102{
            answer = "Yellow"
            btnSecondOption.isSelected = !btnSecondOption.isSelected
            if btnSecondOption.isSelected == true{
                btnSecondOption.borderColor = UIColor.green
            }else{
                btnSecondOption.borderColor = UIColor.white
            }
        } else if sender.tag == 103{
            answer = "Orange"
            btnThirdtOption.isSelected = !btnThirdtOption.isSelected
            if btnThirdtOption.isSelected == true{
                btnThirdtOption.borderColor = UIColor.green
            }else{
                btnThirdtOption.borderColor = UIColor.white
            }
        } else if sender.tag == 104{
            answer = "Green"
            btnFourthOption.isSelected = !btnFourthOption.isSelected
            if btnFourthOption.isSelected == true{
                btnFourthOption.borderColor = UIColor.green
            }else{
                btnFourthOption.borderColor = UIColor.white
            }
        }
        if arrSelectedAnswer.contains(answer){
            arrSelectedAnswer.removeAll { (str) -> Bool in
                if str == answer{
                    return true
                }
                else{
                    return false
                }
            }
        }
        else{
            arrSelectedAnswer.append(answer)
        }
       strSecondAnswer = arrSelectedAnswer.joined(separator: ",")
      }
 
}

