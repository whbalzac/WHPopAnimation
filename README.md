>#### 场景

项目中遇见一个场景，`VC`没有`UINavigationController`，但是需要`Push`和`Pop`的动画效果。
一开始使用了`MZFormSheetPresentationViewController`来实现`Push`效果，但是却没有`Pop`的边缘返回手势。本着求`Github`不如求己的原则，手撸了一个库出来，`WHPopAnimation`。
![效果图.gif](http://upload-images.jianshu.io/upload_images/2963444-47dd4467cdb3713d.gif?imageMogr2/auto-orient/strip)


>#### Push/Pop转场效果及实现

1. `Push`转场效果
    - `view.frame`从右屏外平移到屏幕正中
    - 父`VC`透明度从`1.0`变成`0.5`
    - 时长`0.3s`
 
2. `Pop`转场效果
    - `view.frame`从屏幕正中平移到右屏外
    - 父`VC`透明度从`0.5`变成`1.0`
    - 时长`0.4s`
    - 子`VC`的`self.view`需要添加`UIScreenEdgePanGestureRecognizer`边缘手势，平移超过屏幕中线则`dismiss(Pop)`，反之回弹回去。
3. 实现：`<UIViewControllerAnimatedTransitioning>协议`和`UIPercentDrivenInteractiveTransition`手势过渡管理对象

>#### WHPopAnimation 接入说明

无需管理`<UIViewControllerAnimatedTransitioning>协议`和`UIPercentDrivenInteractiveTransition`手势过渡管理对象。
**`AVc`**把`BVc`弹出来(`Present`出来)，只需要**`AVc`**继承**`WHPopViewController`**，`Present`调用代码也和之前一样(`WHPopViewController`中重写该方法)。
```
- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion 
```
`Ps.`假如你同一个`VC`既需要`Push`的转场效果，也需要`Present`的转场效果，你可以修改上面的方法，增加一个`BOOL isPushAnimation`的参数。

>#### Github链接：

[https://github.com/Balzac646729740/WHPopAnimation](https://github.com/Balzac646729740/WHPopAnimation)
######觉得不错就点个赞吧😀😀