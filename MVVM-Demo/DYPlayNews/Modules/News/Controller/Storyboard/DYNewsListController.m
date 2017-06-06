//
//  DYNewsListController.m
//  DYPlayNews
//
//  Created by 袁斌 on 2017/6/1.
//  Copyright © 2017年 https://github.com/DefaultYuan All rights reserved.
//

#import "DYNewsListController.h"
#import "DYNewsListCell.h"
#import "DYNewListImageCell.h"
#import "DYNewsViewModel.h"
#import "MJRefreshGifHeader+DYY.h"

@interface DYNewsListController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation DYNewsListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DYNewsViewModel *viewModel = [[DYNewsViewModel alloc] init];
    viewModel.topId = self.topId;
    self.viewModel = viewModel;
    
    [self initTableView];
    [self prepareLoadData];

}
- (void) initTableView
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
        
        if ([(NSObject *)cellClass respondsToSelector:@selector(heightForViewModel:)]) {
            return [cellClass heightForViewModel:cellModel];
        }
    }
    return 0;
}


@end
