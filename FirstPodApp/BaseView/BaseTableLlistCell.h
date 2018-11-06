//
//  BaseTableLlistCell.h
//  BaseClass
//
//  Created by my y on 2018/10/24.
//  Copyright © 2018年 myy.company.com. All rights reserved.
//

#import "BaseTableCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableLlistCell : BaseTableCell

@property (nonatomic, strong) NSMutableArray<BaseTableModel *> *dataAry;

@property (nonatomic, strong) NSMutableDictionary<NSNumber *, NSNumber *> *cellHeightDic;

@property (nonatomic, copy) NSString *cellName;

@property (strong, nonatomic) UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
