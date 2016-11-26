//
//  ViewController.swift
//  SmartHome
//
//  Created by syp on 16/11/13.
//  Copyright © 2016年 syp. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    let server :String = "http://192.168.1.110:8080"

    @IBOutlet weak var device1: UILabel!
    @IBOutlet weak var device2: UILabel!
    @IBOutlet weak var device3: UILabel!
    @IBOutlet weak var device4: UILabel!
    
    @IBOutlet weak var devicename1: UILabel!
    @IBOutlet weak var devicename2: UILabel!
    @IBOutlet weak var devicename3: UILabel!
    @IBOutlet weak var devicename4: UILabel!
    
    @IBOutlet weak var deviceControl1: UISegmentedControl!
    @IBOutlet weak var deviceControl2: UISegmentedControl!
    @IBOutlet weak var deviceControl3: UISegmentedControl!
    @IBOutlet weak var deviceControl4: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func breakfastViewExist(segue:UIStoryboardSegue){
        print("closed")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "GoToBreakfast"{
            
            let breakfastViewController = segue.destinationViewController as! BreakfastViewController
            
            breakfastViewController.firstDevice = device1.text!
            breakfastViewController.secondDevice = device2.text!
            breakfastViewController.thirdDevice = device3.text!
            breakfastViewController.fourthDevice = device4.text!
            
            breakfastViewController.firstDeviceName = devicename1.text!
            breakfastViewController.secondDeviceName = devicename2.text!
            breakfastViewController.thirdDeviceName = devicename3.text!
            breakfastViewController.fourthDeviceName = devicename4.text!
        }
    }

    @IBAction func deviceControl1(sender: UISegmentedControl) {
        
        let index = sender.selectedSegmentIndex
        
        if let mname:String = devicename1.text {
            print(mname)
            
            switch (index) {
            case 0://kai
                print("1device open")
                oneDeviceOn(1, name: mname)
            case 1:
                print("1device close")
                oneDeviceOff(1, name: mname)
            case 2:
                print("1device will be")
            default :
                print("1unknown")
            }
        }else
        {
            print("not name,nothing to do")
            return
        }
    }
    
    
    @IBAction func deviceControl2(sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        
        if let mname:String = devicename2.text {
            print(mname)
            
            switch (index) {
            case 0://kai
                print("2device open")
                oneDeviceOn(2, name: mname)
            case 1:
                print("2device close")
                oneDeviceOff(2, name: mname)
            case 2:
                print("2device will be")
            default :
                print("2unknown")
            }
        }else
        {
            print("not name,nothing to do")
            return
        }
    }

    @IBAction func deviceControl3(sender: UISegmentedControl) {
        
        let index = sender.selectedSegmentIndex
        
        if let mname:String = devicename3.text {
            print(mname)
            
            switch (index) {
            case 0://kai
                print("3device open")
                oneDeviceOn(3, name: mname)
            case 1:
                print("3device close")
                oneDeviceOff(3, name: mname)
            case 2:
                print("3device will be")
            default :
                print("3unknown")
            }
        }else
        {
            print("not name,nothing to do")
            return
        }
    }
    
    @IBAction func deviceControl4(sender: UISegmentedControl) {
        
        let index = sender.selectedSegmentIndex
        
        if let mname:String = devicename4.text {
            print(mname)
            
            switch (index) {
            case 0://kai
                print("4device open")
                oneDeviceOn(4, name: mname)
            case 1:
                print("4device close")
                oneDeviceOff(4, name: mname)
            case 2:
                print("4device will be")
            default :
                print("4unknown")
            }
        }else
        {
            print("not name,nothing to do")
            return
        }
    }
    
    
    @IBAction func allDeviceOn(sender: UIButton) {
        
        var selected:Int = deviceControl1.selectedSegmentIndex
        if selected != 0{
            deviceControl1.selectedSegmentIndex = 0
            let mname = devicename1.text
            oneDeviceOn(1, name:mname!)
        }
        
        selected = deviceControl2.selectedSegmentIndex
        if selected != 0{
            deviceControl2.selectedSegmentIndex = 0
            let mname = devicename2.text
            oneDeviceOn(2, name: mname!)
        }
        
        selected = deviceControl3.selectedSegmentIndex
        if selected != 0{
            deviceControl3.selectedSegmentIndex = 0
            let mname = devicename3.text
            oneDeviceOn(3, name: mname!)
        }

        selected = deviceControl4.selectedSegmentIndex
        if selected != 0{
            deviceControl4.selectedSegmentIndex = 0
            let mname = devicename4.text
            oneDeviceOn(4, name: mname!)
        }
    }
    
    @IBAction func allDeviceOff(sender: UIButton) {
        
        var selected:Int = deviceControl1.selectedSegmentIndex
        if selected != 1{
            deviceControl1.selectedSegmentIndex = 1
            let mname = devicename1.text
            oneDeviceOff(1, name: mname!)
        }
        
        selected = deviceControl2.selectedSegmentIndex
        if selected != 1{
            deviceControl2.selectedSegmentIndex = 1
            let mname = devicename2.text
            oneDeviceOff(2, name: mname!)
        }
        
        selected = deviceControl3.selectedSegmentIndex
        if selected != 1{
            deviceControl3.selectedSegmentIndex = 1
            let mname = devicename3.text
            oneDeviceOff(3, name: mname!)
        }
        
        selected = deviceControl4.selectedSegmentIndex
        if selected != 1{
            deviceControl4.selectedSegmentIndex = 1
            let mname = devicename4.text
            oneDeviceOff(4, name: mname!)
        }
    }
    
    
    func oneDeviceOn(num:Int,name:String) ->Void {
        let client = Client()
            .baseUrl(server)
            .onError({e in self.alertError(e)});
        
        client.get("/device/oneDeviceOn")
            .query(["name": name, "num": String(num)])
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
    
    func oneDeviceOff(num:Int,name:String) ->Void {
        let client = Client()
            .baseUrl(server)
            .onError({e in self.alertError(e)});
        
        client.get("/device/oneDeviceOff")
            .query(["name": name, "num": String(num)])
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
}

