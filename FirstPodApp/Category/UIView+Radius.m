//
//  UIView+Radius.m
//  UIImageDemo
//
//  Created by my y on 2018/10/30.
//  Copyright © 2018年 myy.company.com. All rights reserved.
//

#import "UIView+Radius.h"

@implementation UIView (Radius)

- (UIImage *)ymm_imageWithSize:(CGSize)size drawBlock:(void (^) (CGContextRef context))drawBlock {
    if(! drawBlock) return nil;
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    // 将context推到栈里面
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (!context) { return nil; }
    
    drawBlock(context);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)ymm_maskRoundCornerRadiusImageWithColor:(UIColor *)color
                                         cornerRadii:(CGSize)cornerRadii
                                                size:(CGSize)size
                                             corners:(UIRectCorner)corners
                                         borderColor:(UIColor *)borderColor
                                         borderWidth:(CGFloat)borderWidth {
    return [self ymm_imageWithSize:size drawBlock:^(CGContextRef context) {
        CGContextSetLineWidth(context, 0);
        [color set];
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        // 画一个闭合的矩形。
        UIBezierPath *rectPath = [UIBezierPath bezierPathWithRect:CGRectInset(rect, -0.3, -0.3)];
        UIBezierPath *roundPath = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(rect, 0.3, 0.3)
                                                        byRoundingCorners:corners
                                                              cornerRadii:cornerRadii];
        [rectPath appendPath:roundPath];
        CGContextAddPath(context, rectPath.CGPath);
        CGContextEOFillPath(context);
        
        if (!borderColor || !borderWidth) {
            return ;
        }
        
        UIBezierPath *borderOutterPath = [UIBezierPath bezierPathWithRoundedRect:rect
                                                               byRoundingCorners:corners
                                                                     cornerRadii:cornerRadii];
        UIBezierPath *borderInnerPath = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(rect, borderWidth, borderWidth)
                                                              byRoundingCorners:corners cornerRadii:cornerRadii];
        [borderOutterPath appendPath:borderInnerPath];
        CGContextAddPath(context, borderOutterPath.CGPath);
        CGContextEOFillPath(context);
    }];
}

@end
