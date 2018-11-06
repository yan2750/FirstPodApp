//
//  BaseCellStyle.h
//  BaseClass
//
//  Created by my y on 2018/10/25.
//  Copyright © 2018年 myy.company.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class BaseTableCell;
NS_ASSUME_NONNULL_BEGIN

@interface BaseCellStyle : NSObject

- (void)setStyleWithCell:(BaseTableCell *)cell;

@end

NS_ASSUME_NONNULL_END
