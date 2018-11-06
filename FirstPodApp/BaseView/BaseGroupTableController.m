//
//  BaseGroupTableController.m
//  BaseClass
//
//  Created by my y on 2018/10/23.
//  Copyright © 2018年 myy.company.com. All rights reserved.
//

#import "BaseGroupTableController.h"
#import "BaseTableCell.h"
#import "BaseTableLlistCell.h"
#import "UIView+SDExtension.h"
#import "BaseCellStyle.h"
#import "BaseListCellModel.h"

/*适用于cell不相同的列表，也就是分组列表*/

@interface BaseGroupTableController ()

@property (nonatomic, strong) BaseCellStyle *style;

@end

@implementation BaseGroupTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.style = [[BaseCellStyle alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40.0;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.cellAry count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    BaseTableModel *model = [self.dataAry objectAtIndex:section];
    
    if ([model isKindOfClass:[BaseListCellModel class]]) {
        BaseListCellModel *listModel = (BaseListCellModel *)model;
        return [listModel.ary count];
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BaseTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[self.cellAry objectAtIndex:indexPath.section]];
    [self.style setStyleWithCell:cell];
    
    BaseTableModel *model = [self.dataAry objectAtIndex:indexPath.section];
    
    if ([model isKindOfClass:[BaseListCellModel class]]) {
        BaseListCellModel *listModel = (BaseListCellModel *)model;
        [cell setWithModel:[listModel.ary objectAtIndex:indexPath.section]];
    } else {
       [cell setWithModel:[self.dataAry objectAtIndex:indexPath.section]];
    }
    
    [self updateCellHeightWithHeight:[cell getHeight] indexPath:indexPath];
    return cell;
}


@end
