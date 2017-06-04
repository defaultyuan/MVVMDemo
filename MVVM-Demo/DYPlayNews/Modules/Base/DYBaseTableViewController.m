//
//  DYBaseTableViewController.m
//  DYPlayNews
//
//  Created by 袁斌 on 2017/6/2.
//  Copyright © 2017年 https://github.com/DefaultYuan All rights reserved.
//

#import "DYBaseTableViewController.h"
#import "MJRefreshGifHeader+DYY.h"

@interface DYBaseTableViewController ()

@end

@implementation DYBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self initTableView];
}

//- (void) initTableView
//{
//    MJRefreshGifHeader *header = [MJRefreshGifHeader DYHeaderWithRefreshingBlock:^{
//        [self prepareLoadData];
//    }];
//    self.tableView.mj_header = header;
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
//}
//
- (void)prepareLoadData {}
//- (UITableView *)tableView
//{
//    return nil;
//}

#pragma mark - UITableView Delegate & DataSource

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return 0;
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    return cell;
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView dequeueReusableCellforIndexPath:(NSIndexPath *)indexPath
//{ return nil; }

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
