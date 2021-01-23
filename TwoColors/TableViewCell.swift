//
//  TableViewCell.swift
//  TwoColors
//
//  Created by dwKang on 2021/01/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var cellHeadline: UILabel!
    @IBOutlet var cellReverseBtn: UIButton!
    @IBOutlet var cellContent: UILabel!
    @IBOutlet var cellFooterView: UIView!
    @IBOutlet var cellFooterContent: UILabel!
    @IBOutlet var cellFirstCopyBtn: UIButton!
    @IBOutlet var cellSecondBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 셀 전체 View
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.black.cgColor
        
        // Button
        cellReverseBtn.layer.cornerRadius = 10
        cellReverseBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)  // 오른쪽 여백
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
