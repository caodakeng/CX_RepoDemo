//
//  ImageBrowserMainView.h
//  ReadingProject
//
//  Created by caoxiang on 2020/3/17.
//  Copyright © 2020 YouShu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ImageBrowserModel;

@protocol ImageBrowserMainViewDelegate <NSObject>

/* 单击 后的操作 */
- (void)imageBrowserMianViewSingleTapWithModel:(ImageBrowserModel *)imageBrowserModel;
/* 改变主视图 的 透明度 */
- (void)imageBrowserMainViewTouchMoveChangeMainViewAlpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_BEGIN

@interface ImageBrowserMainView : UIView

@property(nonatomic,weak)id<ImageBrowserMainViewDelegate>delegate;

@property(nonatomic,strong)NSMutableArray * dataSource;
@property(nonatomic,assign)NSInteger selectPage;

/**
 初始化主视图

 @param imageUrls 大图的下载地址
 @param originImageViews 原始的小图的 iamgeView
 @param selectPage 当前选中的是哪一个iamgeView
 @return 主视图
 */
+ (id)imageBrowserMainViewUrlStr:(NSArray<NSString *>*)imageUrls originImageViews:(NSArray<UIImageView *>*)originImageViews selectPage:(NSInteger)selectPage;

/**
 隐藏子组件

 @param isHidden 是否隐藏
 */
- (void)subViewHidden:(BOOL)isHidden;

@end

NS_ASSUME_NONNULL_END
