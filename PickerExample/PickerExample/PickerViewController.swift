//
//  PickerViewController.swift
//  PickerExample
//
//  Created by David McLaren on 4/3/17.
//  Copyright © 2017 David McLaren. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var colorPickerView: UIPickerView!
    
    var pickerData = ["Red", "Green", "Blue"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Link the picker to our view controller so we can provide the data and call it's delegate functions
        colorPickerView.dataSource = self
        colorPickerView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // Set the number of items to the same number of items in our array
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // Set each row in the pickerView to the corresponding string in our array
        return pickerData[row]
    }
}
