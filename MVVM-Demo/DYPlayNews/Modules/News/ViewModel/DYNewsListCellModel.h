//
//  DYNewsListCellModel.h
//  DYPlayNews
//
//  Created by 袁斌 on 2017/6/4.
//  Copyright © 2017年 https://github.com/DefaultYuan . All rights reserved.
//

#import "DYBaseViewModel.h"

@class DYNews;
@interface DYNewsListCellModel : DYBaseViewModel

- (instancetype)initWithEntity:(DYNews *)newsEntity;
@property (nonatomic, strong, readonly) DYNews *entity;
@end
