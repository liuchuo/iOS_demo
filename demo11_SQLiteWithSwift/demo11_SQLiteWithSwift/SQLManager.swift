//
//  SQLManager.swift
//  demo11_SQLiteWithSwift
//
//  Created by ChenXin on 2016/12/2.
//  Copyright © 2016年 ChenXin. All rights reserved.
//

import UIKit

let DBFILE_NAME = "Student.sqlite"

public class SQLManager : NSObject {
    // 创建该类的静态实例变量
    static let instance = SQLManager();
    // 定义数据库变量
    var db : OpaquePointer? = nil
    // 对外提供创建单例对象的接口
    class func shareInstance() -> SQLManager {
        return instance
    }
    
    // 获取数据库文件的路径
    func getFilePath() -> String {
        let documentPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last
        let DBPath = (documentPath! as NSString).appendingPathComponent(DBFILE_NAME)
        print("数据库的地址是：\(DBPath)")
        return DBPath
    }
    
    func createDataBaseTableIfNeeded() {
        // 只接受C语言的字符串，所以要把DBPath这个NSString类型的转换为cString类型，用UTF8的形式表示
        let cDBPath = getFilePath().cString(using: String.Encoding.utf8)
        
        // 第一个参数：数据库文件路径，这里是我们定义的cDBPath
        // 第二个参数：数据库对象，这里是我们定义的db
        // SQLITE_OK是SQLite内定义的宏，表示成功打开数据库
        if sqlite3_open(cDBPath, &db) != SQLITE_OK {
            // 失败
            print("数据库打开失败~！")
        } else {
            // 创建表的SQL语句（根据自己定义的数据model灵活改动）
            print("数据库打开成功~！")
            let createStudentTableSQL = "CREATE TABLE IF NOT EXISTS 't_Student' ('stuNum' TEXT NOT NULL PRIMARY KEY AUTOINCREMENT, 'stuName' TEXT);"
            if execSQL(SQL: createStudentTableSQL) == false {
                // 失败
                print("执行创建表的SQL语句出错~")
            } else {
                print("创建表的SQL语句执行成功！")
            }
        }
    }
    
    // 查询数据库，传入SQL查询语句，返回一个字典数组
    func queryDataBase(querySQL : String) -> [[String : AnyObject]]? {
        // 创建一个语句对象
        var statement : OpaquePointer? = nil
        
        if querySQL.lengthOfBytes(using: String.Encoding.utf8) > 0 {
            let cQuerySQL = (querySQL.cString(using: String.Encoding.utf8))!
            // 进行查询前的准备工作
            // 第一个参数：数据库对象，第二个参数：查询语句，第三个参数：查询语句的长度（如果是全部的话就写-1），第四个参数是：句柄（游标对象）
            if sqlite3_prepare_v2(db, cQuerySQL, -1, &statement, nil) == SQLITE_OK {
                var queryDataArr = [[String: AnyObject]]()
                while sqlite3_step(statement) == SQLITE_ROW {
                    // 获取解析到的列
                    let columnCount = sqlite3_column_count(statement)
                    // 遍历某行数据
                    var temp = [String : AnyObject]()
                    for i in 0..<columnCount {
                        // 取出i位置列的字段名,作为temp的键key
                        let cKey = sqlite3_column_name(statement, i)
                        let key : String = String(validatingUTF8: cKey!)!
                        //取出i位置存储的值,作为字典的值value
                        let cValue = sqlite3_column_text(statement, i)
                        let value = String(cString: cValue!)
                        temp[key] = value as AnyObject
                    }
                    queryDataArr.append(temp)
                }
                return queryDataArr
            }
        }
        return nil
    }
    
    // 执行SQL语句的方法，传入SQL语句执行
    func execSQL(SQL : String) -> Bool {
        let cSQL = SQL.cString(using: String.Encoding.utf8)
        let errmsg : UnsafeMutablePointer<UnsafeMutablePointer<Int8>?>? = nil
        if sqlite3_exec(db, cSQL, nil, nil, errmsg) == SQLITE_OK {
            return true
        } else {
            print("执行SQL语句时出错，错误信息为：\(errmsg)")
            return false
        }
    }
    
    
    
}


