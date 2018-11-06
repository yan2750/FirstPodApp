//
//  BaseNavStyle.h
//  LPLeeksProProject
//
//  Created by my y on 2018/11/2.
//  Copyright © 2018年 pangyunlei. All rights reserved.
//

#import <Foundation/Foundation.h>


@class LMJNavigationBar;
NS_ASSUME_NONNULL_BEGIN


@interface BaseNavStyle : UIResponder

@property (weak, nonatomic) LMJNavigationBar *lmj_navgationBar;

- (NSMutableAttributedString *)changeTitle:(NSString *)curTitle;

- (id)initWithVC:(UIViewController *)vc;

- (void)setNormalStyle;

@end

NS_ASSUME_NONNULL_END
