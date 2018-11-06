//
//  BaseTableView.h
//  BaseClass
//
//  Created by my y on 2018/10/30.
//  Copyright © 2018年 myy.company.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BaseTableModel;
NS_ASSUME_NONNULL_BEGIN

@interface BaseTableView : UIView

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<BaseTableModel *> *dataAry;
@property (nonatomic, copy) NSArray<NSString *> *cellAry;
@property (nonatomic, strong) NSMutableDictionary<NSNumber *, NSNumber *> *cellHeightDic;
@property (nonatomic, assign) int pageFlag;


@end

NS_ASSUME_NONNULL_END
