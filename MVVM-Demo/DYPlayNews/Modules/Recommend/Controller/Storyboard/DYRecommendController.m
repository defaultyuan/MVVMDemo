//
//  DYRecommendController.m
//  DYPlayNews
//
//  Created by 袁斌 on 2017/5/25.
//  Copyright © 2017年 https://github.com/DefaultYuan All rights reserved.
//

#import "DYRecommendController.h"
#import "DYRecommendViewModel.h"
#import "DYCellProtocol.h"

@interface DYRecommendController ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end

@implementation DYRecommendController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.viewModel = [[DYRecommendViewModel alloc] init];
    
    [self prepareLoadData];
}

- (void)prepareLoadData
{
    [[self.viewModel.fetchDataCommand execute:nil] subscribeNext:^(id x) {
        [self.collectionView reloadData];
    }];
}

#pragma mark -- UICollectionView && UICollectionViewDelegateFlowLayout
- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    id<DYCellRenderProtocol> cellModel = self.viewModel.dataSource[indexPath.row];
    
    if ([cellModel respondsToSelector:@selector(cellIdentifier)]) {
        NSString *cellClassStr = [cellModel cellIdentifier];
        Class<DYCellProtocol> cellClass = NSClassFromString(cellClassStr);
        
        if ([(NSObject *)cellClass respondsToSelector:@selector(sizeForViewModel:constrainedToSize:)]) {
            return [cellClass sizeForViewModel:cellModel
                             constrainedToSize:collectionView.frame.size];
        }
    }
    return CGSizeZero;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.viewModel.dataSource.count;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsZero;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(CGRectGetWidth(collectionView.frame), 1);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(CGRectGetWidth(collectionView.frame), 1);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    id<DYCellRenderProtocol> cellModel = self.viewModel.dataSource[indexPath.row];
    
    NSString *cellIdentifier;
    UICollectionViewCell<DYCellProtocol> *cell;
    
    if ([cellModel respondsToSelector:@selector(cellIdentifier)])
    {
        cellIdentifier = [cellModel cellIdentifier];
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
        [cell bindViewModel:cellModel];
    }
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    static NSString *headerID = @"headerID";
    static NSString *footerID = @"footerID";
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerID forIndexPath:indexPath];
        return header;
        
    }  else {
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:footerID forIndexPath:indexPath];
        return footer;
    }
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
