//
//  UIResponder+YMM_LoadFromNib.h
//  BaseClass
//
//  Created by my y on 2018/10/24.
//  Copyright © 2018年 myy.company.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIResponder (YMM_LoadFromNib)

- (UINib *)getNibFromName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
