//
//  SLTwitterManager.swift
//  SocialLogin
//
//  Created by Karthick Selvaraj on 10/11/16.
//  Copyright © 2016 Mallow Technologies Private Limited. All rights reserved.
//

import UIKit
import TwitterKit

class SLTwitterManager: NSObject {
   
    static let sharedInstance = SLTwitterManager()
    var details: [(String, String?)] = []
    var userId: String?
    
    func fetchUserData(userName: String, userID: String, completionHandler: (TWTRUser?, NSError?) -> Void) {
        userId = userID
        let test = TWTRAPIClient(userID: userID)
        test.loadUserWithID(userID, completion: { (user, error) in
            if error == nil {
                self.details = [("Picture", "\((user?.profileImageURL)! as String)"), ("User Name", "\(userName)"), ("Formatted Screen Name", "\((user?.formattedScreenName)! as String)")]
                completionHandler(user, error)
            } else {
                
            }
        })
    }
    
    func logOut() {
        self.details =  []
        if userId != nil {
         Twitter.sharedInstance().sessionStore.logOutUserID(userId!)
        }
    }
    
}
