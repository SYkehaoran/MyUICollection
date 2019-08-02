//
//  HXIndicatorView.swift
//  HXFundManager
//
//  Created by 柯浩然 on 2019/7/31.
//  Copyright © 2019 China Asset Management Co., Ltd. All rights reserved.
//
/*
 继承ShaperLayerView，根据宽高自定义右侧的箭头指示器。
 */
import UIKit

class HXIndicatorView: ShaperLayerView {
    
    override func draw(_ rect: CGRect) {
        
        let size = rect.size;
        shaperLayer().lineWidth = 1;
        shaperLayer().fillColor = UIColor.clear.cgColor;
        shaperLayer().lineCap = kCALineCapRound
        
        let path = UIBezierPath.init()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0 + size.width, y: size.height/2))
        path.addLine(to: CGPoint(x: 0, y: size.height))
        shaperLayer().path = path.cgPath;
    }
}
