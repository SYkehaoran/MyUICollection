//
//  HXTableViewCell.h
//  HXFundManager
//
//  Created by 柯浩然 on 2019/7/31.
//  Copyright © 2019 China Asset Management Co., Ltd. All rights reserved.
//
/*
 自定义底部一个像素粗细的线条，可以使用separatorViewInsets设置
 自定义右侧箭头指示器，使用shaperLayer绘制。目前大小为{6,9},可动态设置是否显示
 */
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HXTableViewCell : UITableViewCell
///默认0，0
@property(nonatomic, assign) UIEdgeInsets separatorViewInsets;
///底部横线
@property(nonatomic, assign) BOOL showSeparatorView;
///右边指示器
@property(nonatomic, assign) BOOL showIndicatorView;
@end

NS_ASSUME_NONNULL_END
