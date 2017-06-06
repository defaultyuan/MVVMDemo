//
//  DYCellProtocol.h
//  DYPlayNews
//
//  Created by 袁斌 on 2017/6/4.
//  Copyright © 2017年 https://github.com/DefaultYuan . All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DYCellRenderProtocol;

@protocol DYCellProtocol <NSObject>

@required
///绑定数据
- (void) bindViewModel:(id<DYCellRenderProtocol>)viewModel;

@optional
///返回Cell高度
+ (CGFloat) heightForViewModel:(id<DYCellRenderProtocol>)viewModel;
@end
