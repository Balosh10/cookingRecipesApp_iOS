//
//  Alert.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//

import UIKit

enum CPTypeSheet {
    case logOut
    case viewProfile
}

struct CPAlert {
    
    static var shared: CPAlert {
        return CPAlert()
    }
    
    func alertShow(_ targetVC: UIViewController,
                   title: String = "\n",
                   message: String,
                   actualizar:String = "OK",
                   completionHandler: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction((UIAlertAction(title: actualizar, style: .cancel, handler: {(action) -> Void in
                completionHandler?()
            })))
            targetVC.present(alert, animated: true, completion: nil)
        }
    }
    
    func actionSheet(targetVC: UIViewController,
                     sender: UIButton? = nil,
                     completionHandler: ((_ response: CPTypeSheet)-> Void)? = nil){
        let actionSheetController: UIAlertController = UIAlertController(title: "What do you want to do?", message: nil, preferredStyle: .actionSheet)
        
        let viewProfile: UIAlertAction = UIAlertAction(title: "View Profile", style: .default) { action -> Void in
            completionHandler?(.viewProfile)
        }
        let logOut: UIAlertAction = UIAlertAction(title: "Log Out", style: .default) { action -> Void in
            completionHandler?(.logOut)
        }
        logOut.setValue(UIColor.CPRed100, forKey: "titleTextColor")
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in }
        actionSheetController.addAction(viewProfile)
        actionSheetController.addAction(logOut)
        actionSheetController.addAction(cancelAction)
        
        if UIDevice.isPhone {
            targetVC.present(actionSheetController, animated: true, completion: nil)
        } else {
            actionSheetController.popoverPresentationController?.barButtonItem = targetVC.navigationItem.rightBarButtonItem
            targetVC.present(actionSheetController, animated: true, completion: nil)
        }
    }
}
