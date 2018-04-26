//
//  SliderViewController.swift
//  Swift-study
//
//  Created by Yi Qing on 2018/4/26.
//  Copyright © 2018年 Arvin. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {
    
    @IBOutlet weak var viewConstraint: NSLayoutConstraint!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var sliderView: UIView! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.title = "SliderViewController"
        
        //        blurView.layer.cornerRadius = 10
        //        sliderView.layer.shadowOffset = CGSize(width: 5, height: 0)
        //        sliderView.layer.shadowColor = UIColor.red.cgColor
        //        sliderView.layer.shadowOpacity = 0.5
        
        viewConstraint.constant = -200
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("==\(viewConstraint.constant)==")
        if viewConstraint.constant >= 0 {
            UIView.animate(withDuration: 0.2) {
                self.viewConstraint.constant = 0
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @IBAction func panPerformed(_ sender: UIPanGestureRecognizer) {
        
        if sender.state == .began || sender.state == .changed {
            
            let translation = sender.translation(in: self.view).x
            
            if translation > 0 { // swipe right
                if viewConstraint.constant < 0 {
                    UIView.animate(withDuration: 0.2) {
                        self.viewConstraint.constant += translation / 10
                        self.view.layoutIfNeeded()
                    }
                }
            } else { // swipe left
                if viewConstraint.constant > -200 {
                    UIView.animate(withDuration: 0.2) {
                        self.viewConstraint.constant += translation / 10
                        self.view.layoutIfNeeded()
                    }
                }
            }
        } else if sender.state == .ended {
            
            if viewConstraint.constant < -100 {
                UIView.animate(withDuration: 0.2) {
                    self.viewConstraint.constant = -200
                    self.view.layoutIfNeeded()
                }
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.viewConstraint.constant = 0
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}




