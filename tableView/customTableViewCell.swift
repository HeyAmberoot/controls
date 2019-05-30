//
//  menuVCExtension_tableview.swift
//  CBMvp
//
//  Created by xww on 17/10/23.
//  Copyright © 2017年 cuanbo. All rights reserved.
//

import UIKit


class CustomTableViewCell: UITableViewCell {
    
    
    var label_Name: UILabel!
    var label_subTitle: UILabel!
    var imageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        if !self.isEqual(nil)
        {
            ///1. 添加iamgeView
            self.imageView = UIImageView()
            self.contentView.addSubview(self.imageView)
            setUpImageView()
            
            ///2.1 添加标签Name
            self.label_Name = UILabel()
            self.label_Name.font = UIFont.italicSystemFont(ofSize: 26)
            self.addSubview(self.label_Name)
            setUpLabelName()
            
            ///2.2 添加标签subTitle
            self.label_subTitle = UILabel()
            self.label_subTitle.font = UIFont.italicSystemFont(ofSize: 16)
            self.addSubview(self.label_ipAdress)
            setUpLabelSubTitle()
            
            ///3. cell的背景颜色
            //            self.backgroundColor = lightBlueColor
            //            ///4. 设置cell的图层为圆角边框
            //            self.layer.masksToBounds = true
            //            self.layer.cornerRadius = 30
            
            
            
        }
    }
    
    
    private func setUpImageView() {
        
        //系统默认会给autoresizing 约束,要关闭autoresizing才能让自定义的约束生效，否则程序崩溃
        self.imageView_Device.translatesAutoresizingMaskIntoConstraints = false
        //添加约束:"哪个控件" 的 “什么属性“ "等于/大于/小于" “另一个控件” 的 “什么属性” 乘以 "多少" 加上 "多少"
        let imageConstraint_bottom = NSLayoutConstraint(item: self.imageView_Device, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: self, attribute: .bottom, multiplier: 1, constant: 10)
        
        let imageConstraint_top = NSLayoutConstraint(item: self.imageView_Device, attribute: .top, relatedBy: .lessThanOrEqual, toItem: self, attribute: .top, multiplier: 1, constant: 10)
        
        let imageConstraint_left = NSLayoutConstraint(item: self.imageView_Device, attribute: .left, relatedBy: .lessThanOrEqual, toItem: self, attribute: .left, multiplier: 1, constant: 100)
        NSLayoutConstraint.activate([imageConstraint_bottom,imageConstraint_top,imageConstraint_left])
    }
    
    private func setUpLabelName() {
        
        self.label_Name.translatesAutoresizingMaskIntoConstraints = false
        
        let labelNameConstraint_bottom = NSLayoutConstraint(item: self.label_Name, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: self, attribute: .bottom, multiplier: 1, constant: 10)
        
        let labelNameConstraint_top = NSLayoutConstraint(item: self.label_Name, attribute: .top, relatedBy: .lessThanOrEqual, toItem: self, attribute: .top, multiplier: 1, constant: 10)
        
        let labelDeviceNameConstraint_left = NSLayoutConstraint(item: self.label_Name, attribute: .left, relatedBy: .lessThanOrEqual, toItem: self, attribute: .left, multiplier: 1, constant: 180)
        
        NSLayoutConstraint.activate([labelDeviceNameConstraint_bottom,labelNameConstraint_top,labelNameConstraint_left])
    }
    
    
    private func setUpLabelSubtitle() {
        
        self.label_subtitle.translatesAutoresizingMaskIntoConstraints = false
        let labelSubtitleConstraint_bottom = NSLayoutConstraint(item: self.label_label_subTitle, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: self, attribute: .bottom, multiplier: 1, constant: 3)
        
        let labelsubtitleConstraint_top = NSLayoutConstraint(item: self.label_label_subTitle, attribute: .top, relatedBy: .lessThanOrEqual, toItem: self, attribute: .top, multiplier: 1, constant: 50)
        
        let labelsubtitleConstraint_left = NSLayoutConstraint(item: self.label_label_subTitle, attribute: .left, relatedBy: .lessThanOrEqual, toItem: self, attribute: .left, multiplier: 1, constant: 180)
        
        NSLayoutConstraint.activate([labelsubtitleConstraint_bottom,labelsubtitleConstraint_top,labelsubtitleConstraint_left])
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        
        if selected
        {
            //改变cell的视图
            
            
        }
}
