//
//  ViewController.swift
//  Swift3.0UISample
//
//  Created by 金飞 on 16/9/18.
//  Copyright © 2016年 Fei Jin. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let row : AnyObject = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
        
        row.setValue(1, forKey: "id")
        row.setValue("jinfei", forKey: "name")
        do{
            
            try context.save()
            
        }catch let err as NSError{
            print(err.localizedDescription)
        }
        
        let f : NSFetchRequest<User> = NSFetchRequest(entityName: "User")
        
        
        do {
            let result = try context.fetch(f)
            print(result.count)
            for i in 0 ..< result.count {
                print(result[i].value(forKey: "name"))
            }
            print(result)
        }catch let err as NSError {
            print(err.localizedDescription)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

