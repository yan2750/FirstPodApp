//
//  BaseTableCell.m
//  BaseClass
//
//  Created by my y on 2018/10/23.
//  Copyright © 2018年 myy.company.com. All rights reserved.
//

#import "BaseTableCell.h"
#import "BaseListCellModel.h"
#import <Masonry.h>
#import "UIView+Layout.h"

@interface BaseTableCell()

@end

@implementation BaseTableCell


- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addShadow];
    [self.bgView addCorner];
    self.contentView.backgroundColor = [UIColor whiteColor];
}

- (UIView *)bgView {
    if (!_bgView) {
        self.bgView = [[UIView alloc] initWithFrame:self.bounds];
        self.bgView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_bgView];
        [self.contentView sendSubviewToBack:_bgView];
        
        UIEdgeInsets padding = UIEdgeInsetsMake(0, 0, 0, 0);
        [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).with.insets(padding);
        }];
       
        
    }
    return _bgView;
}


- (void)setWithModel:(BaseTableModel *)model {
    self.model = model;
}

- (CGFloat)getHeight {
    return 0;
}

@end
