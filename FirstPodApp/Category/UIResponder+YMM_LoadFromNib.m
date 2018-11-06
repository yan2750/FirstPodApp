//
//  UIResponder+YMM_LoadFromNib.m
//  BaseClass
//
//  Created by my y on 2018/10/24.
//  Copyright © 2018年 myy.company.com. All rights reserved.
//

#import "UIResponder+YMM_LoadFromNib.h"

@implementation UIResponder (YMM_LoadFromNib)

- (UINib *)getNibFromName:(NSString *)name {
    if ([self isExistNibWithName:name]) {
        return [self getNibWithName:name];
    } else {
        UINib *superNib = [self getNibFromSuperviewWithName:name];
        if (superNib) {
            return superNib;
        } else {
            return [[self class] init];
        }
    }
}

- (UINib *)getNibFromSuperviewWithName:(NSString *)name {
    Class superClass;
    Class class = NSClassFromString(name);
    
    while (![superClass isKindOfClass:[UIResponder class]]) {
        Class superClass = [class superclass];
        NSString *superName = NSStringFromClass(superClass);
        if ([self isExistNibWithName:superName]) {
            return [self getNibWithName:superName];
        }
    }
    
    return  nil;
}

- (UINib *)getNibWithName:(NSString *)name {
    UINib *nib = [UINib nibWithNibName:name bundle:nil];
    return nib;
}

- (BOOL)isExistNibWithName:(NSString *)name {
   return [[NSBundle mainBundle] pathForResource:name ofType:@"nib"] != nil;
}

@end
