//
//  ViewController.swift
//  Image
//
//  Created by xww on 17/12/13.
//  Copyright © 2017年 cuanbo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    ///图片文件的路径
    let ImagePath: String! = "Users/mac/Desktop/base64.txt"//NSHomeDirectory() + "/Documents/demo.json"//Bundle.main.path(forResource: "demo", ofType: "json")!//

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 80))
        let imageView2 = UIImageView(frame: CGRect(x: 0, y: 80, width: 80, height: 80))
        let imageView3 = UIImageView(frame: CGRect(x: 0, y: 160, width: 80, height: 80))
        let imageView4 = UIImageView(frame: CGRect(x: 0, y: 240, width: 80, height: 80))
        let imageView5 = UIImageView(frame: CGRect(x: 80, y: 80, width: 160, height: 130))
        let imageView6 = UIImageView(frame: CGRect(x: 80, y: 210, width: 160, height: 130))
        let imageView7 = UIImageView(frame: CGRect(x: 80, y: 350, width: 100, height: 100))
        let imageView8 = UIImageView(frame: CGRect(x: 80, y: 450, width: 120, height: 100))
        let imageView9 = UIImageView(frame: CGRect(x: 80, y: 560, width: 120, height: 100))
        let imageView10 = UIImageView(frame: CGRect(x: 240, y: 80, width: 120, height: 100))
        let imageView11 = UIImageView(frame: CGRect(x: 240, y: 180, width: 100, height: 100))
        let imageView12 = UIImageView(frame: CGRect(x: 240, y: 280, width: 120, height: 100))
        
        //1.从文件中读取data数据
        let ImageData0 = NSData(contentsOfFile: ImagePath)
        if ImageData0 != NSData() {
            imageView.image = UIImage(data: ImageData0! as Data)
        }
        
        //2.直接把文件转换成UIImage
        imageView.image = UIImage(contentsOfFile: ImagePath)
        
        //3.把文件中的字符串转换成data再转换成UIImage
        do {
            let str:String = try NSString(contentsOfFile: ImagePath, encoding: String.Encoding.utf8.rawValue) as String
            let imageData = str.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
            imageView.image = UIImage(data: imageData)
        } catch {
            print("失败")
        }
        
        //4.把UIImage转成Data
        //把PNG转成UIImage
        let image = UIImage(named: "鹿&兔")
        //把UIImage转成Data
        let imageData1 = UIImagePNGRepresentation(image!)
        imageView.image = UIImage(data: imageData1!)
        
        //5.base64字符串转UIImage
        do {
            let base64Str = try NSString(contentsOfFile: ImagePath, encoding: String.Encoding.utf8.rawValue) as String
            let imageData3 = Data(base64Encoded: base64Str)
            //如果Base64字符串之前有经过URL编码转换，要先进行URL解码（urlDecoded）
            _ = Data(base64Encoded: base64Str.removingPercentEncoding!)
            imageView.image = UIImage(data: imageData3!)
        } catch {
            print("失败")
        }
        
        //6.将图片转为base64编码
        //把UIImage转成Data
        let imageData4 = UIImagePNGRepresentation(image!)
        let base64 = imageData4?.base64EncodedString(options: .endLineWithLineFeed)
        print(base64!)
        
        //7.使用CGBlendMode改变UIImage颜色
        imageView9.image = UIImage(named: "鹿&兔")?.tint(color: UIColor.blue, blendMode: .destinationIn)
        
        ///ImageHelper库使用样例///////////////////////
        //1.通过颜色生成UIImage
        imageView2.image = UIImage(color: UIColor.blue, size: CGSize(width: 50, height: 50))
        //2.线性渐变色生成UIImage
        let gradientColors = [UIColor.green, UIColor.blue]
        imageView3.image = UIImage(gradientColors: gradientColors, size: CGSize(width: 50, height: 50))
        //3.放射性渐变色生成UIImage,不能用white\gray\black，否则会出错
        imageView4.image = UIImage(startColor: UIColor.green, endColor: UIColor.red,radialGradientCenter: CGPoint(x: 0.5, y: 0.5), radius: 1,size:  CGSize(width: 50, height: 50))
        //4.给图片覆盖一层渐变色
        imageView5.image = UIImage(named: "鹿&兔")
        let gradientColors2 = [UIColor(red: 0.996, green: 0.769, blue:0.494, alpha: 1.0),UIColor(red: 0.969, green: 0.608, blue: 0.212, alpha: 0.2)]
        imageView6.image = UIImage(named: "鹿&兔")?.apply(gradientColors: gradientColors2)
        //5.圆形图片
        imageView7.image = UIImage(named: "鹿&兔")?.roundCornersToCircle()
        //6.生成圆角或圆形图片
        imageView8.image = UIImage(named: "鹿&兔")?.roundCorners(cornerRadius: 20)
        //7.自定义裁剪位置和尺寸
        let rect = CGRect(x: 240, y: 80, width: 100, height: 100)
        imageView10.image = UIImage(named: "鹿&兔")?.crop(bounds: rect)
        //8.自动裁剪成正方形
        imageView11.image = UIImage(named: "鹿&兔")?.cropToSquare()
        //9.调整尺寸大小
        let width = 50 * UIScreen.main.scale
        let height = 50 * UIScreen.main.scale
        let image12 = UIImage(named: "鹿&兔")?.resize(toSize: CGSize(width: width, height: height))
        imageView12.image = UIImage(named: "鹿&兔")
        imageView12.contentMode = .bottomRight
        
        //10.图片动画
        let img2 = UIImage(named:"鹿&兔")
        let img1 = UIImage(named:"cuanbo")
        imageView12.animationImages = [img2!,img1!]
        imageView12.animationDuration = 0.75
        imageView12.startAnimating()
        
        self.view.addSubview(imageView)
        self.view.addSubview(imageView2)
        self.view.addSubview(imageView3)
        self.view.addSubview(imageView4)
        self.view.addSubview(imageView5)
        self.view.addSubview(imageView6)
        self.view.addSubview(imageView7)
        self.view.addSubview(imageView8)
        self.view.addSubview(imageView9)
        self.view.addSubview(imageView10)
        self.view.addSubview(imageView11)
        self.view.addSubview(imageView12)
    }

    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

