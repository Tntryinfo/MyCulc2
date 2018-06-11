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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            if taxList[indexPath.row].taxCustom == true {
                taxList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
                Serialize()
            }
            else {
                let alertController = UIAlertController(title: "お知らせ", message: "その設定は削除できません！", preferredStyle: UIAlertControllerStyle.alert)
                let okaction = UIAlertAction(title: "OK",style: UIAlertActionStyle.default) {(action: UIAlertAction) in
                }
                // OKボタンが押されたときの処理
                alertController.addAction(okaction)
                // アラートダイアログを表示
                present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    func Serialize () {
        // Data型にシリアライズする
        let userDefault = UserDefaults.standard
        let data = NSKeyedArchiver.archivedData(withRootObject: taxList)
        userDefault.set (data, forKey: "taxList")
        userDefault.synchronize()
    }
    
    // Addボタンを押されたときの処理
    @IBAction func tapAddButton(_ sender: Any) {
        // アラートダイアログを作成
        let alertController = UIAlertController(title: "Tax追加", message: "新しいTax設定を入力してください", preferredStyle: UIAlertControllerStyle.alert)
        
        // テキストフィールドの追加
        alertController.addTextField(configurationHandler: {(textField: UITextField! ) -> Void in textField.placeholder = "テキスト1設定名"})
        alertController.addTextField(configurationHandler: {(textField: UITextField! ) -> Void in textField.placeholder = "テキスト2数値を(%で入力してください)"})
        
        // OKボタンの設定
        let okaction = UIAlertAction(title: "OK",style: UIAlertActionStyle.default) {(action: UIAlertAction) in
            
            let addtax = taxData()
            // OKボタンがタップされたときの処理
            if let addTaxTableName = alertController.textFields![0].text {
                print(addTaxTableName)
                addtax.taxTableName = addTaxTableName
            }
            if let addTaxPercent = alertController.textFields![1].text {
                // 入力された文字列をDouble型に変換
                let doubleformula: Double = NSString(string: addTaxPercent).doubleValue
                addtax.taxPercent = doubleformula
            }
            addtax.taxActive = false
            addtax.taxCustom = true
            self.taxList.append(addtax)
            self.Serialize()
            
        }
        // OKボタンが押されたときの処理
        alertController.addAction(okaction)
        // CANCELボタンがタップされたときの処理
        let cancelButton = UIAlertAction(title: "CANCEL",style: UIAlertActionStyle.cancel, handler: nil)
        // CANCELボタンを追加
        alertController.addAction(cancelButton)
        // アラートダイアログを表示
        present(alertController, animated: true, completion: nil)
        // 画面リロード
        
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
