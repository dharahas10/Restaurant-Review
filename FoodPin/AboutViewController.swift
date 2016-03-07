//
//  AboutViewController.swift
//  FoodPin
//
//  Created by Dharahas Tallapally on 23/10/15.
//  Copyright © 2015 Dharahas Tallapally. All rights reserved.
//

import MessageUI
import UIKit

class AboutViewController: UIViewController ,MFMailComposeViewControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sendMail(sender: AnyObject){
        
        if MFMessageComposeViewController.canSendText(){
            
            var compose = MFMailComposeViewController()
            compose.delegate = self
            compose.mailComposeDelegate = self
            compose.setToRecipients(["kanna.dharahas@gmail.com"])
            compose.navigationBar.tintColor = UIColor.whiteColor()
            self.presentViewController(compose, animated: true, completion: { () -> Void in
                
                UIApplication.sharedApplication().statusBarStyle = .LightContent
                
            })
            
        }
        
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?){
        switch result.rawValue {
        case MFMailComposeResultCancelled.rawValue:
            print("Cancelled")
        case MFMailComposeResultSaved.rawValue:
            print("Saved")
        case MFMailComposeResultSent.rawValue:
            print("Sent")
        case MFMailComposeResultFailed.rawValue:
            print("Mail send Failed: \(error!.localizedDescription)")
        default:
            break
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
