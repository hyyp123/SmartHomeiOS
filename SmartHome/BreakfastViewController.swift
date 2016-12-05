//
//  BreakfastViewController.swift
//  SmartHome
//
//  Created by syp on 16/11/19.
//  Copyright © 2016年 syp. All rights reserved.
//

import UIKit

class BreakfastViewController:UIViewController{
    
    let server :String = "http://192.168.1.110:8080"
    
//    var firstDevice :String = ""
    var firstDeviceName:String = ""
    var firstDeviceTime:String = ""
    var firstDeviceAmOrPm:String = ""
    var firstDeviceDelta:String = ""
    @IBOutlet weak var firstDeviceNameLable: UITextField!
    @IBOutlet weak var firstDeviceTimeLable: UITextField!
    @IBOutlet weak var firstDeviceAmOrPmLable: UITextField!
    @IBOutlet weak var firstDeviceDeltaLable: UITextField!


//    var secondDevice :String = ""
    var secondDeviceName:String = ""
    var secondDeviceTime:String = ""
    var secondDeviceAmOrPm:String = ""
    var secondDeviceDelta:String = ""
    @IBOutlet weak var secondDeviceNameLable: UITextField!
    @IBOutlet weak var secondDeviceTimeLable: UITextField!
    @IBOutlet weak var secondDeviceAmOrPmLable: UITextField!
    @IBOutlet weak var secondDeviceDeltaLable: UITextField!

//    var thirdDevice:String = ""
    var thirdDeviceName:String = ""
    var thirdDeviceTime:String = ""
    var thirdDeviceAmOrPm:String = ""
    var thirdDeviceDelta:String = ""
    @IBOutlet weak var thirdDeviceNameLable: UITextField!
    @IBOutlet weak var thirdDeviceTimeLable: UITextField!
    @IBOutlet weak var thirdDeviceAmOrPmLable: UITextField!
    @IBOutlet weak var thirdDeviceDeltaLable: UITextField!
    
//    var fourthDevice:String = ""
    var fourthDeviceName:String = ""
    var fourthDeviceTime:String = ""
    var fourthDeviceAmOrPm:String = ""
    var fourthDeviceDelta:String = ""
    
    @IBOutlet weak var fourthDeviceNameLable: UITextField!
    @IBOutlet weak var fourthDeviceTimeLable: UITextField!
    @IBOutlet weak var fourthDeviceAmOrPmLable: UITextField!
    @IBOutlet weak var fourthDeviceDeltaLable: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        wakeTimeLable.text = tmpString
        firstDeviceNameLable.text = firstDeviceName
        secondDeviceNameLable.text = secondDeviceName
        thirdDeviceNameLable.text = thirdDeviceName
        fourthDeviceNameLable.text = fourthDeviceName
        
        firstDeviceTimeLable.text = "6:45"
        secondDeviceTimeLable.text = "8:10"
        thirdDeviceTimeLable.text = "8:10"
        fourthDeviceTimeLable.text = "8:00"
           }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func firstDeviceSwitchChanged(sender: UISwitch) {
//        sender.on = true
        if sender.on == true {
            print("true")
            let time:String = firstDeviceTimeLable.text!
            oneDeviceOrder(1, name:"device-1",time:time)
        }
        print("press")
    }
    
    @IBAction func secondDeviceSwitchChanged(sender: UISwitch) {
        //        sender.on = true
        if sender.on == true {
            print("true")
            let time:String = secondDeviceTimeLable.text!
            oneDeviceOrder(2, name:"device-2",time:time)
        }
        print("press")
    }
    
    @IBAction func thirdDeviceSwitchChanged(sender: UISwitch) {
        //        sender.on = true
        if sender.on == true {
            print("true")
            let time:String = thirdDeviceTimeLable.text!
            oneDeviceOrder(3, name:"device-3",time:time)
        }
        print("press")
    }
    
    @IBAction func fourthDeviceSwitchChanged(sender: UISwitch) {
        //        sender.on = true
        if sender.on == true {
            print("true")
            let time:String = fourthDeviceTimeLable.text!
            oneDeviceOrder(4, name:"device-4",time:time)
        }
        print("press")
    }
    
    func oneDeviceOrder(num:Int,name:String,time:String) ->Void {
        let client = Client()
            .baseUrl(server)
            .onError({e in self.alertError(e)});
    
        client.get("/order/oneDevice")
            .query(["name": name, "num": String(num),"time":time])
            .set("header", "headerValue")
            .end({(res:Response) -> Void in
                if(res.basicStatus == .OK) { // status of 2xx
                    self.handleResponseJson(res.body)
                }
                else {
                    self.handleErrorJson(res.body)
                }
            })
    }
    
    func alertError(error : NSError) ->Void {
        print("error.userInfo")
    }
    
    func handleResponseJson(json:AnyObject?) ->Void {
        print("json error")
    }
    
    func handleErrorJson(json:AnyObject?) ->Void {
        print("json error")
    }
//    @IBAction func firstDeviceChange(sender: UITextField) {
//        firstDeviceDeltaLable.text = "haha"
//    }
//
//    @IBAction func secondDeviceValueChange(sender: UITextField) {
//        secondDeviceTimeLable.text = "12323"
////        secondDeviceTimeLable.
//    }
//    
//    @IBAction func test(sender: AnyObject) {
//        secondDeviceTimeLable.text = "12323"
//    }
//    @IBAction func test2(sender: AnyObject) {
//        secondDeviceTimeLable.text = "12323"
//    }
}
