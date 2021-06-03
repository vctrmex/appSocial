//
//  ProfilesViewController.swift
//  Messenger
//
//  Created by victor manzanero on 07/05/21.
//  Copyright © 2021 ASN GROUP LLC. All rights reserved.
//

import UIKit

class ProfilesViewController: UIViewController {
    
    
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var btnChat: UIButton!
    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var userImg: UIImageView!
    var objUser:Users?
    override func viewDidLoad() {
        super.viewDidLoad()

        startView()
    }
    
    func startView(){
        if objUser?.genero == "H"{
            
            lblNombre.text =  "🙋‍♂️ \(objUser!.nombre)"
            
        }else {
            
            lblNombre.text =  "🙋‍♀️ \(objUser!.nombre)"
            
        }
        userImg.image = UIImage(named: objUser!.imagen)
    }

   

}

