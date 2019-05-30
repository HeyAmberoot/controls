//
//  videoViewController.swift
//  CBMvp
//
//  Created by xww on 17/9/28.
//  Copyright © 2017年 cuanbo. All rights reserved.
//

import UIKit

class videoViewController: UIViewController {

    @IBOutlet weak var collectionViewIn: UICollectionView!
    
    @IBOutlet weak var collectionViewOut: UICollectionView!
    
    @IBOutlet weak var labelIn: UILabel!
    
    @IBOutlet weak var labelOut: UILabel!
    
    @IBOutlet weak var labelTip: UILabel!
    
    @IBOutlet weak var ViewBtn: UIView!
    
    @IBOutlet weak var viewTopOut: UIView!
    @IBOutlet weak var viewTopIn: UIView!
    @IBOutlet weak var btnSwitchAll: UIButton!

    let json = Json.sharedInstance
    let common = CommonFunc.sharedInstance
    let dao = DAO.sharedInstance
    let socket_tcp = TCP_GCDAsyncSocket.sharedInstance
    let lang = LanguageHelper.shareInstance

    
    ///输入子卡数
    var inNum = 0
    ///输出子卡数
    var outNum = 0
    
    ///存放上次点击的Cell
    var In_click = 0
    ///存放上次点击的Cell
    var Out_click = 0
    ///存放上次点击的输入口
    var Input_Click = 0
    ///存放上次点击的输出口
    var Output_Click = 0
    
    ///存放输入子卡的卡类型名
    var InTypeArray = Array<String>()
    ///存放输出子卡的卡类型名
    var OutTypeArray = Array<String>()
   
    ///存放输出对应输入源的数组
    var outputState_array = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initCollectionView(collectionView: collectionViewIn)
        initCollectionView(collectionView: collectionViewOut)
   
    }
    deinit {
        //移除通知
        NotificationCenter.default.removeObserver(self)
    }

        
    func initCollectionView(collectionView: UICollectionView) {
        
        let cellSpace = 6 / UIScreen.main.scale
        let columnsNum = 3 //每行cell的个数
        collectionView.delegate = self
        collectionView.dataSource = self
//        collectionView.layer.cornerRadius = 10
        if collectionView == self.collectionViewOut
        {
            collectionView.register(CollectionViewCellVideo_output.self, forCellWithReuseIdentifier: "collectionCell_out")
        }else
        {
            collectionView.register(CollectionViewCellVideo_Input.self, forCellWithReuseIdentifier: "collectionCell_in")
        }
        //默认选中第一个cell
//        let inP = IndexPath.init(row: 0, section: 0)
//        collectionView.selectItem(at: inP, animated: true, scrollPosition: UICollectionViewScrollPosition.top)
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        //水平间隔
        layout.minimumInteritemSpacing = cellSpace
        //垂直间隔
        layout.minimumLineSpacing = cellSpace
        
        let collectionViewWidth = collectionView.bounds.width
        //整个view横向除去间距后，剩余的像素个数
        let pxWidth = collectionViewWidth * UIScreen.main.scale - CGFloat(columnsNum - 1)
        
        //单元格宽度（像素）
        let itemWidthPx = CGFloat(Int(pxWidth / CGFloat(columnsNum)))
        //单元格宽度（点）
        let itemWidth = itemWidthPx / UIScreen.main.scale
        
        //设置单元格宽度和高度
        layout.itemSize = CGSize(width:itemWidth - 3, height:itemWidth/2)
        
        //剩余像素（作为左右内边距）
        let remainderPx = pxWidth - itemWidthPx * CGFloat(columnsNum)
        
        //左内边距
        let paddingLeftPx = CGFloat(Int(remainderPx/2))
        let paddingLeft = paddingLeftPx / UIScreen.main.scale
        
        //右内边距
        let paddingRightPx = remainderPx - paddingLeftPx
        //右内边距做-0.001特殊处理，否则在plus设备下可能摆不下
        let paddingRight = paddingRightPx / UIScreen.main.scale - 0.001
        
        //设置内边距
        layout.sectionInset = UIEdgeInsets(top: 0, left: paddingLeft,bottom: 0, right: paddingRight)
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
