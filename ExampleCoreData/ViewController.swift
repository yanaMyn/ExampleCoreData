//
//  ViewController.swift
//  ExampleCoreData
//
//  Created by yana mulyana on 28/01/20.
//  Copyright © 2020 LinkAJa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var persistent = CoreDatamanager()
    var users = [User]()
    
    init(persistent: CoreDatamanager) {
        self.persistent = persistent
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.getUsers()
        //self.create()
        //self.updateUser()
        self.deleteUser()
        
    }
    
    func create() {
        let user = User(context: persistent.context)
        user.name = "yana"
        
        persistent.save()
    }
    
    func getUsers() {
        let users = persistent.fetch(objectType: User.self)
        self.users = users
        users.forEach( {print($0.name!)} )
    }

    func updateUser() {
        let user = users.first!
        user.name = "dudung"
        
        persistent.save()
        getUsers()
    }
    
    func deleteUser() {
        let user = users.first!
        
        persistent.delete(object: user)
    }
    

}

