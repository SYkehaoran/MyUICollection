//
//  HXTableViewCell.m
//  HXFundManager
//
//  Created by 柯浩然 on 2019/7/31.
//  Copyright © 2019 China Asset Management Co., Ltd. All rights reserved.
//

#import "HXTableViewCell.h"

@interface HXTableViewCell ()

@property(nonatomic, strong) UIView *horizontalLine;
@property(nonatomic, strong) HXIndicatorView *indicatorView;

@end

@implementation HXTableViewCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupIndicatorView];
        [self addLine];
    }
    return self;
}

- (void)setShowSeparatorView:(BOOL)showSeparatorView {
    _showSeparatorView = showSeparatorView;
    self.horizontalLine.hidden = !showSeparatorView;
}

- (void)addLine {
    
    UIView *line = [[UIView alloc] init];
    self.horizontalLine = line;
    line.backgroundColor = FM_LINETWO_COLOR;
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);;
        make.height.mas_equalTo(HXUIHelper.pixelOne);
        make.leading.trailing.equalTo(@0);
    }];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect frame = self.contentView.frame;
    if (_showIndicatorView) {
        frame.size.width = self.width - 21;
    }
    self.contentView.frame = frame;
}

- (void)setShowIndicatorView:(BOOL)showIndicatorView {
    _showIndicatorView = showIndicatorView;
    self.indicatorView.hidden = !showIndicatorView;
}

- (void)setSeparatorViewInsets:(UIEdgeInsets)separatorViewInsets {
    _separatorViewInsets = separatorViewInsets;
    [self.horizontalLine mas_updateConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(separatorViewInsets.left);
        make.trailing.mas_equalTo(-separatorViewInsets.right);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupIndicatorView];
    [self addLine];
    // Initialization code
}

- (void)setAccessoryType:(UITableViewCellAccessoryType)accessoryType {
    
    if (accessoryType == UITableViewCellAccessoryDisclosureIndicator) {
        
        [self setShowIndicatorView:YES];
    }else {
        [self setShowIndicatorView:NO];
    }
}

- (void)setupIndicatorView {
    
    CGSize size = CGSizeMake(6, 9);
    HXIndicatorView *indicatorView = [[HXIndicatorView alloc] init];
    self.indicatorView = indicatorView;
    [indicatorView shaperLayer].strokeColor = UIColor.blackColor.CGColor;
    [self addSubview:indicatorView];
    [indicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(@-15);
        make.centerY.equalTo(@0);
        make.size.mas_equalTo(size);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
