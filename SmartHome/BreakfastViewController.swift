//
//  BreakfastViewController.swift
//  SmartHome
//
//  Created by syp on 16/11/19.
//  Copyright © 2016年 syp. All rights reserved.
//

import UIKit

class BreakfastViewController:UIViewController{
  
    @IBOutlet weak var wakeTimeLable: UILabel!
    
    var firstDevice :String = ""
    var firstDeviceName:String = ""
    @IBOutlet weak var firstDeviceLable: UILabel!
    @IBOutlet weak var firstDeviceNameLable: UILabel!
    
    var secondDevice :String = ""
    var secondDeviceName:String = ""
    @IBOutlet weak var secondDeviceLable: UILabel!
    @IBOutlet weak var secondDeviceNameLable: UILabel!

    var thirdDevice:String = ""
    var thirdDeviceName:String = ""
    @IBOutlet weak var thirdDeviceLable: UILabel!
    @IBOutlet weak var thirdDeviceNameLable: UILabel!
    
    var fourthDevice:String = ""
    var fourthDeviceName:String = ""
    @IBOutlet weak var fourthDeviceLable: UILabel!
    @IBOutlet weak var fourthDeviceNameLable: UILabel!
    
    
    let props = ["提前","延后"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        wakeTimeLable.text = tmpString
        firstDeviceLable.text = firstDevice
        secondDeviceLable.text = secondDevice
        thirdDeviceLable.text = thirdDevice
        fourthDeviceLable.text = fourthDevice
        
        firstDeviceNameLable.text = firstDeviceName
        secondDeviceNameLable.text = secondDeviceName
        thirdDeviceNameLable.text = thirdDeviceName
        fourthDeviceNameLable.text = fourthDeviceName
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
