//
//  DYNewsListController.m
//  DYPlayNews
//
//  Created by 袁斌 on 2017/6/1.
//  Copyright © 2017年 https://github.com/DefaultYuan All rights reserved.
//

#import "DYNewsListController.h"
#import "DYNewsViewModel.h"

@interface DYNewsListController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation DYNewsListController

- (void)viewDidLoad {
    
    DYNewsViewModel *viewModel = [[DYNewsViewModel alloc] init];
    viewModel.topId = self.topId;
    self.viewModel = viewModel;
    
    [super viewDidLoad];
}

@end
