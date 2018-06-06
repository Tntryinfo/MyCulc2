//
//  SettingViewController.swift
//  CalculatorApp
//
//  Created by TakumaNishioka on 2018/06/06.
//  Copyright © 2018年 TakumaNishioka. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UITableViewDataSource {
    
    var taxList = [taxData]()
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
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell" , for: indexPath)
        cell.textLabel?.text = taxList[indexPath.row].taxTableName
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "消費税"
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
