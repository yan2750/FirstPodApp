//
//  UIView+Layout.m
//  BaseClass
//
//  Created by my y on 2018/10/25.
//  Copyright © 2018年 myy.company.com. All rights reserved.
//

#import "UIView+Layout.h"

@implementation UIView (Layout)

- (void)addShadow {
    self.layer.masksToBounds = NO;
    self.layer.shadowColor = [UIColor blackColor].CGColor;//阴影颜色
    self.layer.shadowOffset = CGSizeMake(10, 10);//偏移距离
    self.layer.shadowOpacity = 0.5;//不透明度
    self.layer.shadowRadius = 5.0;//半径
    self.layer.cornerRadius = 10;

}

- (void)addCorner {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:UIRectCornerAllCorners
                                                         cornerRadii:CGSizeMake(5, 5)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    self.layer.masksToBounds = YES;
}

@end
