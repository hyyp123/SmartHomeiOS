//
//  BreakfastViewControllerExtention.swift
//  SmartHome
//
//  Created by syp on 16/11/19.
//  Copyright © 2016年 syp. All rights reserved.
//

import UIKit

extension BreakfastViewController:UIPickerViewDataSource{
    
    // returns the number of 'columns' to display.
    @available(iOS 2.0, *)
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 2
    }
    // returns the # of rows in each component..
    @available(iOS 2.0, *)
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        if component == 0 {
            return props.count
        }

        return 100
    }
}

extension BreakfastViewController:UIPickerViewDelegate {
    
    @available(iOS 2.0, *)
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        
        if component == 0{
            return props[row]
        }
        
        
        return String(row)
    }
}
