//
//  taxData.swift
//  CalculatorApp
//
//  Created by TakumaNishioka on 2018/06/06.
//  Copyright © 2018年 TakumaNishioka. All rights reserved.
//

import Foundation
class taxData: NSObject, NSCoding  {
    
    var taxTableName: String?
    var taxPercent: Int?
    // 電卓のTAXボタンを押して使われる数字の設定
    var taxActive: Bool?
    // 自分で設定したもの以外はfalse
    // falseは削除できないようにする
    var taxCustom: Bool?
    
    override init() {
    }
    required init?(coder aDecoder: NSCoder){
        taxTableName = (aDecoder.decodeObject(forKey: "taxTableName") as! String)
        taxPercent = (aDecoder.decodeObject(forKey: "taxPercent") as! Int)
        taxActive = (aDecoder.decodeObject(forKey: "taxActive") as! Bool)
        taxCustom = (aDecoder.decodeObject(forKey: "taxCustom") as! Bool)
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(taxTableName, forKey: "taxTableName")
        aCoder.encode(taxPercent, forKey: "taxPercent")
        aCoder.encode(taxActive, forKey: "taxActive")
        aCoder.encode(taxCustom, forKey: "taxCustom")
    }
}
