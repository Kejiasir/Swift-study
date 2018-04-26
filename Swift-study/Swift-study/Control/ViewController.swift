//
//  ViewController.swift
//  Swift-study
//
//  Created by Yi Qing on 2018/4/26.
//  Copyright © 2018年 Arvin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        self.title = "首页"
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CustomViewCell.createCustomCell(tableView)
        cell.iconView.image = UIImage(named: datasource[indexPath.row])
        cell.titleLabel.text = datasource[indexPath.row]
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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

