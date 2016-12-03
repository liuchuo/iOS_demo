//
//  HomeTableViewController.swift
//  demo11_SQLiteWithSwift
//
//  Created by ChenXin on 2016/12/2.
//  Copyright © 2016年 ChenXin. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    // 数据源
    var stuArr : Array<AnyObject> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        loadTableViewData()
    }
    
    func loadTableViewData() {
        let querySQL = "SELECT stuNum, stuName FROM 't_Student'"
        // 取出查询到的结果
        let resultDataArr = SQLManager.shareInstance().queryDataBase(querySQL: querySQL)
        stuArr = []
        for dict in resultDataArr! {
            let mymodel = StudentModel(idNum: dict["stuNum"] as! String, stuName: dict["stuName"] as! String)
            stuArr.append(mymodel)
            
        }
        tableView.reloadData()
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
        return stuArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // 给cell赋值
        if self.stuArr.count > 0 {
            //创建一个StudentModel类型的model对象，并且给model对象赋值为数据源的当前行下标的值数据
            let model:StudentModel = stuArr[indexPath.row] as! StudentModel
            //cell的大标题和副标题分别赋值为model的idNum和stuName属性
            cell.textLabel?.text = model.idNum
            cell.detailTextLabel?.text = model.stuName
        }
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadTableViewData()
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
            let needDeleteStuNum = (stuArr[indexPath.row] as! StudentModel).idNum
            let deleteSQL = "DELETE FROM 't_Student' WHERE stuNum = '\(needDeleteStuNum)';"
            if SQLManager.shareInstance().execSQL(SQL: deleteSQL) == true {
                print("删除该数据成功")
            } else {
                print("删除该数据失败")
            }
            loadTableViewData()
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
