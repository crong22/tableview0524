//
//  DetailInfoViewController.swift
//  tableview0524
//
//  Created by 여누 on 5/27/24.
//

import UIKit
import Kingfisher

class DetailInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var list = TravelInfo().travel
    var adlist : [Travel] = []
    var num = 0
    var notNum = 0
    @IBOutlet var detailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTableView.rowHeight = 100
        detailTableView.delegate = self
        detailTableView.dataSource = self
        
        likeNum()

        //만든 cell을 가져온다.
        let xib = UINib(nibName: "CityTableViewCell", bundle: nil)
        detailTableView.register(xib, forCellReuseIdentifier: "CityTableViewCell")
        
        let xib2 = UINib(nibName: "AdTableViewCell", bundle: nil)
        detailTableView.register(xib2, forCellReuseIdentifier: "AdTableViewCell")
    }

    func likeNum(){
        
        for i in 0..<list.count {
            if list[i].ad == true {
                num += 1
            }else {
                notNum += 1
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = list[indexPath.row]
            // AD가 true인 경우 !
            if data.ad == true{
                let cell1 = tableView.dequeueReusableCell(withIdentifier: "AdTableViewCell", for: indexPath) as! AdTableViewCell
                cell1.configureAdCell(list[indexPath.row])
                return cell1
            }else{
                //AD가 false인 경우 !
                let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell
                cell.configureCell(list[indexPath.row])
                return cell
            }
        
    }
}
