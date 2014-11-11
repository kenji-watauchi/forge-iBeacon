//
//  ViewController-table.swift
//  new_iBeaconApplication
//
//  Created by watauchi on 11/10/14.
//  Copyright (c) 2014 watauchi. All rights reserved.
//

import Foundation

import UIKit

//ここでデリゲートプロトコルを宣言してる→プロトコル名はViewControllerってこと？
class ViewController_table: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var table_views: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.table_views.delegate = self
        self.table_views.dataSource = self
        //変数名間違ってただけ！
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //こっからAPI取得ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
    // API取得の開始処理
    func getData() {
        let URL = NSURL(string: "http://192.168.1.13:3000/")
        let req = NSURLRequest(URL: URL!)
        //let req はアンラップ（optional型から値が取り出すこと）されていなかったらしい
        let connection = NSURLConnection(request: req, delegate: self, startImmediately: false)
        
        // NSURLConnectionを使ってAPIを取得する
        NSURLConnection.sendAsynchronousRequest(req,
            queue: NSOperationQueue.mainQueue(),
            completionHandler: response)
    }
    
    @IBAction func openlist(sender: AnyObject) {
        getData()
    }
    //JSON解析ーーーーーーーーーーーーーーーーーーーーーー
    // 取得したAPIデータの処理
    func response(res: NSURLResponse!, data: NSData!, error: NSError!){
        
        let json:NSDictionary = NSJSONSerialization.JSONObjectWithData(data,
            options: NSJSONReadingOptions.AllowFragments, error: nil) as NSDictionary
        
        let res:NSDictionary = json.objectForKey("response") as NSDictionary
        let items:NSArray = res.objectForKey("items") as NSArray
        
        // １行ずつログに表示
        for var i=0 ; i<items.count ; i++ {
            println(items[i])
        }
    }
    
    
 let texts = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
        // セルの行数 ここでtableViewメソッドを作っている
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return texts.count
    }
    
    // セルの内容を変更
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        
        cell.textLabel.text = texts[indexPath.row]
        return cell
    }
    
    

    
    }
