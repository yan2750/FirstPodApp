//
//  BasePlaneTableController.m
//  BaseClass
//
//  Created by my y on 2018/10/23.
//  Copyright © 2018年 myy.company.com. All rights reserved.
//

#import "BasePlaneTableController.h"
#import "BaseTableCell.h"
#import "BaseCellStyle.h"
#import "BaseHeaderView.h"

/*适用于cell相同的列表*/

@interface BasePlaneTableController ()

@property (nonatomic, strong) BaseCellStyle *style;

@end

@implementation BasePlaneTableController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.style = [[BaseCellStyle alloc] init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataAry count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BaseTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[self.cellAry objectAtIndex:0]];
    // [self.style setStyleWithCell:cell];
    [cell setWithModel:[self.dataAry objectAtIndex:indexPath.row]];
    [self updateCellHeightWithHeight:[cell getHeight] indexPath:indexPath];
    return cell;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[BaseHeaderView alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}


@end
