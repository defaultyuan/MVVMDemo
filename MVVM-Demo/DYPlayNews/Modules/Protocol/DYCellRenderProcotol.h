//
//  DYCellRenderProcotol.h
//  DYPlayNews
//
//  Created by 袁斌 on 2017/6/4.
//  Copyright © 2017年 https://github.com/DefaultYuan . All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DYCellRenderProcotol <NSObject>

@required
///Cell对应的重用标识
- (NSString *)cellIdentifier;
@end
