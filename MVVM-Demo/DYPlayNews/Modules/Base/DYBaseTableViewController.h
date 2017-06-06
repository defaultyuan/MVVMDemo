//
//  DYBaseTableViewController.h
//  DYPlayNews
//
//  Created by 袁斌 on 2017/6/2.
//  Copyright © 2017年 https://github.com/DefaultYuan All rights reserved.
//

#import "DYBaseViewController.h"
#import "DYBaseCell.h"
#import "DYBaseViewModel.h"
#import "DYTableViewProtocol.h"

@interface DYBaseTableViewController : DYBaseViewController

- (void) prepareLoadData;
@property (nonatomic, strong, readwrite) DYBaseViewModel<DYViewModelProtocol> *viewModel;
@end
