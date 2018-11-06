//
//  UIView+Radius.h
//  UIImageDemo
//
//  Created by my y on 2018/10/30.
//  Copyright © 2018年 myy.company.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Radius)

- (UIImage *)ymm_imageWithSize:(CGSize)size drawBlock:(void (^) (CGContextRef context))drawBlock;



- (UIImage *)ymm_maskRoundCornerRadiusImageWithColor:(UIColor *)color
                                         cornerRadii:(CGSize)cornerRadii
                                                size:(CGSize)size
                                             corners:(UIRectCorner)corners
                                         borderColor:(UIColor *)borderColor
                                         borderWidth:(CGFloat)borderWidth;

@end

NS_ASSUME_NONNULL_END
