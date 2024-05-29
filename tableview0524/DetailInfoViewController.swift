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
        print(#function)
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
    // 화면전환
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        let data = list[indexPath.row]
        
        if data.ad {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "AdTableViewCell", for: indexPath) as! AdTableViewCell
            cell1.configureAdCell(list[indexPath.row])
            
            // ad
            UserDefaults.standard.setValue(data.title, forKey: "adtitle")
            // ad
            
            // 1. 스토리보드 가져오기
            // name > 스토리보드 이름
            // bundle값에는 내가 만든파일이면 모두 nil
            let sb = UIStoryboard(name: "Main", bundle: nil)
            
            // 2. 스토리보드 내에서 전환하고자 하는 화면 가져오기 ( 씬과 로직 매칭 )
            // 스토리보드내에서 접근이 가능
            // 코드와 스토리보드를 결합하는 형태 !
            // 스토리보드에있는 파일을 인스턴스에 올려줄 준비
            // 컨트롤러 안에 있는 identity > 스토리보드ID를 설정하여 아래 withIdentifier에 입력!!!!!! ( 똑같은 이름으로 설정하여 편하게  함 )
            let vc = sb.instantiateViewController(withIdentifier: "adInfoViewController") as! adInfoViewController
            
            vc.modalPresentationStyle = .fullScreen
            // 3. 화면 띄우기
            // 띄어주고싶은화면이름 , true (보통)
            present(vc, animated: true)
        }else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell
            cell.configureCell(list[indexPath.row])
            let data = list[indexPath.row]
            
            // cityName
            UserDefaults.standard.setValue(data.title, forKey: "cityname")
            // subText
            UserDefaults.standard.setValue(data.description, forKey: "citydescription")
            // ImageUrl
            UserDefaults.standard.setValue(data.travel_image, forKey: "imageurl")
            
            let cb = UIStoryboard(name: "Main", bundle: nil)
            let dc = cb.instantiateViewController(withIdentifier: "CityInfoViewController") as! CityInfoViewController
            
            navigationController?.pushViewController(dc, animated: true)

        }

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        let data = list[indexPath.row]
            // AD가 true인 경우 !
            if data.ad {
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
