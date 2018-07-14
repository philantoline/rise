//
//  DayViewController.swift
//  rise
//
//  Created by Phillip Antoline on 7/4/18.
//  Copyright © 2018 Phil Antoline. All rights reserved.
//

import UIKit
import Firebase

class DayViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var db: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // [START setup]
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        
        // [END setup]
        db = Firestore.firestore()
        
        let day = Day()
        
        dateLabel.text = day.date
        
        let docRef = db.collection("days").document(day.dateStamp)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
            }
            else {
                self.db.collection("days").document(day.dateStamp).setData([
                    "dateStamp": day.dateStamp,
                    "date": day.date,
                    "status": day.status
                    ]) { err in
                        if let err = err {
                            print("Error writing document: \(err)")
                        }
                        else {
                            print("Document successfully written!")
                        }
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
