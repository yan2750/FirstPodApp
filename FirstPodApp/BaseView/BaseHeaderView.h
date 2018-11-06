//
//  BaseHeaderView.h
//  LPLeeksProProject
//
//  Created by my y on 2018/11/2.
//  Copyright © 2018年 pangyunlei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseHeaderView : UIView

@property (nonatomic, weak) id delegate;

- (CGFloat)getHeight;

@end

NS_ASSUME_NONNULL_END
