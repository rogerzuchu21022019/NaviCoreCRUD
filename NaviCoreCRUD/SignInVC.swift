//
//  SignInVC.swift
//  NaviCoreCRUD
//
//  Created by Vu Thanh Nam on 19/05/2022.
//

import UIKit
import CoreData

class SignInVC : UIViewController{
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBAction func gotoSignUp(_ sender: UIButton) {
        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "homeVC") as! HomeVC
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    @IBAction func gotoList(_ sender: UIButton) {
        
        loadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func loadData(){
        let context:NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<UserClass>(entityName: "UserClass")
        do {
            arrUser = try context.fetch(request)
            for user in arrUser {
                
               
                if user.username == txtUsername.text && user.password == txtPassword.text{
                    let listVC = self.storyboard?.instantiateViewController(withIdentifier: "listVC") as! ListVC
                    self.navigationController?.pushViewController(listVC, animated: true)
                }
            }
        } catch  {
            print("error")
        }
    }
}
