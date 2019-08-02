  
 - *ShaperLayerView*
    重写类方法layerClass， 把shaperLayer做为View的寄宿图层。
 1.可以支持不同角度的圆角。系统可以在iOS11之后使用layer.maskedCorners支持
 2.用shaperLayer画图性能更高
 3.可以解决部分圆形视图不够圆润的问题
 
- *HXIndicator*  继承ShaperLayerView，根据宽高自定义右侧的箭头指示器。

- *HXTableViewCell* 
  自定义底部一个像素粗细的线条，可以使用separatorViewInsets设置
  自定义右侧箭头指示器，使用shaperLayer绘制。目前大小为{6,9},可动态设置是否显示

- *HXPercentLabel* 显示百分比的自定义Label
 1.支持添加“+”号
 2.支持根据内容改变字体颜色。正为红色。负为绿色

