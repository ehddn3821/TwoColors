//
//  TableViewCell.swift
//  TwoColors
//
//  Created by dwKang on 2021/01/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var cellMainView: UIView!
    @IBOutlet var cellHeadline: UILabel!
    @IBOutlet var cellReverseBtn: UIButton!
    @IBOutlet var cellContent: UILabel!
    @IBOutlet var cellFooterView: UIView!
    @IBOutlet var cellFooterContent: UILabel!
    @IBOutlet var cellFirstCopyBtn: UIButton!
    @IBOutlet var cellFirstColor: UIView!
    @IBOutlet var cellSecondBtn: UIButton!
    @IBOutlet var cellSecondColor: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Reverse 버튼
        cellReverseBtn.layer.cornerRadius = 10
        cellReverseBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)  // 오른쪽 여백
        
        // 두번째 저장버튼 옆 색상 뷰
        cellSecondColor.layer.borderWidth = 1.5
    }
    
    // Reverse 버튼 클릭
    @IBAction func reverseBtnClicked(_ sender: UIButton) {
        
        
    }
    
}
