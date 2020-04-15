//
//  ImageBrowserManager.m
//  ReadingProject
//
//  Created by caoxiang on 2020/3/17.
//  Copyright © 2020 YouShu. All rights reserved.
//

#import "ImageBrowserManager.h"
#import "ImageBrowserViewController.h"
#import "ImageBrowserHeader.h"

@interface ImageBrowserManager ()<UIViewControllerPreviewingDelegate>
@property(nonatomic,copy)NSArray * imageUrls;
@property(nonatomic,copy)NSArray * originImageViews;

@property(nonatomic,weak)UIViewController * controller;
@end

@implementation ImageBrowserManager

+ (id)imageBrowserMangerWithUrlStr:(NSArray<NSString *> *)imageUrls originImageViews:(NSArray<UIImageView *> *)originImageViews originController:(UIViewController *)controller {
    ImageBrowserManager *imageBrowserManger = [[ImageBrowserManager alloc] init];
    imageBrowserManger.imageUrls = imageUrls;
    imageBrowserManger.originImageViews = originImageViews;
    imageBrowserManger.controller = controller;
    return imageBrowserManger;
}

- (void)showImageBrowser {
    ImageBrowserViewController * imageBrowserViewController = [[ImageBrowserViewController alloc] initWithUrlStr:self.imageUrls originImageViews:self.originImageViews selectPage:self.selectPage];
    [self.controller presentViewController:imageBrowserViewController animated:YES completion:nil];
}

@end
