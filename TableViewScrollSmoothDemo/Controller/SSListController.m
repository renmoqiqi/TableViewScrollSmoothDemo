//
//  SSListController.m
//  TableViewScrollSmoothDemo
//
//  Created by penghe on 2018/1/12.
//  Copyright © 2016年 WondersEducation. All rights reserved.
//

#import "SSListController.h"

#pragma mark - Import Controllers

#pragma mark - Import Views
#import "SSListCell.h"
#pragma mark - Import Models

#pragma mark - Import Other Libraries

static NSString *const SSListCellIndentifer = @"SSListCellIndentifer";

#pragma mark - Constants Define

@interface SSListController ()

@end

@implementation SSListController
{

}

#pragma mark - Properties Getter And Setter

#pragma mark - Controller Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

}

- (void)dealloc
{

}

#pragma mark - Setup

#pragma mark - Server Communication (Fetch Data)

#pragma mark - Actions

#pragma mark - Notification

#pragma mark - KVO

#pragma mark - Delegate And DataSource Protocol

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SSListCell *listCell = [tableView dequeueReusableCellWithIdentifier:SSListCellIndentifer forIndexPath:indexPath];
    return listCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

@end
