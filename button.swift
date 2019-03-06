//
//  ViewController.swift
//  button
//
//  Created by xww on 17/11/24.
//  Copyright © 2017年 cuanbo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnLongTitle: UIButton!
    @IBOutlet weak var btnBackgroundImage: UIButton!
    @IBOutlet weak var btnImageTitle: UIButton!
    @IBOutlet weak var buttonBorder: UIButton!
    var btn: UIButton!
    
//UIButtonType.system：不带图标，默认文字颜色为蓝色，有触摸时的高亮效果
//UIButtonType.custom：不带图标，默认文字颜色为白色，无触摸时的高亮效果
//UIButtonType.contactAdd：带“+”图标按钮
//UIButtonType.detailDisclosure：带“!”图标按钮
//UIButtonType.infoDark：为感叹号“!”圆形按钮
//UIButtonType.infoLight：为感叹号“!”圆形按钮
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置按钮圆角
        buttonBorder.layer.cornerRadius = 6
        //设置按钮边框宽度
        buttonBorder.layer.borderWidth = 1
        //设置按钮边框颜色
        buttonBorder.layer.borderColor = UIColor.blue.cgColor
        
        //定义按钮
        btn = UIButton()
        //设置按钮大小
        btn.frame = CGRect(x: 20, y: 100, width: 160, height: 100)
        //设置按钮标题
        btn.setTitle("image&title", for: .normal)
        //设置按钮标题文字大小
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        //设置按钮标题颜色
        btn.setTitleColor(UIColor.red, for: .normal)
        //设置按钮图标
        btn.setImage(#imageLiteral(resourceName: "eye_iPadNotification2X"), for: .normal)
        //设置按钮背景颜色
        btn.backgroundColor = UIColor.cyan
        //设置文字偏移量(若不设置偏移量，按钮图标在左，标题在右)
        btn.titleEdgeInsets = UIEdgeInsets(top: 60, left: -40, bottom: 0, right: 50)
        //把按钮添加到主页面
        self.view.addSubview(btn)
        
        //实时获取按钮标题1
        var currentTitle = btn.currentTitle!
        print(currentTitle)
        //实时获取按钮标题2
        btn.setTitle("titleHighlighted", for: .highlighted)
        currentTitle = btn.title(for: .highlighted)!
        print(currentTitle)
        
        //使触摸模式下按钮也不会变暗（半透明）
        btn.adjustsImageWhenHighlighted=false
        //使禁用模式下按钮也不会变暗（半透明）
        btn.adjustsImageWhenDisabled=false
        
        //不传递触摸对象（即点击的按钮）
        btn.addTarget(self, action:#selector(tapped1), for:.touchUpInside)
        //传递触摸对象（即点击的按钮），需要在定义action参数时，方法名称后面带上冒号
        btn.addTarget(self, action:#selector(tapped(_:)), for:.touchUpInside)
        
        //设置按钮图标和标题的相对位置，需要“buttonExtension.swift”
        btnImageTitle.set(image: #imageLiteral(resourceName: "eye_iPadNotification2X"), title: "image&title", titlePosition: .bottom, additionalSpacing: 10, state: .normal)
        
        //设置图标始终保持原来颜色
        let _ = UIImage(named:"eye_iPadNotification2X")?.withRenderingMode(.alwaysOriginal)
        
        //设置按钮背景图片
        btnBackgroundImage.setBackgroundImage(#imageLiteral(resourceName: "eye_new"), for: .normal)
        
        //设置按钮标题方位
        btn.contentHorizontalAlignment = .left
        btn.contentVerticalAlignment = .button
        //设置按钮标题间距
        let titleInsets = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
        btn.titleEdgeInsets = titleInsets
        //设置按钮图片间距
        let imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        btn.imageEdgeInsets = imageInsets
  
        ///按钮标题太长的处理方法
        //1.设置自动修改标题字体大小来适用按钮宽度
//        btnLongTitle.titleLabel?.adjustsFontSizeToFitWidth = true
        //2.省略尾部文字
        btnLongTitle.titleLabel?.lineBreakMode = .byTruncatingTail
        //3.省略头部文字
        btnLongTitle.titleLabel?.lineBreakMode = .byTruncatingHead
        //4.省略中部文字
        btnLongTitle.titleLabel?.lineBreakMode = .byTruncatingMiddle
        //5.直接截掉后面多余部分
        btnLongTitle.titleLabel?.lineBreakMode = .byClipping
        //6.自动换行（按词拆分）
        btnLongTitle.titleLabel?.lineBreakMode = .byCharWrapping
        //7.自动换行（按字符拆分）
        btnLongTitle.titleLabel?.lineBreakMode = .byWordWrapping
       
    }
    
    func tapped1() {
        print("tapped")
    }
    
    func tapped(_ button:UIButton){
        print(button.title(for: .normal)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

