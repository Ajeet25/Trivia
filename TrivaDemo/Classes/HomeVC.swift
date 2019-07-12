//
//  HomeVC.swift
//  TrivaDemo
//
//  Created by kushal on 08/07/19.
//  Copyright © 2019 ajeet. All rights reserved.
//

import UIKit
import CoreData

class HomeVC: UIViewController,UITextFieldDelegate {
    
    //MARK:- IBOutlets
    @IBOutlet var txtUserName: UITextField!
    @IBOutlet var btnNext: UIButton!
    
    //MARK:- Variable
    var user: [NSManagedObject] = []
    var currentTime = Int64()
    let date = Date()
    let formatter = DateFormatter()
    
    //MARK:- ViewDidLoad Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        formatter.dateFormat = "d MMMM, h:mm a"
    }
    override func viewWillAppear(_ animated: Bool) {
        self.txtUserName.text = ""
        currentTime = getCurrentMillis()
    }
    
    func checkValdiation() -> Bool {
        if txtUserName.text == ""{
            onShowAlertController(title: "Error", message: kEmptyNameError)
            return false
        } else if txtUserName.text!.count < 3{
            onShowAlertController(title: "Error", message: kMinNameLenghtError)
            return false
        }
        return true
    }
    
    func getCurrentMillis()->Int64 {
        return Int64(Date().timeIntervalSince1970 * 1000)
    }
    
    //MARK:- IBAction
    @IBAction func btnNext_DidSelect(_ sender: Any) {
        if checkValdiation(){
            let currentDate = formatter.string(from: self.date)
            var userName = [String:Any]()
            let name = txtUserName.text
            userName["name"] = name
            userName["id"] = currentTime
            userName["date"] = currentDate
            
            UserDetails.shared.saveData(dict: userName)
            let FirstQue = self.storyboard?.instantiateViewController(withIdentifier: "FirstQuestionVC") as! FirstQuestionVC
            FirstQue.currentTime = currentTime
            self.navigationController?.pushViewController(FirstQue, animated: true)
        }
    }
    //MARK:- TextField Delegates
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField.text == "" && string == " ") {
            return false
        }
        if (range.length + range.location > textField.text!.count) {
            return false;
        }
        let inverseSet = CharacterSet(charactersIn:"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz").inverted
        let newLength = textField.text!.count + string.count - range.length;
        let components = string.components(separatedBy: inverseSet)
        let filtered = components.joined(separator: "")
        if string == filtered {
            if ( textField == txtUserName) {
                return newLength > 20 ? false : true;
            }
        }
        return false
    }
}



