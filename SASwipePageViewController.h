//
//  SASwipePageViewController.h
//  SASwipePageViewController
//
//  Created by StoneArk on 15/1/28.
//  Copyright (c) 2015年 StoneArk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SASwipePageViewController : UIPageViewController
- (id)initWithViewControllers:(NSArray*)viewControllers selectedIndex:(NSUInteger)index;
- (void)scrollToPage:(NSInteger)page animation:(BOOL)animation;
@end
