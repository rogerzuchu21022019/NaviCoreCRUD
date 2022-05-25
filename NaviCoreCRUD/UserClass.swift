//
//  User.swift
//  NaviCoreCRUD
//
//  Created by Vu Thanh Nam on 19/05/2022.
//

import CoreData

@objc(UserClass)
class UserClass : NSManagedObject {
    @NSManaged var username:String!
    @NSManaged var password:String!
    @NSManaged var fullname:String!
    @NSManaged var phone:String!
    @NSManaged var email:String!
    @NSManaged var address:String!
}
