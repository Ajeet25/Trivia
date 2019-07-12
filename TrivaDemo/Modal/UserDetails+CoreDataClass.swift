//
//  UserDetails+CoreDataClass.swift
//  TrivaDemo
//
//  Created by kushal on 08/07/19.
//  Copyright © 2019 ajeet. All rights reserved.
//
//
import UIKit
import Foundation
import CoreData

@objc(UserDetails)
public class UserDetails: NSManagedObject {
    
    static let shared = UserDetails()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    var getDict = NSMutableArray ()
    var arrDetails = [[UserDetails]]()
    
    //MARK:- Save Data
    func saveData(dict: [String:Any]) {
        var strUserid = Int64()
        if let Userid =  dict["id"] as? Int64{
            strUserid = Userid
        }
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserDetails")
        request.predicate = NSPredicate(format: "id = %d", strUserid )
        request.returnsObjectsAsFaults = false
        do{
            let fetchReq = try! context!.fetch(request)
            if fetchReq.count != 0{
                self.UpdateData(id: strUserid, userdict: dict)
            } else  {
                let userEntity = NSEntityDescription.insertNewObject(forEntityName: "UserDetails", into: context!) as! UserDetails
                userEntity.id = dict["id"] as! Int64
                userEntity.name = dict["name"] as? String
                userEntity.date = dict["date"] as? String
                do{
                    try! context!.save()
                    print("Data Saved")
                }
            }
        }
    }
    
    //MARK:- Update Data
    func UpdateData(id: Int64, userdict : [String:Any]) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserDetails")
        // let request:NSFetchRequest<UserDetails> = UserDetails.fetchRequest()
        request.predicate = NSPredicate(format: "id = %ld", id)
        do{
            let test = try! context?.fetch(request)
            if test?.count != 0{
                let objupdate = test![0] as! NSManagedObject
                //objupdate.setValue("roman", forKey: "country")
                if let id = userdict["id"] as? Int64{
                    objupdate.setValue(id, forKey: "id")
                }
                if let username = userdict["name"] as? String {
                    objupdate.setValue(username, forKey: "name")
                }
                if let  FirstAnswer = userdict["firstanswer"] as? String {
                    objupdate.setValue(FirstAnswer, forKey: "first_answer")
                }
                if let  SecondAnswer = userdict["secondanswer"] as? String {
                    objupdate.setValue(SecondAnswer, forKey: "second_answer")
                }
                do{
                    try! context?.save()
                    print("Update Data saved.")
                }
            }
            else{
                return
            }
        }
    }
    //MARK:- Retrive Data
    
    func fetchData() -> [UserDetails] {
        
        var allUsersDetails  = [UserDetails]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserDetails")
        do {
            allUsersDetails = try! context?.fetch(fetchRequest) as! [UserDetails]
            for location in allUsersDetails {
                print(location)
            }
        }
        return allUsersDetails
    }
}



