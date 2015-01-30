//
//  SASwipePageHandler.m
//  SASwipePageViewController
//
//  Created by StoneArk on 15/1/28.
//  Copyright (c) 2015年 StoneArk. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining
//  a copy of this software and associated documentation files (the
//  "Software"), to deal in the Software without restriction, including
//  without limitation the rights to use, copy, modify, merge, publish,
//  distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to
//  the following conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
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
