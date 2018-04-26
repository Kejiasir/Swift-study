//
//  CustomViewCell.swift
//  Swift-study
//
//  Created by Yi Qing on 2018/4/26.
//  Copyright © 2018年 Arvin. All rights reserved.
//

import UIKit

class CustomViewCell: UITableViewCell {
    
    @IBOutlet weak var customView: UIView!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var datasource: Array<Any>? {
        didSet {
            if datasource != nil {
                print(datasource!)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        customView.layer.cornerRadius = customView.frame.height / 2
        iconView.layer.cornerRadius = iconView.frame.height / 2
    }
    
    class func createCustomCell(_ tableView: UITableView) -> CustomViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomViewCell
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
