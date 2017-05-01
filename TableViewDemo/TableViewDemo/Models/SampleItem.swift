//
//  SampleItem.swift
//  TableViewDemo
//
//  Created by David McLaren on 4/28/17.
//  Copyright © 2017 David McLaren. All rights reserved.
//

import UIKit

class SampleItem {
    var name:String = ""
    var desc:String = ""
    var img:UIImage?
    
    init?(_ name:String, _ desc:String, _ img:UIImage?) {
        if name.isEmpty || desc.isEmpty {
            return nil
        }
        
        self.name = name
        self.desc = desc
        self.img = img
    }
}
