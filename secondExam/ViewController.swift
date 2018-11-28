//
//  ViewController.swift
//  secondExam
//
//  Created by student on 2018/11/28.
//  Copyright © 2018年 fanyunyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var tableView2: UITableView!
    @IBOutlet weak var label2: UILabel!
    
    var table1 = [Int]()
    var table2 = [Int]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.isEqual(tableView1){
            return table1.count
        }else{
            return table2.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell?
        if tableView.isEqual(tableView1){
            cell = tableView.dequeueReusableCell(withIdentifier: "table1")
            cell?.textLabel?.text = "\(table1[indexPath.row])"
            print("1")
            return cell!
        }
        else{
            cell = tableView.dequeueReusableCell(withIdentifier: "table2")
            cell?.textLabel?.text = "\(table2[indexPath.row])"
            print("2")
            return cell!
        }
    }
    
    //下面两个遵守成为键盘输入代理的协议的方法
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    @IBAction func button1(_ sender: Any) {
        let newIndexPath = IndexPath(row: table1.count, section: 0)
        table1.append(textField1.text!)
        table1.insertRows(at: [newIndexPath], with: .automatic)
    }
    
    @IBAction func button2(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView1.delegate = self
        tableView2.delegate = self
        tableView1.dataSource = self
        tableView2.dataSource = self
        table1.append(0)
        table1.append(1)
        table2.append(12)
        table2.append(13)

    }


}

