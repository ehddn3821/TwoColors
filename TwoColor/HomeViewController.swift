//
//  ViewController.swift
//  TwoColor
//
//  Created by dwKang on 2021/01/20.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let cellIdentifier: String = "cell"
    
    let korean: [String] = ["에스프레소", "아메리카노", "카페라떼", "카라멜마끼아또", "콜드브루", "바닐라라떼", "민트티"]
    let english: [String] = ["espresso", "americano", "cafe latte", "caramel macchiato", "cold brew", "vanila latte", "mint tea"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }


}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return self.korean.count
        case 1:
            return self.english.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let text: String = indexPath.section == 0 ? self.korean[indexPath.row] : self.english[indexPath.row]
        cell.textLabel?.text = text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "[ 맛있는 커피 ]"
        case 1:
            return "[ Delicious Coffee ]"
        default:
            return ""
        }
    }
}
