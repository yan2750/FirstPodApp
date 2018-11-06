//
//  BaseCellStyle.m
//  BaseClass
//
//  Created by my y on 2018/10/25.
//  Copyright © 2018年 myy.company.com. All rights reserved.
//

#import "BaseCellStyle.h"
#import "UIView+Layout.h"
#import "BaseTableCell.h"
#import <Masonry.h>

@implementation BaseCellStyle

- (void)setStyleWithCell:(BaseTableCell *)cell {
    [cell.bgView addShadow];
    [cell.contentView addCorner];
    
}

@end
