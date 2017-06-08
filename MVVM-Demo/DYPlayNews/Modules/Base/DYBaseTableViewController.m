//
//  DYBaseTableViewController.m
//  DYPlayNews
//
//  Created by 袁斌 on 2017/6/2.
//  Copyright © 2017年 https://github.com/DefaultYuan All rights reserved.
//

#import "DYBaseTableViewController.h"
#import "MJRefreshGifHeader+DYY.h"
#import "DYBaseViewModel.h"

@interface DYBaseTableViewController ()<UITableViewDelegate, UITableViewDataSource, DYTableViewProtocol>

@end

@implementation DYBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addRefreshView];
    [self prepareLoadData];
}
#pragma mark - Init
- (void) addRefreshView
{
    MJRefreshGifHeader *header = [MJRefreshGifHeader DYHeaderWithRefreshingBlock:^{
        [self prepareLoadData];
    }];
    self.tableView.mj_header = header;
}
- (void)prepareLoadData
{
    [[self.viewModel.fetchDataCommand execute:nil] subscribeNext:^(id x) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
        });
        
    }];
}

#pragma mark - DYTableViewProtocol
- (UITableView *)tableView { return nil; }

#pragma mark - UITableView Delegate & DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<DYCellRenderProtocol> cellModel = self.viewModel.dataSource[indexPath.row];
    
    NSString *cellIdentifier;
    UITableViewCell<DYCellProtocol> *cell;
    
    if ([cellModel respondsToSelector:@selector(cellIdentifier)])
    {
        cellIdentifier = [cellModel cellIdentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        [cell bindViewModel:cellModel];
    }
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<DYCellRenderProtocol> cellModel = self.viewModel.dataSource[indexPath.row];
    
    if ([cellModel respondsToSelector:@selector(cellIdentifier)]) {
        NSString *cellClassStr = [cellModel cellIdentifier];
        Class<DYCellProtocol> cellClass = NSClassFromString(cellClassStr);
        
        if ([(NSObject *)cellClass respondsToSelector:@selector(sizeForViewModel:constrainedToSize:)]) {
            return [cellClass sizeForViewModel:cellModel
                             constrainedToSize:tableView.frame.size].height;
        }
    }
    return 0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
