//
//  ViewController.swift
//  new_iBeaconApplication
//
//  Created by watauchi on 11/10/14.
//  Copyright (c) 2014 watauchi. All rights reserved.
//

import UIKit
//これ以下は残してていいのか？わからん・・・

class ViewController: UIViewController {
    
    // API取得の開始処理
    func getData() {
        let URL = NSURL(string: "http://192.168.1.13:3000/")
        let req = NSURLRequest(NSURL: URL!)
        let connection: NSURLConnection = NSURLConnection(request: req, delegate: self, startImmediately: false)
        
        // NSURLConnectionを使ってAPIを取得する
        NSURLConnection.sendAsynchronousRequest(req,
            queue: NSOperationQueue.mainQueue(),
            completionHandler: response)
    }
    
    // 取得したAPIデータの処理
    func response(res: NSURLResponse!, data: NSData!, error: NSError!){
        
        println(data)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func openlist(sender: AnyObject) {
        getData()
    }

}

