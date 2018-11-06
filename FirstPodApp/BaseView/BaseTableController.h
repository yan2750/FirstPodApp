//
//  BaseTableController.h
//  BaseClass
//
//  Created by my y on 2018/10/22.
//  Copyright © 2018年 myy.company.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class BaseTableModel;

@interface BaseTableController : UIViewController

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<BaseTableModel *> *dataAry;
@property (nonatomic, copy) NSArray<NSString *> *cellAry;
@property (nonatomic, strong) NSMutableDictionary<NSNumber *, NSNumber *> *cellHeightDic;
@property (nonatomic, assign) int pageFlag;

- (void)addHeader;

- (void)addFotter;

/**
 获取数据
 */
- (void)getData;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)updateCellHeightWithHeight:(CGFloat)height indexPath:(NSIndexPath *)indexPath;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

//- (void)setVCTitle:(NSString *)title;


@end

NS_ASSUME_NONNULL_END
