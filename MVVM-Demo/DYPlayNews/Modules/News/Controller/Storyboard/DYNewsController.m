//
//  DYNewsController.m
//  DYPlayNews
//
//  Created by 袁斌 on 2017/5/25.
//  Copyright © 2017年 https://github.com/DefaultYuan All rights reserved.
//

#import "DYNewsController.h"
#import "DYServiceAPIConfig.h"
#import "Mantle.h"
#import "DYNewsListController.h"

@interface DYNewsMenuItem : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSString *topId;
@property (nonatomic, copy) NSString *title;
@end
@implementation DYNewsMenuItem
+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{};
}
@end

@interface DYNewsController ()

@property (nonatomic, strong)  NSArray *menuList;
@property (nonatomic, strong) NSMutableArray *controllers;
@end

@implementation DYNewsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:YES];
    [self configMagicView];
}

- (void) configMagicView
{
    self.magicView.itemScale = 1.2;
    self.magicView.headerHeight = 40;
    self.magicView.navigationHeight = 44;
    self.magicView.againstStatusBar = YES;
    self.magicView.headerView.backgroundColor = RGBCOLOR(243, 40, 47);
    self.magicView.navigationColor = [UIColor whiteColor];
    self.magicView.layoutStyle = VTLayoutStyleDefault;
    self.view.backgroundColor = RGBCOLOR(243, 40, 47);
    self.edgesForExtendedLayout = UIRectEdgeAll;

    [self.magicView reloadData];
}

- (NSArray *)menuList
{
    if (!_menuList) {
        NSArray *array = [DYServiceAPIConfig shared].newsInfoArray;
        _menuList = [MTLJSONAdapter modelsOfClass:[DYNewsMenuItem class] fromJSONArray:array error:NULL];
    }
    return _menuList;
}

#pragma mark - VTMagicViewDataSource
- (NSArray<NSString *> *)menuTitlesForMagicView:(VTMagicView *)magicView {
    NSMutableArray *titleList = [NSMutableArray array];
    for (DYNewsMenuItem *menu in self.menuList) {
        [titleList addObject:menu.title];
    }
    return titleList;
}

- (UIButton *)magicView:(VTMagicView *)magicView menuItemAtIndex:(NSUInteger)itemIndex {
    static NSString *itemIdentifier = @"itemIdentifier";
    UIButton *menuItem = [magicView dequeueReusableItemWithIdentifier:itemIdentifier];
    if (!menuItem) {
        menuItem = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem setTitleColor:RGBCOLOR(50, 50, 50) forState:UIControlStateNormal];
        [menuItem setTitleColor:RGBCOLOR(169, 37, 37) forState:UIControlStateSelected];
        menuItem.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:15.f];
    }
    // 默认会自动完成赋值
    //    MenuInfo *menuInfo = _menuList[itemIndex];
    //    [menuItem setTitle:menuInfo.title forState:UIControlStateNormal];
    return menuItem;
}

- (UIViewController *)magicView:(VTMagicView *)magicView viewControllerAtPage:(NSUInteger)pageIndex
{
    return self.controllers[pageIndex];
}

- (NSMutableArray *)controllers
{
    if (!_controllers) {
        _controllers = [NSMutableArray array];
        for (DYNewsMenuItem *item in self.menuList) {
            DYNewsListController *listViewController = (DYNewsListController *)[[UIStoryboard storyboardWithName:@"NewsList" bundle:nil] instantiateInitialViewController];
            listViewController.topId = item.topId;
            [_controllers addObject:listViewController];
        }
    }
    return _controllers;
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
