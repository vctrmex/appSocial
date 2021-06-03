//
//  MainViewController.swift
//  Messenger
//
//  Created by victor manzanero on 25/04/21.
//  Copyright © 2021 ASN GROUP LLC. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var listUsers:[Users] = []
    var hUsers:[Users] = []
    var mUsers:[Users] = []
    var llaves = 5
    var context = CIContext(options: nil)
    
    @IBOutlet weak var selected: UISegmentedControl!
    
    @IBOutlet weak var keys: UIBarButtonItem!
    
    @IBOutlet weak var coleccion: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coleccion.delegate = self
        coleccion.dataSource = self
        let user1 = Users(nombre: "Usuario1", edad: 20, disponible: false, imagen: "1", genero: "M")
        let user2 = Users(nombre: "Usuario2", edad: 21, disponible: false, imagen: "2", genero: "M")
        let user3 = Users(nombre: "Usuario3", edad: 19, disponible: false, imagen: "3", genero: "H")
        let user4 = Users(nombre: "Usuario4", edad: 19, disponible: false, imagen: "4", genero: "M")
        let user5 = Users(nombre: "Usuario5", edad: 20, disponible: false, imagen: "5", genero: "H")
        let user6 = Users(nombre: "Usuario6", edad: 23, disponible: false, imagen: "6", genero: "H")
        
        listUsers.append(user1)
        listUsers.append(user2)
        listUsers.append(user3)
        listUsers.append(user4)
        listUsers.append(user5)
        listUsers.append(user6)
        
        keys.title = "\(llaves) 🔑"
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch selected.selectedSegmentIndex {
        case 0:
            return listUsers.count
         
        case 1:
            return mUsers.count
            
        case 2:
            return hUsers.count
            
        default:
            return 0
            
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var usuario:Users?
        switch selected.selectedSegmentIndex {
        case 0:
            usuario = listUsers[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UsersUiCollectionViewCell
            cell.lblUltimaVez.text = "1hr ago"
            cell.lblNombre.text = usuario?.nombre
            if usuario!.disponible {
                
                cell.imgUser.image = UIImage(named: usuario!.imagen)
                cell.block.isHidden = true
                cell.imgUser.alpha = 1
                
            }else{
                cell.imgUser.image = UIImage(named: usuario!.imagen)
                blurEffect(bg: cell.imgUser)
                cell.block.isHidden = false
                cell.imgUser.alpha = 0.4
                cell.block.image = UIImage(named: "7")
                
            }
            return cell
            
        case 1:
            usuario = mUsers[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UsersUiCollectionViewCell
            
            if usuario!.disponible {
                
                cell.imgUser.image = UIImage(named: usuario!.imagen)
                cell.block.isHidden = true
                cell.imgUser.alpha = 1
                
            }else{
                cell.imgUser.image = UIImage(named: usuario!.imagen)
                blurEffect(bg: cell.imgUser)
                cell.block.isHidden = false
                cell.imgUser.alpha = 0.4
                cell.block.image = UIImage(named: "7")
                
            }
            return cell
            
        case 2:
            usuario = hUsers[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UsersUiCollectionViewCell
            
            if usuario!.disponible {
                
                cell.imgUser.image = UIImage(named: usuario!.imagen)
                cell.block.isHidden = true
                cell.imgUser.alpha = 1
                
            }else{
                cell.imgUser.image = UIImage(named: usuario!.imagen)
                blurEffect(bg: cell.imgUser)
                cell.block.isHidden = false
                cell.imgUser.alpha = 0.4
                cell.block.image = UIImage(named: "7")
                
            }
            return cell
           
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UsersUiCollectionViewCell
            return cell
            
        }
        
        
        //cell.imgUser.highlightedAnimationImages = nil
        
     
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
            switch self.selected.selectedSegmentIndex {
            case 0:
                if self.listUsers[indexPath.row].disponible {
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let view = storyboard.instantiateViewController(identifier: "perfil") as! ProfilesViewController
                    view.objUser = self.listUsers[indexPath.row]
                    self.present(view, animated: true, completion: nil)
                    
                }else {
                    
                    let refreshAlert = UIAlertController(title: "to unlock", message: "do you want to unblock this user?.", preferredStyle: UIAlertController.Style.alert)

                    refreshAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { [self] (action: UIAlertAction!) in
                            
                            if self.llaves > 0{
                                self.listUsers[indexPath.row].disponible = true
                                self.llaves = self.llaves - 1
                                self.keys.title = "\(self.llaves) 🔑"
                                self.coleccion.reloadData()
                            }else{
                                let refreshAlert = UIAlertController(title: "Error", message: "does not have enough keys?.", preferredStyle: UIAlertController.Style.alert)
                                refreshAlert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (action: UIAlertAction!) in
                                      print("Handle Cancel Logic here")
                                }))
                                self.present(refreshAlert, animated: true, completion: nil)
                            }
                    }))

                    refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                          print("Handle Cancel Logic here")
                    }))

                    present(refreshAlert, animated: true, completion: nil)
                }
                break
             
            case 1:
                if self.mUsers[indexPath.row].disponible {
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let view = storyboard.instantiateViewController(identifier: "perfil") as! ProfilesViewController
                    view.objUser = self.mUsers[indexPath.row]
                    self.present(view, animated: true, completion: nil)
                    
                }else {
                    
                    let refreshAlert = UIAlertController(title: "to unlock", message: "do you want to unblock this user?.", preferredStyle: UIAlertController.Style.alert)

                    refreshAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { [self] (action: UIAlertAction!) in
                            
                            if self.llaves > 0{
                                self.mUsers[indexPath.row].disponible = true
                                self.llaves = self.llaves - 1
                                self.keys.title = "\(self.llaves) 🔑"
                                self.coleccion.reloadData()
                            }else{
                                let refreshAlert = UIAlertController(title: "Error", message: "does not have enough keys?.", preferredStyle: UIAlertController.Style.alert)
                                refreshAlert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (action: UIAlertAction!) in
                                      print("Handle Cancel Logic here")
                                }))
                                self.present(refreshAlert, animated: true, completion: nil)
                            }
                    }))

                    refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                          print("Handle Cancel Logic here")
                    }))

                    present(refreshAlert, animated: true, completion: nil)
                }
                break
                
            case 2:
                if self.hUsers[indexPath.row].disponible {
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let view = storyboard.instantiateViewController(identifier: "perfil") as! ProfilesViewController
                    view.objUser = self.hUsers[indexPath.row]
                    self.present(view, animated: true, completion: nil)
                    
                }else {
                    
                    let refreshAlert = UIAlertController(title: "to unlock", message: "do you want to unblock this user?.", preferredStyle: UIAlertController.Style.alert)

                    refreshAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { [self] (action: UIAlertAction!) in
                            
                            if self.llaves > 0{
                                self.hUsers[indexPath.row].disponible = true
                                self.llaves = self.llaves - 1
                                self.keys.title = "\(self.llaves) 🔑"
                                self.coleccion.reloadData()
                            }else{
                                let refreshAlert = UIAlertController(title: "Error", message: "does not have enough keys?.", preferredStyle: UIAlertController.Style.alert)
                                refreshAlert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (action: UIAlertAction!) in
                                      print("Handle Cancel Logic here")
                                }))
                                self.present(refreshAlert, animated: true, completion: nil)
                            }
                    }))

                    refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                          print("Handle Cancel Logic here")
                    }))

                    present(refreshAlert, animated: true, completion: nil)
                }
                break
                
            default:
                print("")
                break
                
            }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
            let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
            let size:CGFloat = (coleccion.frame.size.width - space) / 2.0
            return CGSize(width: size, height: size + 150 )
        }
    
    
    
    @IBAction func selectGender(_ sender: Any) {
        
        hUsers.removeAll()
        mUsers.removeAll()
        
        if selected.selectedSegmentIndex == 1 {
            
            for user in listUsers {
                if user.genero == "M"{
                    
                    mUsers.append(user)
                    
                }
            }
            
        }
        
        if selected.selectedSegmentIndex == 2 {
            
            for user in listUsers {
                if user.genero == "H"{
                    
                    hUsers.append(user)
                    
                }
            }
            
        }
        
        coleccion.reloadData()
        
    }
    
    
    
    
    

    
}

