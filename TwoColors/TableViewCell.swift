//
//  TableViewCell.swift
//  TwoColors
//
//  Created by dwKang on 2021/01/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var cellHeadline: UILabel!
    @IBOutlet var cellBtn: UIButton!
    @IBOutlet var cellContent: UILabel!
    @IBOutlet var cellFooter: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
