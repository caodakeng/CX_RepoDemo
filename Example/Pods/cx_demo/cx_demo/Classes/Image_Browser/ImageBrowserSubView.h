//
//  ImageBrowserSubView.h
//  ReadingProject
//
//  Created by caoxiang on 2020/3/17.
//  Copyright © 2020 YouShu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ImageBrowserModel;

@protocol ImageBrowserSubViewDelegate <NSObject>
/* 单击 后的操作 */
- (void)imageBrowserSubViewSingleTapWithModel:(ImageBrowserModel *)imageBrowserModel;
/* 改变主视图 的 透明度 */
- (void)imageBrowserSubViewTouchMoveChangeMainViewAlpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_BEGIN

@interface ImageBrowserSubView : UIView

@property(nonatomic,weak)id<ImageBrowserSubViewDelegate> delegate;

- (id)initWithFrame:(CGRect)frame ImageBrowserModel:(ImageBrowserModel *)imageBrowserModel;

@end

NS_ASSUME_NONNULL_END
