//
//  BaseTableView.m
//  BaseClass
//
//  Created by my y on 2018/10/30.
//  Copyright © 2018年 myy.company.com. All rights reserved.
//

#import "BaseTableView.h"
#import "UIResponder+YMM_LoadFromNib.h"
#import "MJRefresh.h"
#import "PrefixHeader.pch"

//#define kScreenWidth         ([UIScreen mainScreen].bounds.size.width)
//#define kScreenHeight        ([UIScreen mainScreen].bounds.size.height)
//#define kIsIphoneX           ((kScreenWidth == 320 && kScreenHeight == 568) ? true : false)
//#define kStatusBarHeight     (kIsIphoneX ? 44 : 20)
//#define kNavigationHeight    44
//#define kNavigationAndStatusBarHeight  (kStatusBarHeight + kNavigationHeight)

@interface BaseTableView() <UITableViewDelegate, UITableViewDataSource>

@end

@implementation BaseTableView

- (id)init {
    if (self = [super init]) {
        [self tableView];
    }
    return self;
}

- (void)setCellAry:(NSArray<NSString *> *)cellAry {
    if (_cellAry != cellAry) {
        _cellAry = cellAry;
        
        for (NSString *nibName in _cellAry) {
            [self.tableView registerNib:[self getNibFromName:nibName] forCellReuseIdentifier:nibName];
        }
    }
}

- (void)addHeader {
    self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        [self reRefresh];
    }];
}

- (void)addFotter {
    self.tableView.mj_footer = [MJRefreshFooter footerWithRefreshingBlock:^{
        self.pageFlag += 1;
        [self getData];
    }];
}

- (void)reRefresh {
    self.pageFlag = 1;
    [self.cellHeightDic removeAllObjects];
    [self.dataAry removeAllObjects];
}

- (void)getData {
    
}

- (UITableView *)tableView {
    if (!_tableView) {
        CGRect frame = CGRectMake(0, kNavigationAndStatusBarHeight, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        self.tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        self.tableView.frame = self.bounds;
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
        _tableView.separatorColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 50;
        _tableView.backgroundColor = [UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1.0];
        [self addSubview:_tableView];
    }
    return _tableView;
}

#pragma TableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = [self getHeightWithIndexPath:indexPath];
    NSLog(@"----列表的高度 = %f",height);
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

#pragma TableView Datasource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[UITableViewCell alloc] init];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (void)updateCellHeightWithHeight:(CGFloat)height indexPath:(NSIndexPath *)indexPath {
    NSNumber *tag = [self getTagWithIndexPath:indexPath];
    [self.cellHeightDic setObject:[NSNumber numberWithFloat:height] forKey:tag];
}

- (CGFloat)getHeightWithIndexPath:(NSIndexPath *)indexPath {
    NSNumber *tag = [self getTagWithIndexPath:indexPath];
    NSNumber *height = [self.cellHeightDic objectForKey:tag];
    return height.floatValue;
}

- (NSNumber *)getTagWithIndexPath:(NSIndexPath *)indexPath {
    NSInteger tag = indexPath.row + 100 * indexPath.section;
    return [NSNumber numberWithInteger:tag];
}

@end
