//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by xiaobo on 15/10/5.
//  Copyright © 2015年 xiaobo. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    var 餐馆 = ["咖啡胡同", "霍米", "茶.家", "洛伊斯咖啡", "贝蒂生蚝", "福奇餐馆", "阿波画室", "伯克街面包坊", "黑氏巧克力", "惠灵顿雪梨", "北州", "布鲁克林塔菲", "格雷厄姆大街肉", "华夫饼 & 沃夫", "五叶", "眼光咖啡", "忏悔", "巴拉菲娜", "多尼西亚", "皇家橡树", "泰咖啡"]
    
    var 餐馆图片 =
    ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
    
    var 餐馆地点 = ["香港", "香港", "香港", "香港", "香港", "香港", "香港", "悉尼", "悉尼", "悉尼", "纽约", "纽约", "纽约", "纽约", "纽约", "纽约", "纽约", "伦敦", "伦敦", "伦敦", "伦敦"]
    
    var 餐馆类型 = ["咖啡 & 茶店","咖啡", "茶屋", "奥地利式 & 休闲饮料","法式", "面包房", "面包房", "巧克力", "咖啡", "美式 & 海鲜", "美式", "美式","早餐 & 早午餐", "法式 & 茶", "咖啡 & 茶", "拉丁美式", "西班牙式", "西班牙式", "西班牙式", "英式", "泰式"]
    
    var 去过的餐馆 = [Bool](count: 21, repeatedValue: false)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 餐馆.count
    }
    
    //选择了行以后的操作
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let alert = UIAlertController(title: "亲，您选择了我", message: "消息", preferredStyle: .ActionSheet)
    
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel,handler: nil)

        let 拨打行为的处理 = { (action: UIAlertAction) -> Void in
            let alert = UIAlertController(title: "提示", message: "您拨打的电话号码暂时无法接通", preferredStyle: .Alert)
            let action = UIAlertAction(title: "ok", style: .Default, handler: nil)
            alert.addAction(action)
            self.presentViewController(alert, animated: true, completion: nil)
        }

        
        let dialAction = UIAlertAction(title: "拨打 021-6532 \(indexPath.row)", style: .Default,handler: 拨打行为的处理)

        let 我来过 = UIAlertAction(title: "我来过",style: .Default) { (_) -> Void in
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            
            self.去过的餐馆[indexPath.row] = true
        }
        
        alert.addAction(cancelAction)
        alert.addAction(dialAction)
        alert.addAction(我来过)

        
        self.presentViewController(alert, animated: true, completion: nil)
    
    }
    

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomTableViewCell

        // Configure the cell...
        cell.restaurantImage.image = UIImage(named: 餐馆图片[indexPath.row])
        cell.restaurantName.text = 餐馆[indexPath.row]
        cell.restaurantType.text = 餐馆类型[indexPath.row]
        cell.location.text = 餐馆地点[indexPath.row]
    
        
        cell.restaurantImage.layer.cornerRadius = cell.restaurantImage.frame.size.width / 2
        
        cell.restaurantImage.clipsToBounds = true
        
        cell.accessoryType = 去过的餐馆[indexPath.row] ? .Checkmark : .None

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
