//
//  UILabel+Size.m
//  BaseClass
//
//  Created by my y on 2018/10/23.
//  Copyright © 2018年 myy.company.com. All rights reserved.
//

#import "UILabel+Size.h"

#define kScreenWidth         ([UIScreen mainScreen].bounds.size.width)

@implementation UILabel (Size)

- (float)ymm_getHeight {
    NSDictionary *attribute = @{NSFontAttributeName: self.font};
    CGRect rect = [self.text boundingRectWithSize:CGSizeMake(kScreenWidth - 20, MAXFLOAT)
                            options:NSStringDrawingUsesLineFragmentOrigin
                         attributes:attribute
                            context:nil];
    return rect.size.height;
}

@end
