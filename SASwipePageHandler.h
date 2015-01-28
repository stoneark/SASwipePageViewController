//
//  SASwipePageHandler.h
//  SASwipePageViewController
//
//  Created by StoneArk on 15/1/28.
//  Copyright (c) 2015年 StoneArk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SASwipePageHandler : NSObject<UIPageViewControllerDataSource,UIPageViewControllerDelegate>
@property (assign, nonatomic) NSUInteger currentPageIndex;
- (id)initWithViewControllers:(NSArray*)viewControllers selectedIndex:(NSUInteger)index;
- (UIViewController*)viewControllerAtIndex:(NSUInteger)index;
@end
