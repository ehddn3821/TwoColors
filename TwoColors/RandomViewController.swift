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
        
        let nibName = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "cell")
    }


}

extension RandomViewController: UITableViewDataSource, UITableViewDelegate {
    
    // 섹션 개수
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
    
    // 섹션 제목
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 0:
//            return "[ 맛있는 커피 ]"
//        case 1:
//            return "[ Delicious Coffee ]"
//        default:
//            return ""
//        }
//    }
    
    // 섹션마다 열의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    // 셀에 표시할 데이터
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        return cell
    }
}
