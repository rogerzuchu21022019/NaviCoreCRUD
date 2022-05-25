//
//  ViewController.swift
//  NaviCoreCRUD
//
//  Created by Vu Thanh Nam on 19/05/2022.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate

class HomeVC : UIViewController {
    
   
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBAction func gotoSignIn(_ sender: UIButton) {
        initDatabase()
        let gotoSignInVC = self.storyboard?.instantiateViewController(withIdentifier: "signInVC") as! SignInVC
        self.navigationController?.pushViewController(gotoSignInVC, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func initDatabase(){
        let context:NSManagedObjectContext  = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "UserClass", in: context)
        let newUser = UserClass(entity: entity!, insertInto: context)
        newUser.fullname = nil
        newUser.username = txtUsername.text!
        if txtPassword.text == txtConfirmPassword.text{
            newUser.password = txtConfirmPassword.text!
        }
        newUser.address = nil
        newUser.email = txtEmail.text!
        newUser.phone = nil
        do {
            try context.save()
        } catch  {
            print("eroor")
        }
        
        
    }
    


}

