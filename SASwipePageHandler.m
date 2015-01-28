//
//  SASwipePageHandler.m
//  SASwipePageViewController
//
//  Created by StoneArk on 15/1/28.
//  Copyright (c) 2015年 StoneArk. All rights reserved.
//

#import "SASwipePageHandler.h"
@interface SASwipePageHandler()
@property (strong, nonatomic) NSArray *arrViewController;
@end

@implementation SASwipePageHandler
- (id)initWithViewControllers:(NSArray*)viewControllers selectedIndex:(NSUInteger)index
{
    if (self = [super init])
    {
        _arrViewController = viewControllers;
        _currentPageIndex = index;
    }
    return self;
}

- (UIViewController*)viewControllerAtIndex:(NSUInteger)index
{
    if (index >= _arrViewController.count)
    {
        return nil;
    }
    return _arrViewController[index];
}

#pragma mark - Page View Controller Data Source
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [_arrViewController indexOfObject:viewController];
    if (index == NSNotFound || index == 0)
    {
        return nil;
    }
    return [_arrViewController objectAtIndex:index-1];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [_arrViewController indexOfObject:viewController];
    if (index == NSNotFound || index == _arrViewController.count-1)
    {
        return nil;
    }
    return [_arrViewController objectAtIndex:index+1];
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    if (completed)
    {
        _currentPageIndex = [_arrViewController indexOfObject:[pageViewController.viewControllers firstObject]];
    }
}

@end
