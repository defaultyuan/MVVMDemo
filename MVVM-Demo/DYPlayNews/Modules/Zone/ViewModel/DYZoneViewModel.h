//
//  DYZoneViewModel.h
//  DYPlayNews
//
//  Created by 袁斌 on 2017/6/1.
//  Copyright © 2017年 https://github.com/DefaultYuan. All rights reserved.
//

#import "DYBaseViewModel.h"

@interface DYZoneViewModel : DYBaseViewModel

- (RACSignal *) fetchHotZoneWithPageIndex:(NSUInteger)pageIndex;
- (RACSignal *) fetchZoneDiscuzWithIndex:(NSUInteger)index;
- (RACSignal *) fetchDiscuzImageWithFid:(NSString *)fid;
- (RACSignal *) fetchDiscuzListWithFid:(NSString *)fid index:(NSUInteger)index;
- (RACSignal *) fetchDiscuzDetailWithTid:(NSString *)tid
                                   index:(NSUInteger)index
                                pageSize:(NSUInteger)pageSize;
@end
