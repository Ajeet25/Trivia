//
//  AnserwsVC.swift
//  TrivaDemo
//
//  Created by kushal on 11/07/19.
//  Copyright © 2019 ajeet. All rights reserved.
//

import UIKit
import CoreData

class AnserwsVC: UIViewController {
   
    //MARK:- IBOutlets
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblFirstAnswer: UILabel!
    @IBOutlet var lblSecondAnswer: UILabel!
   
    //MARK:- Variable
    var dictAnswedData = [String:Any]()
    var currentTime = Int64()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
     //MARK:- ViewDidLoad Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let userID = Int64(currentTime)
        self.fetchData(id: userID)
        self.ShowData()
        // Do any additional setup after loading the view.
    }
    
    func fetchData(id :Int64) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserDetails")
        request.predicate = NSPredicate(format: "id = %ld", id)
        request.returnsObjectsAsFaults = false
        do{
            let result = try context!.fetch(request)
            for item in result as! [NSManagedObject] {
                print(item)
                let keys = Array(item.entity.attributesByName.keys)
                dictAnswedData = item.dictionaryWithValues(forKeys: keys)
                print("dictAnswedData", dictAnswedData)
            }
        }
        catch{
            print(error)
        }
    }
    
    func ShowData() {
        if dictAnswedData.keys.count != 0{
            if let name =  dictAnswedData["name"] as? String{
                self.lblName.text =  name
            }
            if let answer = dictAnswedData["first_answer"] as? String {
                let firstAnswer = "Answer: \(answer)"
                self.lblFirstAnswer.text = firstAnswer
            }
            if let answer = dictAnswedData["second_answer"] as? String{
                let SecondAnswer = "Answer: \(answer)"
                self.lblSecondAnswer.text = SecondAnswer
            }
        }
    }
    //MARK:- IBAction
    @IBAction func btnFinish_DidSelect(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func btnHistory_DidSelect(_ sender: Any) {
        let historyPage = self.storyboard?.instantiateViewController(withIdentifier: "HistoryVC") as! HistoryVC
        self.navigationController?.pushViewController(historyPage, animated: true)
    }
}



