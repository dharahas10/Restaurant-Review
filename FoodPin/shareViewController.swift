//
//  shareViewController.swift
//  FoodPin
//
//  Created by Dharahas Tallapally on 21/10/15.
//  Copyright © 2015 Dharahas Tallapally. All rights reserved.
//

import UIKit

class shareViewController: UIViewController {

    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var dialogView: UIView!
    
    @IBOutlet weak var facebookButton:UIButton!
    @IBOutlet weak var twitterButton:UIButton!
    @IBOutlet weak var messageButton:UIButton!
    @IBOutlet weak var emailButton:UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let blurEffect = UIBlurEffect(style: .Dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        
        // Move the buttons off screen (bottom)
        let translateDown = CGAffineTransformMakeTranslation(0, 500)
        facebookButton.transform = translateDown
        messageButton.transform = translateDown
        
        // Move the buttons off screen (top)
        let translateUp = CGAffineTransformMakeTranslation(0, -500)
        twitterButton.transform = translateUp
        emailButton.transform = translateUp
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    override func viewDidAppear(animated: Bool) {
        
        let translate = CGAffineTransformMakeTranslation(0, 0)
        facebookButton.hidden = false
        twitterButton.hidden = false
        emailButton.hidden = false
        messageButton.hidden = false
        
        UIView.animateWithDuration(0.8, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations: {
            
            self.facebookButton.transform = translate
            self.emailButton.transform = translate
            
            }, completion: nil)
        
        UIView.animateWithDuration(0.8, delay: 0.5, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations: {
            
            self.twitterButton.transform = translate
            self.messageButton.transform = translate
            
            }, completion: nil)
        
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
