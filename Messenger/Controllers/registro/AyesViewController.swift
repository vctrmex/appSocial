//
//  AyesViewController.swift
//  Messenger
//
//  Created by victor manzanero on 07/05/21.
//  Copyright © 2021 ASN GROUP LLC. All rights reserved.
//

import UIKit

class AyesViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var lblayer: UILabel!
    @IBOutlet weak var anios: UIPickerView!
    let pickerData = ["18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        anios.delegate = self
        anios.dataSource = self

        // Do any additional setup after loading the view.
    }
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblayer.text = "\(pickerData[row]) old"
    }

    
    

}

