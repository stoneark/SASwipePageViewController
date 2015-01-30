# SASwipePageViewController

SASwipePageViewController is a class which can maintain serveral view controllers, and allowing to use swipe left/right gesture to show the right/left view controller of the current one showing on the screen.

![ScreenShot](https://raw.githubusercontent.com/stoneark/SASwipePageViewController/master/ScreenShot.gif)

## Usage

- Initializing with several view controllers:

```
- (id)initWithViewControllers:(NSArray*)viewControllers selectedIndex:(NSUInteger)index;
```

- Switch to the view controller at index with code:

```
- (void)scrollToPageAtIndex:(NSUInteger)index animation:(BOOL)animation;
```

For detail, check the file `AppDelegate.m` and `ViewController.m` in the demo project.

## License

MIT License

@StoneArk