//
//  TravelTableViewController.swift
//  tableview0524
//
//  Created by 여누 on 5/26/24.
//

import UIKit
import Kingfisher

var travellist = MagazineInfo().magazine


class TravelTableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 550

    }

    // 셀의 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travellist.count
    }

    //셀의 속성
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Swift Type Casting
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelTableViewCell", for: indexPath) as! TravelTableViewCell
        let data = travellist[indexPath.row]
        cell.configureCell(data)

        // image url 주소
//        let url = URL(string: data.photo_image)
//        cell.travelimageView.kf.setImage(with : url)
//        cell.travelimageView.layer.cornerRadius = 10

//        let url = URL(string: data.photo_image)
//        cell.travelimageView.kf.setImage(with: url, placeholder: UIImage(systemName: "heart"))
//        cell.travelimageView.layer.cornerRadius = 10
        return cell
    }

}
