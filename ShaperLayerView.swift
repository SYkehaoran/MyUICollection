//
//  ShaperLayerView.swift
//
//  Created by 柯浩然 on 2019/7/31.
//
/*
 把shaperLayer做为寄宿图层的View。
 1.可以支持不同角度的圆角。系统可以在iOS11之后使用layer.maskedCorners支持
 2.用shaperLayer画图性能更高
 3.可以解决部分圆形视图不够圆润的问题
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
        
        if let array = cornerRadiusArray {
            
            let roundPath = UIBezierPath(roundedRect: rect, cornerRadiusArray: array, lineWidth: 0)
            
            shaperLayer().path = roundPath?.cgPath
        }else if shaperLayer().cornerRadius != 0 {
            let roundPath = UIBezierPath(roundedRect: rect, cornerRadius: shaperLayer().cornerRadius)
            shaperLayer().path = roundPath.cgPath
        }
    }
}
