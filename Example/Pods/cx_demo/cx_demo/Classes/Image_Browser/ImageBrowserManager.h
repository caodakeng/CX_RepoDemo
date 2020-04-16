//
//  ImageBrowserManager.h
//  ReadingProject
//
//  Created by caoxiang on 2020/3/17.
//  Copyright © 2020 YouShu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ForceTouchActionBlock)(NSInteger selectIndex, NSString *title);

@interface ImageBrowserManager : NSObject

@property(nonatomic,assign)NSInteger selectPage; ///< 选中哪一个imageView

/**
 初始化 Manger
 
 @param imageUrls 各个图片大图的url
 @param originImageViews 原始的小图
 @param controller 小图所有的视图控制器
 @return manger
 */
+ (id)imageBrowserMangerWithUrlStr:(NSArray<NSString *>*)imageUrls originImageViews:(NSArray<UIImageView *>*)originImageViews originController:(UIViewController *)controller;
/**
 用户点击小图，进入图片查看大图。
 */
- (void)showImageBrowser;

@end

NS_ASSUME_NONNULL_END
