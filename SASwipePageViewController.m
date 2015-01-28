//
//  SASwipePageViewController.m
//  SASwipePageViewController
//
//  Created by StoneArk on 15/1/28.
//  Copyright (c) 2015年 StoneArk. All rights reserved.
//

#import "SASwipePageViewController.h"
#import "SASwipePageHandler.h"

@interface SASwipePageViewController ()
@property (strong, nonatomic) SwipePageHandler *handler;
@end

@implementation SASwipePageViewController
- (id)initWithViewControllers:(NSArray*)viewControllers selectedIndex:(NSUInteger)index
{
    if (self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil])
    {
        _handler = [[SwipePageHandler alloc]initWithViewControllers:viewControllers selectedIndex:index];
        [self setDelegate:_handler];
        [self setDataSource:_handler];
        [self setViewControllers:@[[_handler viewControllerAtIndex:index]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    }
    return self;
}

- (void)scrollToPage:(NSInteger)page animation:(BOOL)animation
{
    UIPageViewControllerNavigationDirection scrollDirection;
    if (page > _handler.currentPageIndex)
    {
        scrollDirection = UIPageViewControllerNavigationDirectionForward;
    }
    else if (page < _handler.currentPageIndex)
    {
        scrollDirection = UIPageViewControllerNavigationDirectionReverse;
    }
    else
    {
        return;
    }
    
    __weak typeof(_handler) weakHandler = _handler;
    [self setViewControllers:@[[_handler viewControllerAtIndex:page]] direction:scrollDirection animated:animation completion:^(BOOL finished) {
        [weakHandler setCurrentPageIndex:page];
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
