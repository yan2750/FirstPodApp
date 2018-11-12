//
//  BaseTableLlistCell.m
//  BaseClass
//
//  Created by my y on 2018/10/24.
//  Copyright © 2018年 myy.company.com. All rights reserved.
//

#import "BaseTableLlistCell.h"
#import "BaseTableCell.h"
#import "BaseListCellModel.h"
#import "UIResponder+YMM_LoadFromNib.h"
#import "UIView+SDExtension.h"
#import "Masonry.h"
#import "PrefixHeader_pch.h"

@interface BaseTableLlistCell() <UITableViewDataSource, UITableViewDelegate>

@end

@implementation BaseTableLlistCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.cellHeightDic = [NSMutableDictionary dictionary];
    [self tableView];
}

- (void)setWithModel:(BaseTableModel *)model {
    [super setWithModel:model];
    
    if ([model isKindOfClass:[BaseListCellModel class]]) {
        BaseListCellModel *listModel = (BaseListCellModel *)model;
        self.dataAry = listModel.ary;
    }
}

- (UITableView *)tableView {
    if (!_tableView) {
        self.tableView = [[UITableView alloc] initWithFrame:self.bounds
                                                      style:UITableViewStylePlain];
        [self.contentView addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    return _tableView;
}

- (void)setCellName:(NSString *)cellName {
    if (_cellName != cellName) {
        _cellName = cellName;
        
        [self.tableView registerNib:[self getNibFromName:cellName] forCellReuseIdentifier:cellName];
    }
}

#pragma TableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = [self getHeightWithIndexPath:indexPath];
    NSLog(@"====内部 cell的高度 = %f",height);
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
    BaseTableCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellName];
    [cell setWithModel:[self.dataAry objectAtIndex:indexPath.row]];
    [self updateCellHeightWithHeight:[cell getHeight] indexPath:indexPath];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataAry count];
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

- (CGFloat)getHeight {
    __block CGFloat totalHeight = 0;
    [self.cellHeightDic enumerateKeysAndObjectsUsingBlock:^(NSNumber * _Nonnull key, NSNumber * _Nonnull obj, BOOL * _Nonnull stop) {
        totalHeight += [obj floatValue];
    }];
    
    
    NSLog(@"内部的cell的高度 = %@",self.cellHeightDic);
    return totalHeight;
}

@end
