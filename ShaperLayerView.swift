//
//  ShaperLayerView.swift
//
//  Created by 柯浩然 on 2019/7/31.
//
/*
 把shaperLayer做为寄宿图层的View
 1.用shaperLayer画图性能更高
 2.可以解决部分圆形视图不够圆润的问题
 */
import UIKit

class ShaperLayerView: UIView {
    
    @objc var cornerRadiusArray : [NSNumber]?
    
    @objc func shaperLayer() -> CAShapeLayer {
        let layer = self.layer as! CAShapeLayer
        
        return layer
    }
    
    override public class var layerClass: Swift.AnyClass {
        
        get {
            return CAShapeLayer.self
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        if shaperLayer().cornerRadius != 0 {
            let roundPath = UIBezierPath(roundedRect: rect, cornerRadius: shaperLayer().cornerRadius)
            shaperLayer().path = roundPath.cgPath
        }
    }
}
