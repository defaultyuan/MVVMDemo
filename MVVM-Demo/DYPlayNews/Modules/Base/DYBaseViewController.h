//
//  DYBaseViewController.h
//  DYPlayNews
//
//  Created by 袁斌 on 2017/5/25.
//  Copyright © 2017年 https://github.com/DefaultYuan All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYBaseViewModel.h"
#import "DYTableViewProtocol.h"

@interface DYBaseViewController : UIViewController

- (void) prepareLoadData;
@property (nonatomic, strong, readwrite) DYBaseViewModel<DYViewModelProtocol> *viewModel;
@end
