//
//  SliderViewCell.swift
//  Swift-study
//
//  Created by Yi Qing on 2018/4/27.
//  Copyright © 2018年 Arvin. All rights reserved.
//

import UIKit

class SliderViewCell: UITableViewCell {
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func createSliderCell(_ tableView: UITableView) -> SliderViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "sliderCell") as! SliderViewCell
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
