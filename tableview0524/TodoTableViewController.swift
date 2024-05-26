//
//  TodoTableViewController.swift
//  tableview0524
//
//  Created by 여누 on 5/24/24.
//

import UIKit

struct todolist {
    var title : String
    var check : Bool
    var star : Bool
}
class TodoTableViewController: UITableViewController {
    @IBOutlet var addbutton: UIButton!
    @IBOutlet var addtextField: UITextField!
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    var list = [todolist(title: "그립톡 구매하기", check: false, star: false),
    todolist(title: "사이다 구매하기", check: false, star: false),
    todolist(title: "아이패드 케이스 최저가 알아보기", check: false, star: false),
    todolist(title: "양말", check: false, star: false)]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 44

        addtextField.layer.cornerRadius = 15
        
        addbutton.layer.cornerRadius = 15
    }

    //셀의 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
    }

    //셀의 속성
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Swift Type Casting
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoTableViewCell", for: indexPath) as! TodoTableViewCell
        let data = list[indexPath.row]
        
        cell.titleLabel.text = data.title
        cell.titleLabel.font = .systemFont(ofSize: 14)
        cell.backgroundColor = .opaqueSeparator

        // checkmark.square.fill
        
       // cell.titleLabel
//
//        cell.subtitleLabel.text = data.money.formatted()
//        cell.subtitleLabel.font = .systemFont(ofSize: 14)
//        cell.subtitleLabel.textColor = .darkGray
//        
        let name = data.star ? "star.fill" : "star"
        let image = UIImage(systemName: name)
        cell.starButton.setImage(image, for: .normal)
        cell.starButton.tag = indexPath.row
        cell.starButton.tintColor = .black
        cell.starButton.addTarget(self, action: #selector(starButtonClicked), for: .touchUpInside)
        
        let name2 = data.check ? "checkmark.square.fill" : "checkmark.square"
        let image2 = UIImage(systemName: name2)
        cell.checkButton.setImage(image2, for: .normal)
        cell.checkButton.tag = indexPath.row
        cell.checkButton.tintColor = .black
        cell.checkButton.addTarget(self, action: #selector(checkButtonClicked), for: .touchUpInside)
//
        return cell
    }
    @IBAction func addButtonClicked(_ sender: UIButton) {
        list.append(todolist(title: addtextField.text! , check: false, star: false))
        tableView.reloadData()
    }
    
    @objc func starButtonClicked(sender : UIButton) {
        //어떤 버튼을 클릭해도 프랑스가 true로 변경
        list[sender.tag].star.toggle()
        //list[0].like = true
        //tableView.reloadData()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
    }
    
    @objc func checkButtonClicked(sender : UIButton) {
        //어떤 버튼을 클릭해도 프랑스가 true로 변경
        list[sender.tag].check.toggle()
        //list[0].like = true
        //tableView.reloadData()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
    }
}
