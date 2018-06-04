//
//  ViewController.swift
//  CalculatorApp
//
//  Created by TakumaNishioka on 2018/06/04.
//  Copyright © 2018年 TakumaNishioka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textbox: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 起動時の初期化
        textbox.text = ""
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 1〜9,0までのボタンの動作
    @IBAction func tap1Button(_ sender: Any) {
        guard let value = textbox.text else {
            return
        }
        textbox.text = value + "1"
    }
    @IBAction func tap2Button(_ sender: Any) {
        guard let value = textbox.text else {
            return
        }
        textbox.text = value + "2"
    }
    @IBAction func tap3Button(_ sender: Any) {
        guard let value = textbox.text else {
            return
        }
        textbox.text = value + "3"
    }
    @IBAction func tap4Button(_ sender: Any) {
        guard let value = textbox.text else {
            return
        }
        textbox.text = value + "4"
    }
    @IBAction func tap5Button(_ sender: Any) {
        guard let value = textbox.text else {
            return
        }
        textbox.text = value + "5"
    }
    @IBAction func tap6Button(_ sender: Any) {
        guard let value = textbox.text else {
            return
        }
        textbox.text = value + "6"
    }
    @IBAction func tap7Button(_ sender: Any) {
        guard let value = textbox.text else {
            return
        }
        textbox.text = value + "7"
    }
    @IBAction func tap8Button(_ sender: Any) {
        guard let value = textbox.text else {
            return
        }
        textbox.text = value + "8"
    }
    @IBAction func tap9Button(_ sender: Any) {
        guard let value = textbox.text else {
            return
        }
        textbox.text = value + "9"
    }
    @IBAction func tap0Button(_ sender: Any) {
        guard let value = textbox.text else {
            return
        }
        textbox.text = value + "0"
    }
    //+-×÷の入力
    @IBAction func tapAddButton(_ sender: Any) {
        guard let value = textbox.text else {
            return
        }
        textbox.text = value + "+"
    }
    @IBAction func tapSubButton(_ sender: Any) {
        guard let value = textbox.text else {
            return
        }
        textbox.text = value + "-"
    }
    @IBAction func tapMultiButton(_ sender: Any) {
        guard let value = textbox.text else {
            return
        }
        textbox.text = value + "*"
    }
    @IBAction func tapDivButton(_ sender: Any) {
        guard let value = textbox.text else {
            return
        }
        textbox.text = value + "/"
    }
    //以下未実装
    // .を入れるときは数字のときしかだめまた
    @IBAction func tapCommaButton(_ sender: Any) {
        guard let value = textbox.text else {
            return
        }
    }
    // Clearボタンの処理
    @IBAction func tapClearButton(_ sender: Any) {
        textbox.text = ""
    }
    // (ボタンの処理
    @IBAction func tapLeftParenthButton(_ sender: Any) {
        guard let value = textbox.text else {
            return
        }
        textbox.text = value + "("
    }
    // )ボタンの処理
    @IBAction func tapRightParenthButton(_ sender: Any) {
        guard let value = textbox.text else {
            return
        }
        textbox.text = value + ")"
    }
    // Taxボタンの処理
    @IBAction func tapTaxButton(_ sender: Any) {
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

