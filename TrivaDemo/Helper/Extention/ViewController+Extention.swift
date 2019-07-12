//
//  ViewController+Extention.swift
//  NewsDemo
//
//  Created by kushal on 03/07/19.
//  Copyright © 2019 ajeet. All rights reserved.
//
import UIKit
import Foundation

 extension UIViewController
 {
     var appDelegate:AppDelegate
    {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    // show alert controller
    func onShowAlertController(title : String?,message : String?)
    {
        let alertVC = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertVC.addAction(alertAction)
        self.present(alertVC, animated: true, completion: nil)
    }
    class activityView: UIView
    {
        
        func showHudFor(view:UIView, withText strText:String)
        {
            
            let viewContainer : UIView = UIView.init(frame: CGRect.init(x: 30, y: (ScreenSize.SCREEN_HEIGHT/2) - 100, width: (ScreenSize.SCREEN_WIDTH) - 60, height: 200))
 
            let _ : CGRect = CGRect.init(x: (viewContainer.frame.size.width/2)-30, y: (viewContainer.frame.size.height/2)-58, width: 60, height: 60)
            
            let objAJProgressView = AJProgressView()
            
            
            // Pass your image here which will come in centre of ProgressView
            
            // Pass the colour for the layer of progressView
            objAJProgressView.firstColor = UIColor.white
            
            // If you  want to have layer of animated colours you can also add second and third colour
            objAJProgressView.secondColor = UIColor.white
            objAJProgressView.thirdColor = UIColor.white
            
            // Set duration to control the speed of progressView
            objAJProgressView.duration = 3.0
            
            // Set width of layer of progressView
            objAJProgressView.lineWidth = 4.0
            
            //Set backgroundColor of progressView
            objAJProgressView.bgColor =  UIColor.black.withAlphaComponent(0.2)
            
            objAJProgressView.show()
            
            viewContainer.backgroundColor = UIColor.white
            
            self.addSubview(objAJProgressView)
        }
    }
    func showActivity(text : String)
    {
        let viewTemp = activityView()
        viewTemp.frame = (appDelegate.window?.bounds)!
        viewTemp.backgroundColor = UIColor.init(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.4)
        viewTemp.showHudFor(view: viewTemp, withText: text)
        self.view.addSubview(viewTemp)
    }
    
    func hideActivity()
    {
        for view in self.view.subviews {
            
            if view is activityView {
                
                view.removeFromSuperview()
            }
            
        }
    }
}

 



