//
//  TableViewCell.swift
//  TwoColors
//
//  Created by dwKang on 2021/01/23.
//

import UIKit
import Toast

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
        
        // 저장버튼 옆 색상 뷰 테두리
        cellFirstColor.layer.borderWidth = 1.5
        cellSecondColor.layer.borderWidth = 1.5
    }
    
    // 리버스 버튼 클릭
    @IBAction func reverseBtnClicked(_ sender: UIButton) {
        
        if cellHeadline.textColor == cellSecondColor.backgroundColor {
            
            cellHeadline.textColor = cellFirstColor.backgroundColor
            cellContent.textColor = cellFirstColor.backgroundColor
            cellReverseBtn.backgroundColor = cellFirstColor.backgroundColor
            cellFooterView.backgroundColor = cellFirstColor.backgroundColor
            
            cellMainView.backgroundColor = cellSecondColor.backgroundColor
            cellReverseBtn.setTitleColor(cellSecondColor.backgroundColor, for: .normal)
            cellFooterContent.textColor = cellSecondColor.backgroundColor
            
        } else {
            
            cellHeadline.textColor = cellSecondColor.backgroundColor
            cellContent.textColor = cellSecondColor.backgroundColor
            cellReverseBtn.backgroundColor = cellSecondColor.backgroundColor
            cellFooterView.backgroundColor = cellSecondColor.backgroundColor
            
            cellMainView.backgroundColor = cellFirstColor.backgroundColor
            cellReverseBtn.setTitleColor(cellFirstColor.backgroundColor, for: .normal)
            cellFooterContent.textColor = cellFirstColor.backgroundColor
            
        }
    }
    
    // 첫번째 복사 버튼 클릭
    @IBAction func firstCopyBtnClicked(_ sender: UIButton) {
        
        UIPasteboard.general.string = ColorsData().colors1[getIndexPath()]
        
        makeToast("\(ColorsData().colors1[getIndexPath()]) 복사 완료", duration: 1.0, position: .center)
    }

    // 두번째 복사 버튼 클릭
    @IBAction func secondCopyBtnClicked(_ sender: UIButton) {

        UIPasteboard.general.string = ColorsData().colors2[getIndexPath()]
        
        makeToast("\(ColorsData().colors2[getIndexPath()]) 복사 완료", duration: 1.0, position: .center)
    }
    
    // 자신의 indexPath.row 가져오기
    func getIndexPath() -> Int {
        guard let superView = self.superview as? UITableView else {
            print("superview is not a UITableView - getIndexPath")
            return 0
        }
        let indexPath = superView.indexPath(for: self)
        return indexPath!.row
    }
}
