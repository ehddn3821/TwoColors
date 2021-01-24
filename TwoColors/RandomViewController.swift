//
//  ViewController.swift
//  TwoColor
//
//  Created by dwKang on 2021/01/20.
//

import UIKit

class RandomViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // 셀 xib파일 연결
        let nibName = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "cell")
    }

    // hex -> UIColor
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

extension RandomViewController: UITableViewDataSource, UITableViewDelegate {
    
    // 섹션마다 열의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ColorsData().colors1.count
    }
    
    // 셀에 표시할 데이터
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        // 1번 색상
        cell.cellMainView.backgroundColor = hexStringToUIColor(hex: ColorsData().colors1[indexPath.row])
        cell.cellReverseBtn.setTitleColor(hexStringToUIColor(hex: ColorsData().colors1[indexPath.row]), for: .normal)
        cell.cellFooterContent.textColor = hexStringToUIColor(hex: ColorsData().colors1[indexPath.row])
        cell.cellFirstColor.backgroundColor = hexStringToUIColor(hex: ColorsData().colors1[indexPath.row])
        cell.cellSecondColor.layer.borderColor = hexStringToUIColor(hex: ColorsData().colors1[indexPath.row]).cgColor
        
        // 2번 색상
        cell.cellHeadline.textColor = hexStringToUIColor(hex: ColorsData().colors2[indexPath.row])
        cell.cellContent.textColor = hexStringToUIColor(hex: ColorsData().colors2[indexPath.row])
        cell.cellReverseBtn.backgroundColor = hexStringToUIColor(hex: ColorsData().colors2[indexPath.row])
        cell.cellFooterView.backgroundColor = hexStringToUIColor(hex: ColorsData().colors2[indexPath.row])
        cell.cellSecondColor.backgroundColor = hexStringToUIColor(hex: ColorsData().colors2[indexPath.row])
        
        return cell
    }
    
    // 섹션 헤더 없애기
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude // 이게 CGFloat 양수 최소값 상수
    }
}
