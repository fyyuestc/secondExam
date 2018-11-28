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
    
    //tableView的数组
    var table1 = [String]()
    var table2 = [String]()
    
    //显示不同tablevView的cell的数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.isEqual(tableView1){
            return table1.count
        }else{
            return table2.count
        }
    }
    
    //显示不同tablevView的cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell?
        if tableView.isEqual(tableView1){
            cell = tableView.dequeueReusableCell(withIdentifier: "table1")
            cell?.textLabel?.text = table1[indexPath.row]
            return cell!
        }
        else{
            cell = tableView.dequeueReusableCell(withIdentifier: "table2")
            cell?.textLabel?.text = table2[indexPath.row]
            return cell!
        }
    }
    
    //下面两个遵守成为键盘输入代理的协议的方法
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //回车隐藏键盘
        textField.resignFirstResponder()
        return true
    }
    //tableView1添加
    @IBAction func button1(_ sender: Any) {
        let newIndexPath = IndexPath(row: table1.count, section: 0)
        table1.append(textField1.text!)
        tableView1.insertRows(at: [newIndexPath], with: .automatic)
    }
       //tableView2添加
    @IBAction func button2(_ sender: Any) {
        let newIndexPath = IndexPath(row: table2.count, section: 0)
        table2.append(textField2.text!)
        tableView2.insertRows(at: [newIndexPath], with: .automatic)
    }
    
    //选择cell过程
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.isEqual(tableView1){
            label1.text = "你选择了表1的\(table1[indexPath.row])"
        }
        else {
            label2.text = "你选择了表2的\(table2[indexPath.row])"
        }
    }
    
    //支持编辑
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //支持删除
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    //删除的过程
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            if editingStyle == UITableViewCell.EditingStyle.delete {
                 if tableView.isEqual(tableView1){
                    table1.remove(at: indexPath.row)
                    tableView1.deleteRows(at: [indexPath], with: .fade)
                 }
                 else {
                    table2.remove(at: indexPath.row)
                    tableView2.deleteRows(at: [indexPath], with: .fade)
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置代理
        tableView1.delegate = self
        tableView2.delegate = self
        tableView1.dataSource = self
        tableView2.dataSource = self
        textField1.delegate = self
        textField2.delegate = self
        //原始数组显示
        table1.append("0")
        table1.append("1")
        table2.append("12")
        table2.append("13")

    }


}

