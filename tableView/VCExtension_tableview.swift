//
//  menuVCExtension_tableview.swift
//  CBMvp
//
//  Created by xww on 17/10/23.
//  Copyright © 2017年 cuanbo. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    
    
    // MARK: - UITableViewDelegate 协议方法 ////////////////////////////
    
    ///设置TableViewCell的高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 36
    }
    
    ///tableView点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicked at \(indexPath.row)")
        let ipArray = dao.readIP(key: key_ipArray)
        textFieldIPAddress.text = ipArray[indexPath.row]
        
    }
    
//    ///tableView删除事件
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        
//    }
    
    // MARK: - UITableViewDataSource 协议方法///////////
    
    ///返回表格中分区的数量
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    ///设置UITableViewCell数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {   if section == 0{
            let ipArray = dao.readIP(key: key_ipArray)
            if ipArray.count > 3 {
                dao.removeIP(key: key_ipArray)
                return 3
            }else {
                return ipArray.count
            }
        }else {
            return 1
        }
    }
    
    ///为UITableViewCell提供数据，必须实现的方法
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let CellIdentifier = "CellIdentifier"
        
        var cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath)
        if cell == nil
        {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: CellIdentifier)
        }
        
        let ipArray = dao.readIP(key: key_ipArray)
        cell.textLabel?.text = ipArray[indexPath.row]

        //设置cell样式
        cell.accessoryType = .none
        cell.tag = indexPath.row
        return cell
    }
    
    // 指定分区的头部
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        let history = lang.getAppStr(key: "history")
        let header = [history,"语言设置"] as [String]
        return header[section]
    }
    
//    // 指定分区的尾部
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String?
//    {
//        
//        return "有\(list.count)单元格"
//    }
}
