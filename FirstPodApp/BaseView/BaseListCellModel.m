//
//  ListModel.m
//  BaseClass
//
//  Created by my y on 2018/10/24.
//  Copyright © 2018年 myy.company.com. All rights reserved.
//

#import "BaseListCellModel.h"

@interface BaseListCellModel()

@end

@implementation BaseListCellModel

- (id)initWithAry:(NSMutableArray <BaseTableModel *>*)ary {
    if (self = [super init]) {
        self.ary = ary;
    }
    return self;
}

@end
