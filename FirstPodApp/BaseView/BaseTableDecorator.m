//
//  BaseTableDecorator.m
//  BaseClass
//
//  Created by my y on 2018/10/22.
//  Copyright © 2018年 myy.company.com. All rights reserved.
//

#import "BaseTableDecorator.h"

@implementation BaseTableDecorator

- (void)setTableStyle {
    self.tableController.tableView.backgroundColor = [UIColor redColor];
}


////uilabel+custom.m(UILabel的分类)
////自适应宽度和高度
//+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font
//{
//
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
//    label.text = title;
//    label.font = font;
//    label.numberOfLines = 0;
//    [label sizeToFit];
//    CGFloat height = label.frame.size.height;
//    return height;
//}
//
//+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font {
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];
//    label.text = title;
//    label.font = font;
//    [label sizeToFit];
//    return label.frame.size.width;
//}

@end
