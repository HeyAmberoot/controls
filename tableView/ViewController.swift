//
//  videoViewController.swift
//  CBMvp
//
//  Created by xww on 17/9/28.
//  Copyright © 2017年 cuanbo. All rights reserved.
//

import UIKit

class videoViewController: UIViewController {
    @IBOutlet weak var tableViewTX: UITableView!
    
    @IBOutlet weak var tableViewRX: UITableView!
  
    let dao = DAO.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initTableView(tableview: tableViewTX)
        initTableView(tableview: tableViewRX)
   
    }
    deinit {
        //移除通知
        NotificationCenter.default.removeObserver(self)
    }

        
    func initTableView(tableView:UITableView) {
        //指定TableView的委托对象
        tableView.delegate = self
        tableView.dataSource = self
        //除去单元格分割线
        tableView.separatorStyle = .none
        //创建一个重用的单元格
        tableView.register(UINib(nibName: "CountTableViewCell", bundle: nil), forCellReuseIdentifier: "countCell")
        //去除尾部多余的空行
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        //设置分区头部字体颜色和大小
        UILabel.appearance(whenContainedInInstancesOf: [UITableViewHeaderFooterView.self])
            .textColor = UIColor.gray
        UILabel.appearance(whenContainedInInstancesOf: [UITableViewHeaderFooterView.self])
            .font = UIFont.boldSystemFont(ofSize: 16.0)
    }


    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
