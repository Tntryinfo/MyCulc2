//
//  ViewController.swift
//  CalculatorApp
//
//  Created by TakumaNishioka on 2018/06/04.
//  Copyright © 2018年 TakumaNishioka. All rights reserved.
//

import UIKit
import Expression

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
    @IBAction func tapCommaButton(_ sender: Any) {
        guard let value = textbox.text else {
            return
        }
        textbox.text = value + "."
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
    // =ボタンの処理
    @IBAction func tapEqualButton(_ sender: Any) {
        guard let formulaText = textbox.text else {
            return
        }
        let formula:String = formatFormula(formulaText)
        textbox.text = evalFormula(formula)
    }
    
    
    // Taxボタンの処理
    @IBAction func tapTaxButton(_ sender: Any) {
        guard let formulaText = textbox.text else {
            return
        }
        let  formula:String = formatFormula(formulaText)
        if formula == "式を正しく入力してください" {
            // 式が間違っているため何もしない
        }
        else {
            let doubleformula: Double = NSString(string: formula).doubleValue
            print(doubleformula)
            let formulaAddTax: String = NSString(format: "%.2f",doubleformula * 1.08) as String
            print(formulaAddTax)
            textbox.text = evalFormula(formulaAddTax)
        }
    }
    
    private func formatFormula (_ formula: String) -> String {
        // 入力された整数には「.0」を追加して少数として評価する
        let formattedFormula: String = formula.replacingOccurrences(
            of: "(?<=^|[÷×\\+\\-\\(])([0-9]+)(?=[÷×\\+\\-\\)]|$)",
            with: "$1.0",
            options: NSString.CompareOptions.regularExpression,
            range: nil
            )
        return formattedFormula
    }
    private func evalFormula (_ formula: String) -> String {
        do {
            // Expressionで文字列を計算式を評価して答えを求める
            let expression = Expression (formula)
            let answer = try expression.evaluate()
            return formatAnswer(String(answer))
        }
        catch {
            // 計算式が不当
            return "式を正しく入力してください"
        }
    }
    private func formatAnswer (_ answer: String) -> String {
        // 答えの少数点以下が「.0」だった場合は、「.0」を削除する
        let formattedAnswer: String = answer.replacingOccurrences(of: "\\.0$", with: "", options: NSString.CompareOptions.regularExpression,range:nil)
        return formattedAnswer
    }
}

