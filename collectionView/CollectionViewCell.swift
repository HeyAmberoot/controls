//
//  CollectionViewCell_Input.swift
//  Preview
//
//  Created by xww on 17/9/14.
//  Copyright © 2017年 cuanbo. All rights reserved.
//

import UIKit

class CollectionViewCellVideo_Input: UICollectionViewCell {
    
    var labelName = UILabel()
    var labelNum = UILabel()
    var labelResolution = UILabel()
    var labelHPD = UILabel()
    var labelVsd = UILabel()
    var labelEdid = UILabel()
    var labelHDCP = UILabel()
    var labelType = UILabel()
    var viewCircle = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = UIColor.white
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
//        let cellWidth = self.bounds.width
        //viewCircle
        viewCircle = UIView.init(frame: CGRect(x: 2, y: 1, width: 22, height: 22))
        viewCircle.layer.cornerRadius = 6
        //viewCircle.backgroundColor = Turquoise3
        //labelNum
        labelNum = UILabel.init(frame: CGRect(x: 3, y: 1, width: 30, height: 20))
        //labelName
        labelName = UILabel.init(frame: CGRect(x: 10, y: 23, width: self.bounds.width-10, height: 30))
        labelName.numberOfLines = 1 //设置label的行数，如果为0则无限制
        labelName.font = UIFont.italicSystemFont(ofSize: 20)
        //labelType
        labelType = UILabel.init(frame: CGRect(x: 10, y: 57, width: self.bounds.width-10, height: 20))
        //labelResolution
        labelResolution = UILabel.init(frame: CGRect(x: 10, y: 57, width: self.bounds.width-10, height: 20))
        //labelVsd
        labelVsd = UILabel.init(frame: CGRect(x: 10, y: 105, width: self.bounds.width-10, height: 20))
        //labelEdid
        labelEdid = UILabel.init(frame: CGRect(x: 10, y: 129, width: self.bounds.width-10, height: 20))
        //labelHDCP
//        labelHDCP = UILabel.init(frame: CGRect(x: 10, y: 136, width: self.bounds.width-10, height: 20))
        
        self.addSubview(viewCircle)
//        self.addSubview(labelHDCP)
        self.addSubview(labelEdid)
        self.addSubview(labelVsd)
        self.addSubview(labelType)
        self.addSubview(labelResolution)
        self.addSubview(labelName)
        self.addSubview(labelNum)
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 10
//        self.selectedBackgroundView = viewForBackground
       self.alpha = 0.6
    }
    
   
    
    
    private lazy var viewForBackground: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.blue
        return view
    }()

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
