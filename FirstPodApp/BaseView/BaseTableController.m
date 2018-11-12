//
//  BaseTableController.m
//  BaseClass
//
//  Created by my y on 2018/10/22.
//  Copyright © 2018年 myy.company.com. All rights reserved.
//

#import "BaseTableController.h"

#import "MJRefresh.h"

#import "BaseTableModel.h"
#import "UIResponder+YMM_LoadFromNib.h"
#import "BaseNavStyle.h"
#import "PrefixHeader.pch"

const NSString *cellPrefix = @"cell";

@interface BaseTableController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) BaseNavStyle *navStyle;

@end

@implementation BaseTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageFlag = 1;
    self.dataAry = [[NSMutableArray alloc] init];
    self.cellHeightDic = [NSMutableDictionary dictionary];
    
    [self tableView];
    // header、footer默认添加
    [self addHeader];
    [self addFotter];
    
    [self setNavStyle];
}

// 设置导航栏的样式
- (void)setNavStyle {
    self.navStyle = [[BaseNavStyle alloc] initWithVC:self];
}

// 子视图已经布局完成调用的方法
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.navStyle setNormalStyle];
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
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self reRefresh];
    }];
    
    [self.tableView.mj_header beginRefreshing];
}

- (void)addFotter {
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        self.pageFlag += 1;
        [self getData];
        [self.tableView.mj_footer endRefreshing];
    }];
}

- (void)reRefresh {
    self.pageFlag = 1;
    [self.cellHeightDic removeAllObjects];
    [self.dataAry removeAllObjects];
    
    [self getData];
    [self.tableView.mj_header endRefreshing];
}

- (void)getData {
    
}

- (UITableView *)tableView {
    if (!_tableView) {
        
        CGRect frame = CGRectMake(0, kNavigationAndStatusBarHeight, kScreenWidth, kScreenHeight - kNavigationAndStatusBarHeight);
        self.tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.separatorColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 50;
        _tableView.backgroundColor = [UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1.0];
        
        //_tableView.backgroundColor = [UIColor redColor];
        [self.view addSubview:_tableView];
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
    return 0.001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] init];
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

//- (void)setVCTitle:(NSString *)title {
//    self.navStyle.lmj_navgationBar.title = [[NSMutableAttributedString alloc] initWithString:title];
//}

@end
