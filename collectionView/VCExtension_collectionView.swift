//
//  mainVCExtension_collectionView.swift
//  Preview
//
//  Created by xww on 17/9/14.
//  Copyright © 2017年 cuanbo. All rights reserved.
//

import Foundation
import UIKit

extension videoViewController :UICollectionViewDataSource, UICollectionViewDelegate {
    
    // #MARK: --UICollectionViewDataSource的代理方法
    /**
     - 该方法是可选方法，默认为1
     - returns: CollectionView中section的个数
     */
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    /**
     - returns: Section中Item的个数
     */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewIn
        {
            return inNum
        }else {
            return outNum
        }
    }
    
    /**
     - returns: 绘制collectionView的cell
     */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.collectionViewIn
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell_in", for: indexPath) as! CollectionViewCellVideo_Input
            
            cell.labelName.text = ChannelName_Array[InCardNumArray[indexPath.row]-1]
            cell.labelNum.text = String(InCardNumArray[indexPath.row])
            cell.labelNum.textColor = UIColor.white
            cell.viewCircle.backgroundColor = colorArray[InCardNumArray[indexPath.row]] as? UIColor

            cell.tag = indexPath.row + 1
 
            return cell

        }else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell_out", for: indexPath) as! CollectionViewCellVideo_output
           
            cell.labelName.text = ChannelName_Array[OutCardNumArray[indexPath.row]-1]
           
            cell.labelNum.text = String(OutCardNumArray[indexPath.row])
            cell.viewCircle.backgroundColor = colorArray[Int(outputState_array[indexPath.row])!] as? UIColor
            
            cell.tag = indexPath.row
           
            return cell

        }
        
        
    }
    
    
    
    /**
     - returns: 返回headview或者footview
     */
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let headView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headView", for: indexPath as IndexPath)
//        //headView.backgroundColor = UIColor.white
//        
//        return headView
//    }
    
    // #MARK: --UICollectionViewDelegate的代理方法
    /**
     Description:当点击某个Item之后的回应
     */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("(\(indexPath.section),\(indexPath.row))")
        if ConnectSucced == false {
        common.showAlertView(mes: lang.getAppStr(key: "connectNone"), controller: self)
        return
        }
        if collectionView == self.collectionViewIn
        {///输入口点击事件//////////////////////////////////
            
            collectionViewIn.reloadData()
        
        }else
        {///输出口点击事件/////////////////////////////////
            
            collectionViewOut.reloadData()

   
        }
   
    }
    
 

    
    
    
    
    
    }
