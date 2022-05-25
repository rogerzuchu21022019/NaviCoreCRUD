//
//  SignUpVC.swift
//  NaviCoreCRUD
//
//  Created by Vu Thanh Nam on 19/05/2022.
//

import UIKit
import CoreData
var arrUser :[UserClass] = []
class ListVC : UIViewController,UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var myTable: UITableView!
    let context:NSManagedObjectContext = appDelegate.persistentContainer.viewContext
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUser.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        let result = arrUser[indexPath.row]
        cell.lblUsername.text = result.username
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        requestFetch()
        myTable.reloadData()
    }
    func requestFetch(){
        let request = NSFetchRequest<UserClass>(entityName: "UserClass")
        do {
            arrUser = try context.fetch(request)
        } catch {
            print("error")
        }
    }
    
    func initLayout(){
        myTable.delegate = self
        myTable.dataSource = self
        self.navigationItem.hidesBackButton = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out",
                                                                 style: .done,
                                                                 target: self,
                                                                 action: #selector(backToRootVC))
    }
    @objc func backToRootVC(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
