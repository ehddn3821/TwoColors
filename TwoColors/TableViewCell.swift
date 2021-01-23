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
    @IBOutlet var cellSecondBtn: UIButton!
    @IBOutlet var cellSecondColor: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 셀 전체 View
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 10
        
        // Button
        cellReverseBtn.layer.cornerRadius = 10
        cellReverseBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)  // 오른쪽 여백
        
        // 두번째 저장버튼 옆 색상 뷰
        cellSecondColor.layer.borderWidth = 1.5
        cellSecondColor.layer.borderColor = cellMainView.backgroundColor?.cgColor  // 반대 색상으로 설정
    }
    
    // Reverse 버튼 클릭
    @IBAction func reverseBtnClicked(_ sender: UIButton) {
        
        
    }
    
    // Hex -> UIColor 변환
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
