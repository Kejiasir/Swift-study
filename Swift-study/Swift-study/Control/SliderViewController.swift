//
//  SliderViewController.swift
//  Swift-study
//
//  Created by Yi Qing on 2018/4/26.
//  Copyright © 2018年 Arvin. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var viewConstraint: NSLayoutConstraint!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var sliderView: UIView! 
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.title = "SliderViewController"
        
        //        blurView.layer.cornerRadius = 10
        //        sliderView.layer.shadowOffset = CGSize(width: 5, height: 0)
        //        sliderView.layer.shadowColor = UIColor.red.cgColor
        //        sliderView.layer.shadowOpacity = 0.5
        
        viewConstraint.constant = -200
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //        self.navigationController?.popViewController(animated: true)
        //        print("==\(viewConstraint.constant)==")
    }
    
    @IBAction func panPerformed(_ sender: UIPanGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            let translation = sender.translation(in: self.view).x
            
            if translation > 0 { // swipe right
                if viewConstraint.constant < 0 {
                    self.viewConstraint.constant += translation / 5
                }
            } else { // swipe left
                if viewConstraint.constant > -200 {
                    self.viewConstraint.constant += translation / 5
                }
            }
        } else if sender.state == .ended {
            if viewConstraint.constant < -100 {
                self.viewConstraint.constant = -200
            } else {
                self.viewConstraint.constant = 0
            }
        }
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SliderViewCell.createSliderCell(tableView)
        cell.iconView.image = UIImage(named: datasource[indexPath.row])
        cell.titleLabel.text = datasource[indexPath.row]
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // MARK: -
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - lazy load
    lazy var datasource: Array = { () -> [String] in
        return ["images (00)", "images (01)", "images (02)", "images (03)", "images (04)", "images (05)", "images (06)",
                "images (07)", "images (08)", "images (09)", "images (10)", "images (11)", "images (12)", "images (13)"]
    }()
    
}




