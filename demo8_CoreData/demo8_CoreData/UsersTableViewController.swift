//
//  UsersTableViewController.swift
//  demo8_CoreData
//
//  Created by ChenXin on 2016/11/22.
//  Copyright © 2016年 ChenXin. All rights reserved.
//

import UIKit
import CoreData

class UsersTableViewController: UITableViewController {
    
    var dataArr:Array<AnyObject> = []
    var context:NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        refreshData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArr.count
        
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = dataArr[indexPath.row] as! NSManagedObject
        let vc = storyboard?.instantiateViewController(withIdentifier: "UserContent") as! UserContentViewController
        vc.data = data
        present(vc, animated: true, completion: nil)
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        let label = cell.viewWithTag(6) as! UILabel
        let attribute1 = dataArr[indexPath.row].value(forKey: "attribute1")
        let attribute2 = dataArr[indexPath.row].value(forKey: "attribute2")
        label.text =  "attribute1:\(attribute1), attribute2:\(attribute2)"
        
        return cell
    }
    
    func refreshData() {
        let f = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        try! dataArr = context.fetch(f)
        
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        refreshData()
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            context.delete(dataArr[indexPath.row] as! NSManagedObject)
            try! context.save()
            
            refreshData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
