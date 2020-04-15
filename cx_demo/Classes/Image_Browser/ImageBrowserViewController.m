//
//  ImageBrowserViewController.m
//  ReadingProject
//
//  Created by caoxiang on 2020/3/17.
//  Copyright © 2020 YouShu. All rights reserved.
//

#import "ImageBrowserViewController.h"
#import "ImageBrowserMainView.h"
#import "ImageBrowserTranslation.h"
#import "ImageBrowserHeader.h"

@interface ImageBrowserViewController ()<UIViewControllerTransitioningDelegate, ImageBrowserMainViewDelegate>

@property(nonatomic,copy)NSArray * imageUrls;
@property(nonatomic,copy)NSArray * originImageViews;
@property(nonatomic,assign)NSInteger selectPage; ///< 选中哪一个imageView

@property(nonatomic,strong)ImageBrowserMainView * browserMainView;
@property(nonatomic,strong)ImageBrowserTranslation *browserTranslation;
@property(nonatomic,strong)UIViewController * controller;

@end

@implementation ImageBrowserViewController

- (id)initWithUrlStr:(NSArray<NSString *>*)imageUrls originImageViews:(NSArray<UIImageView *>*)originImageViews selectPage:(NSInteger)selectPage {
    if (self = [super init]) {
        self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        self.transitioningDelegate = self;
        self.imageUrls = imageUrls;
        self.originImageViews = originImageViews;
        self.selectPage = selectPage;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubViews];
    // Do any additional setup after loading the view.
}

- (void)initSubViews {
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:1.0];
    [self.view addSubview:self.browserMainView];

}

#pragma mark --LZImageBrowserMainViewDelegate
/* 单击 后的操作 */
- (void)imageBrowserMianViewSingleTapWithModel:(ImageBrowserModel *)imageBrowserModel {
    [self dismissViewControllerAnimated:YES completion:nil];
}
/* 改变主视图 的 透明度 */
- (void)imageBrowserMainViewTouchMoveChangeMainViewAlpha:(CGFloat)alpha {
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:alpha];
}

#pragma mark --UIViewControllerTransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    self.browserTranslation.isBrowserMainView = YES;
    return self.browserTranslation;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    self.browserTranslation.isBrowserMainView = NO;
    return self.browserTranslation;
}


#pragma mark -lazy
- (ImageBrowserMainView *)browserMainView {
    if (_browserMainView == nil) {
        _browserMainView = [ImageBrowserMainView imageBrowserMainViewUrlStr:self.imageUrls originImageViews:self.originImageViews selectPage:self.selectPage];
        _browserMainView.delegate = self;
    }
    return _browserMainView;
}

- (ImageBrowserTranslation *)browserTranslation {
    if (_browserTranslation == nil) {
        _browserTranslation = [[ImageBrowserTranslation alloc] init];
        _browserTranslation.mainBrowserMainView = self.browserMainView;
        _browserTranslation.browserControllerView = self.view;
    }
    return _browserTranslation;
}

@end
