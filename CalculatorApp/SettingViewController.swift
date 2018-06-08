//
//  SettingViewController.swift
//  CalculatorApp
//
//  Created by TakumaNishioka on 2018/06/06.
//  Copyright © 2018年 TakumaNishioka. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var taxList = [taxData]()
    
    // AppDelegateのデータを利用できるようにする
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 起動時に読み込み
        // デシリアライズ
        let userDefault = UserDefaults.standard
        if let storedTaxList = userDefault.object(forKey: "taxList") as? Data {
            if let unarchiveTaxList = NSKeyedUnarchiver.unarchiveObject(with: storedTaxList) as? [taxData] {
                taxList.append(contentsOf: unarchiveTaxList)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taxList.count
    }
    // cell表示の処理
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell" , for: indexPath)
        cell.textLabel?.text = taxList[indexPath.row].taxTableName
        if taxList[indexPath.row].taxActive! {
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
        }
        else {
            cell.accessoryType = UITableViewCellAccessoryType.none
        }
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "消費税"
    }
    
    // cellがtapされたときの処理
    func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
        
        // 現在のactiveTaxのcellをfalseにする
        for i in taxList {
            if i.taxActive! {
                i.taxActive = false
                print(i.taxTableName!)
            }
        }
        // タップされたcellのactiveTaxをtrueする
        taxList[indexPath.row].taxActive = true
        appDelegate.activeTax = 1.0 + taxList[indexPath.row].taxPercent! / 100.0
        
        // シリアライズ処理
        Serialize()
        
        // セルの状態を変更
        // 画面のリロード
        tableView.reloadData()
    }
    
    
    
    func Serialize () {
        // Data型にシリアライズする
        let userDefault = UserDefaults.standard
        let data = NSKeyedArchiver.archivedData(withRootObject: taxList)
        userDefault.set (data, forKey: "taxList")
        userDefault.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
