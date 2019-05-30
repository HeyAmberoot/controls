//
//  SettingViewController.swift
//  CBC
//
//  Created by xww on 18/2/1.
//  Copyright © 2018年 cuanbo. All rights reserved.
//

import UIKit
import AudioToolbox

class SettingViewController: UITableViewController,UITextFieldDelegate {


//    @IBOutlet weak var labelResolution: UILabel!

    @IBOutlet weak var textFieldIP: UITextField!
    @IBOutlet weak var textFieldPort: UITextField!
    
    @IBOutlet weak var segmentLanguage: UISegmentedControl!
    
    @IBOutlet weak var labelSetIP: UILabel!
    
    @IBOutlet weak var labelSetPort: UILabel!


    private let lan = LanguageHelper.shareInstance
    private let common = CommonFunc.sharedInstance
    private let dao = DAO.sharedInstance
    private let xmlH = xmlHelper.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        UUID = common.getUUID()
        self.view.layer.cornerRadius = 16
        
        labelProjectName.text = dao.readProjectTime(key: key_projectName)
        
        textFieldEncryptedUUID.text = dao.readProjectTime(key: key_registrationCode)
        labelRegisterMark.text = dao.readProjectTime(key: key_registrationState)
        
        xmlFileArray = common.getPathAllXmlFile(path: documentsPath)
        initTextField()
        initTable()
        
        labelUUID.text = UUID
        
    }

    deinit {
        print("SettingViewController deinit")
        //注销通知
        NotificationCenter.default.removeObserver(self)
    }
    
    func switchDidChange(){
        let welcomePageSetting = switchWelcomePage.isOn
        dao.updateWelcomePageSetting(key: key_WelcomeSetting, setting: welcomePageSetting)
        let btnSoundSetting = switchButtonSound.isOn
        dao.updateButtonSetting(key: key_ButtonSoundSetting, setting: btnSoundSetting)
        
        tableView.reloadData()
    }

    func languageLocal() {
        
        labelSetIP.text = lan.getAppStr(key: "IPAddress")
        labelSetPort.text = lan.getAppStr(key: "Port")
        labelWelcomPage.text = lan.getAppStr(key: "WelcomePage")
        labelCurrentLanguage.text = lan.getAppStr(key: "CurrentLanguage")
        labelButtonSound.text = lan.getAppStr(key: "ButtonSound")
        labelSound1.text = lan.getAppStr(key: "Default")
        labelSound2.text = lan.getAppStr(key: "Inspire")
        labelSound3.text = lan.getAppStr(key: "Knock")
        labelSound4.text = lan.getAppStr(key: "DengDeng")
        
    }
    
    func initTextField() {
        //指定textField的委托对象
        textFieldIP.delegate = self
        textFieldPort.delegate = self
        textFieldEncryptedUUID.delegate = self
        
        let ser = dao.readServiceData(key: key_ServiceDevice)
        textFieldIP.text = ser?["ip"] as? String
        textFieldPort.text = ser?["port"] as? String
    }
    func initTable() {
        //创建一个重用的单元格
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "projectCell")
        //去除尾部多余的空行
        self.tableView.tableFooterView = UIView(frame:CGRect.zero)
        //设置分区头部字体颜色和大小
        UILabel.appearance(whenContainedInInstancesOf: [UITableViewHeaderFooterView.self])
            .textColor = UIColor.gray
        UILabel.appearance(whenContainedInInstancesOf: [UITableViewHeaderFooterView.self])
            .font = UIFont.systemFont(ofSize: 13.0, weight: UIFontWeightMedium)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        var registrationState = "失败"
        if textField == textFieldEncryptedUUID {
            let Str = getMd5Str(UUID)
            let passStr = (Str as NSString).substring(to: 16)
            if textField.text == passStr {
                registrationState = "成功"
                isRegistered = true
            }else{
                registrationState = "失败"
                isRegistered = false
            }
            labelRegisterMark.text = registrationState
            dao.updateProjectTime(key: key_registrationState, time: registrationState)
            dao.updateProjectTime(key: key_registrationCode, time: textField.text!)
        }
        if textField == textFieldPort {
            let ser = ["ip":textFieldIP.text,"port":textFieldPort.text]
            dao.updateServiceData(key: key_ServiceDevice, data: ser )
        }
        if textField == textFieldIP {
            let ser = ["ip":textFieldIP.text,"port":textFieldPort.text]
            dao.updateServiceData(key: key_ServiceDevice, data: ser)
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //返回每个分区中单元格的数量
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
            if section == 1 {
                return xmlFileArray.count
            }else if section == 2 {
                return 2
            }else if section == 6 {
                return 0
            }else if section == 5 {
                let btnSoundSetting = dao.readButtonSetting(key: key_ButtonSoundSetting)
                if btnSoundSetting! {
                    return 5
                }
                return 1
            }else{
                return 1
            }
    }
    
    //设置cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            languageLocal()
            //只有第二个分区是动态的，其它默认
            if indexPath.section == 1 {
                //用重用的方式获取标识为projectCell的cell
                let cell = tableView.dequeueReusableCell(withIdentifier: "projectCell",for: indexPath)
                cell.textLabel?.text = xmlFileArray[indexPath.row]
                return cell
            }else if indexPath.section == 0 {
                if ProjectName != nil {
                    labelProjectName.text = ProjectName!
                }
                
                return super.tableView(tableView, cellForRowAt: indexPath)
            }
            else{
                return super.tableView(tableView, cellForRowAt: indexPath)
            }
    }
    ///设置分区的头
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return lan.getAppStr(key: "CurrentItem")
        case 1:
            return lan.getAppStr(key: "ChoiceItem")
        case 2:
            return lan.getAppStr(key: "SocketSetting")
        case 3:
            return lan.getAppStr(key: "WelcomePageSetting")
        case 4:
            return lan.getAppStr(key: "LanguageSetting")
        case 5:
            return lan.getAppStr(key: "ButtonSoundSetting")
        default:
            return ""
        }
    }
    
    //因为第二个分区单元格动态添加，会引起cell高度的变化，所以要重新设置
    override func tableView(_ tableView: UITableView,
heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1{
            return 44
        }else{
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
    }
    
    //当覆盖了静态的cell数据源方法时需要提供一个代理方法。
    //因为数据源对新加进来的cell一无所知，所以要使用这个代理方法
    override func tableView(_ tableView: UITableView,indentationLevelForRowAt indexPath: IndexPath) -> Int {
        if indexPath.section == 1{
            //当执行到动态变化Section所在的indexPath就创建一个indexPath然后强插
            let newIndexPath = IndexPath(row: 0, section: indexPath.section)
            return super.tableView(tableView, indentationLevelForRowAt: newIndexPath)
        }else{
            return super.tableView(tableView, indentationLevelForRowAt: indexPath)
        }
    }
    
    ///让cell可选return true、让cell不可选return false
    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        
        if indexPath.section == 1 {
            return true
        }else if indexPath.section == 5 && indexPath.row != 0{
            return true
        }else {
            return false
        }
    }
    
    ///设置那些区能编辑那些不能
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 1 {
            return true
        }else {
            return false
        }
    }
    
    ///选择cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Section:\(indexPath.section)\n Row:\(indexPath.row)")
        if indexPath.section == 1 {
            ProjectName = xmlFileArray[indexPath.row]
            dao.updateProjectTime(key: key_projectName, time: ProjectName)
            //读取设备IP
            let parsedXmlSuccess = xmlH.readXML()
            if parsedXmlSuccess {
                let service = DeviceMesDict[ProjectName] as! NSArray
                let ser = ["ip":service[0],"port":service[1]] as [String : Any]
                dao.updateServiceData(key: key_ServiceDevice, data: ser)
                textFieldIP.text = service[0] as? String
                textFieldPort.text = service[1] as? String
            }
            
            tableView.reloadData()
        }
       
        if indexPath.section == 5 {
            if indexPath.row == 1 {
                imageView2.isHidden = true
                imageView3.isHidden = true
                imageView1.isHidden = false
                imageView4.isHidden = true
                dao.updateButtonSoundChoise(key: key_ButtonSoundChoise, setting: 1)
                createSound(sound: "btnSound")
            }else if indexPath.row == 2 {
                imageView2.isHidden = false
                imageView3.isHidden = true
                imageView1.isHidden = true
                imageView4.isHidden = true
                dao.updateButtonSoundChoise(key: key_ButtonSoundChoise, setting: 2)
                createSound(sound: "inspire")
            }else if indexPath.row == 3 {
                imageView2.isHidden = true
                imageView3.isHidden = false
                imageView1.isHidden = true
                imageView4.isHidden = true
                dao.updateButtonSoundChoise(key: key_ButtonSoundChoise, setting: 3)
                createSound(sound: "knock")
            }else {
                imageView2.isHidden = true
                imageView3.isHidden = true
                imageView1.isHidden = true
                imageView4.isHidden = false
                dao.updateButtonSoundChoise(key: key_ButtonSoundChoise, setting: 4)
                createSound(sound: "hint")
            }
        }
        
    }
    
    ///tableView删除事件
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete  {
            //删除
            let file = xmlFileArray[indexPath.row]
            xmlH.deleteFile(fileName: file)
            xmlFileArray.remove(at: indexPath.row)
            dao.updateProjectTime(key: key_projectName, time: "")
            ProjectName = nil
            labelProjectName.text = ""
            //刷新表格
            tableView.reloadData()
        }
    }
    
    func createSound(sound: String) {
        //建立的SystemSoundID对象
        var soundID:SystemSoundID = 0
        
        //获取声音地址
        let path = Bundle.main.path(forResource: sound, ofType: "wav")
        //地址转换
        if path != nil {
            let baseURL = NSURL(fileURLWithPath: path!)
            //赋值
            AudioServicesCreateSystemSoundID(baseURL, &soundID)
            //提醒（同上面唯一的一个区别）
            AudioServicesPlayAlertSound(soundID)
        }
        
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.post(name: notification_ProjectChange, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
