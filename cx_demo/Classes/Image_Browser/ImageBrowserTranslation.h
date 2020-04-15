//
//  ImageBrowserTranslation.h
//  ReadingProject
//
//  Created by caoxiang on 2020/3/17.
//  Copyright © 2020 YouShu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ImageBrowserMainView;

NS_ASSUME_NONNULL_BEGIN

@interface ImageBrowserTranslation : NSObject <UIViewControllerAnimatedTransitioning>
@property(nonatomic,assign)BOOL isBrowserMainView;
@property(nonatomic,strong)ImageBrowserMainView * mainBrowserMainView;
@property(nonatomic,strong)UIView * browserControllerView;

@end

NS_ASSUME_NONNULL_END
