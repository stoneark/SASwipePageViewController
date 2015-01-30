//
//  ViewController.m
//  SASwipePageViewControllerDemo
//
//  Created by StoneArk on 15/1/29.
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

#import "ViewController.h"
#import "SASwipePageViewController.h"

@interface ViewController ()
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UIActivityIndicatorView *indicator;
@property (assign, nonatomic) NSUInteger index;
@end

@implementation ViewController

- (id)initWithIndex:(NSUInteger)index
{
    if (self = [super init])
    {
        _index = index;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"ViewController:%ld Load",_index);
    [self.view setBackgroundColor:[UIColor colorWithRed:(_index<=2) green:(_index<=1) blue:(_index==0) alpha:1]];
    _label = [[UILabel alloc]initWithFrame:CGRectMake(40, 30, 100, 30)];
    [_label setText:@"Loading..."];
    [_label setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:_label];
    _indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [_indicator setFrame:CGRectMake(10, 30, 30, 30)];
    [self.view addSubview:_indicator];
    [_indicator startAnimating];
    [_indicator setBackgroundColor:[UIColor clearColor]];

    for (int i=0;i<3;i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
        if (i==_index) [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setFrame:CGRectMake(20+i*60, 100, 60, 20)];
        [button setTag:i];
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
    [self performSelectorInBackground:@selector(loadData) withObject:nil];
}

- (void)loadData
{
    sleep(4);
    [_label setText:@"Finished!"];
    [_indicator stopAnimating];
}

- (void)btnClick:(UIButton*)sender
{
    SASwipePageViewController *swipePageViewController = (SASwipePageViewController*)self.parentViewController;
    [swipePageViewController scrollToPageAtIndex:sender.tag animation:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
