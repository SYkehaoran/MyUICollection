//
//  HXPercentLabel.swift
//  HXFundManager
//
//  Created by 柯浩然 on 2019/7/25.
//  Copyright © 2019 China Asset Management Co., Ltd. All rights reserved.
//
/*
 显示百分比的自定义Label，
 1.支持添加“+”号
 2.支持根据内容改变字体颜色。正为红色。负为绿色
 */
import UIKit

class HXPercentLabel: UILabel {
    
    @objc var shouldPlusPrefix = false
    @objc func setAmountText(_ amountText:String?) {
        
        guard let text = amountText else {
            return;
        }
        
        setAmountAttributedText(NSAttributedString(string: text))
    }
    
   fileprivate func setAmountAttributedText(_ attributedText:NSAttributedString?) {
        
        guard var attText = attributedText else {
            return;
        }
        
        if shouldPlusPrefix && !isTextMinus(attText.string) && attText.string.hasSuffix("%")  {
            
            attText = NSAttributedString(string: "+\(attText.string)")
        }
        
        self.attributedText = attText
        
        setTextColor(text: attText.string)
    }
    
    fileprivate func isTextMinus(_ text:String)->Bool {
        
        if text != "--" && text.hasPrefix("-") {
            return true
        }
        return false
    }
    
    fileprivate func setTextColor(text:String) {
        
        if text == "--" {
            self.textColor = UIColor.black
            return
        }
        
        if isTextMinus(text) {
            self.textColor = UIColor.blue
            return;
        }
        
        self.textColor = UIColor.red
    }
}
