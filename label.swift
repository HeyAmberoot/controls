//
//  ViewController.swift
//  Label
//
//  Created by xww on 17/11/28.
//  Copyright © 2017年 cuanbo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var longLabel: UILabel!
    @IBOutlet weak var labelHighlight: UILabel!
    
    @IBOutlet weak var labelAttribute: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置标签文字
        label.text = "haha"
        //设置标签文字颜色
        label.textColor = UIColor.blue
        //设置标签背景颜色
        label.backgroundColor = UIColor.lightGray
        //设置标签对齐方向
        label.textAlignment = .right
        //设置标签阴影颜色
        label.shadowColor = UIColor.black
        //设置标签阴影偏移量
        label.shadowOffset = CGSize(width: -1.5, height: 1.5)
        //设置标签字体
        label.font = UIFont.boldSystemFont(ofSize: 20)
        //设置过长标签省略方式(中间省略、尾部省略、头部省略、直接截掉多余部分)
        longLabel.lineBreakMode = .byClipping
        //自动调整标签字体大小以适应控件的宽度
        longLabel.adjustsFontSizeToFitWidth = true
        //使标签可以显示多行文字（默认只显示一行，设为0表示没有行数限制）
        longLabel.numberOfLines = 2//如果控件高度不足以显示2行，会只显示1行，后面部分文字省略
        //设置标签圆角
        label.layer.cornerRadius = 6
        label.layer.masksToBounds = true//必须设置这个属性才能实现label圆角
        
        //设置标签边框宽度
        labelHighlight.layer.borderWidth = 2
        labelHighlight.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        //设置高亮文本的颜色
        labelHighlight.highlightedTextColor = UIColor.blue
        //设置标签文字高亮
        labelHighlight.isHighlighted = true
        
        
        ///富文本设置/////////////
        let attributeString = NSMutableAttributedString(string: "NSMutableAttributedString")
        //从文本0开始6个字符字体HelveticaNeue-Bold,16号
        attributeString.addAttribute(NSFontAttributeName,value: UIFont(name: "HelveticaNeue-Bold", size: 16)!,range: NSMakeRange(0,6))
        //设置字体颜色
        attributeString.addAttribute(NSForegroundColorAttributeName,value: UIColor.blue,range: NSMakeRange(0, 3))
        //设置文字背景颜色
        attributeString.addAttribute(NSBackgroundColorAttributeName,value: UIColor.green,range: NSMakeRange(3,3))
        labelAttribute.attributedText = attributeString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

