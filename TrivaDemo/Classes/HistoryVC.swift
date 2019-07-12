//
//  HistoryVC.swift
//  TrivaDemo
//
//  Created by kushal on 09/07/19.
//  Copyright © 2019 ajeet. All rights reserved.
//

import UIKit

class HistoryVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    //MARK:- IBOutlets
    @IBOutlet var tblHistory: UITableView!
    
    //MARK:- Variable
    var arrAllUserDetails = [UserDetails]()
    
    //MARK:- ViewDidLoad Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        arrAllUserDetails.removeAll()
        arrAllUserDetails = UserDetails.shared.fetchData()
    }
      //MARK:- IBAction
    
    @IBAction func btnHome_DidSelect(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    // MARK: - TableView Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrAllUserDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EndCell") as! EndCell
        cell.selectionStyle = .none
        if let arrDetails = arrAllUserDetails[indexPath.row] as? UserDetails {
            cell.lblName.text = arrDetails.name
            
            if let answer = arrDetails.first_answer{
                let firstAnswer = "Answer: \(answer)"
                cell.lblFirstAnswer.text = firstAnswer
            }
            if let answer = arrDetails.second_answer{
                let SecondAnswer = "Answer: \(answer)"
                cell.lblSecondAnswer.text = SecondAnswer
            }
            if let date = arrDetails.date{
                let id =  (indexPath.row)
                let sequence = (id+1)
                let gameDate = "GAME: \(sequence) DATE - \(date)"
                cell.lblDate.text = gameDate
            }
        }
        return cell
    }
 
}

