# iOS_demo
### demo1_greeting

- 如何修改App图标下方的名称
- 如何使用真机调试App
- 如何设置App的icon图标
- 如何设置App的`launchImage`
- 如何设置App的launch加载时间

```swift
// 设置App的launch加载时间
override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    Thread.sleep(forTimeInterval: 1.0)
}
```

- UITextField
- UIButton
  - [TouchDown、TouchDownRepeat 和 TouchCancel 的区别](https://www.liuchuo.net/archives/8288)
  - [Touch Drag Inside 和 Touch Drag Outside、Touch Drag Enter、Touch Drag Exit的区别](https://www.liuchuo.net/archives/8285)
  - [Touch Up Inside 和 Touch Up Outside 的区别](https://www.liuchuo.net/archives/8282)


- UILabel
- `@IBOutlet`和`@IBAction`
- 怎么把代码和组件连接起来（点击Button，使UITextField的内容显示在UILabel里面）
- 如何自定义Button（点击button后button改变颜色）




### demo2_image

- 图片的添加

  - 添加图片（直接把图片拖动到`Assets.xcassets`侧边栏即可～也可以点左下角`+`然后`New Image Set`），`AppIcon`和`LaunchImage`也在这里拖入～

- Image View的使用（使用`Image View`展示图片）

  - 第一种方法：在`Interface Builder`右侧`Image`属性选择想要展示的图片名称
    - 在`Interface Builder`里直接选图片意味着图片会自动打包在`mainBundle`里，每当访问之后，系统会将该图片自动缓存在内存里（认为一般打包在`mainBundle`里的都是常用资源）
  - 第二种方法：使用代码添加图片，在`ViewController`的`viewDidLoad`里面添加图片（删除Outlet，使用代码创建`UIImage`对象）[加载App bundle里的图片和文件里的图片]

- 如何调整图片大小，[Scale Fill、Aspect Fit 和 Aspect Fill 的区别（Content Mode）](https://www.liuchuo.net/archives/8299)

  - `Scale Fill`：缩放以填满整个Image View
  - `Aspect Fit`：保持图片原比例，尽可能让图片全部显示出来
  - `Aspect Fill`：保持图片原比例，填满整个Image View（图片可能会被裁剪掉）

- 设置图片的半透明度（Alpha值）

  - `Alpha`：调整图片显示的半透明度（默认是不透明，即`1`，`Alpha`的值区间为`0~1`）不过`Alpha`不要乱用，可能会影响性能，会多很多操作，如果需要图片的半透明度可以将要放进来的图片先处理好再放进来，这样能够加快app加载的性能

- [如何使用Mac自动操作制作@1x@2x@3x图片](https://www.liuchuo.net/archives/315)

- [Tab Bar 的 Item 按钮的像素大小要求](https://www.liuchuo.net/archives/8308)

- [把图片设置成**Render as Template Image**，设置**Bar Tint Color** 改变Tab Bar Item的颜色](https://www.liuchuo.net/archives/8304)

- 图片的切片，使用slicing切片边框

  - 边框图片的切片：在`Assets`里面将`Slices`设置为`Hroizontal and Vertical`，`Center`设置为`Stretches`，在`show slicing`里面通过拖动Slices的四根切片线设置`Left / Right / Top / Bottom`的距离，Center的两根切片线设置`Width`和`Height`

- 添加PDF格式的矢量图片保证不失真

  - 如何制作PDF格式的矢量图：用`illustrator`或者`Inkscape`导出`PDF`，用`Keynote`画然后导出`PDF`也可以
  - 矢量图片的处理：将PDF格式的放入图片文件夹里面，属性的`Scale Factors`设置为`Single Vector`（矢量图），这样不管放大缩小多少都不会失真

- 使用一连串图片联合起来构成动画

  - 图片使用同样的名称，只有后面不同。比如animateImage1、animateImage2...

  - 在viewDidLoad里面添加UIImage图片，图片名称只需要写前面相同的前缀名称

  - ```swift
    UIImage *image1 = [UIImage animatedImageNamed:@"animateImage" duration:2.0];
    self.animatedImageView.image = image;
    ```




### demo3_storyboard

- View Controller Scene之间的跳转
- View Controller的返回 “unwindForSegue”和exit按钮
- 重构（refactor）storyboard
- Storyboard Reference的使用




### demo4_Navigation

- Navigation Controller的两种创建方式
- 给Navigation Bar 添加标题（必须要有Navigation item）、说明文字
- 给Navigation Bar添加Navigation item和Bar Button Item
- 添加ToolBar
- 给ToolBar添加Bar Button Item
- 给ToolBar的Item间添加Flexible Space Bar Button
- 给ToolBar的两边添加Fixed Sapce Bar Button Item
- 自定义Item的颜色、图片
- 添加返回到最开始页面的按钮Home，使用[self.navigationController popToRootViewControllerAnimated: YES]
- 用户点击屏幕（或者滑动屏幕）的时候隐藏Navigation Bar的设置



### demo5_TabBar

- 创建Tab Bar Controller
- 给当前Tab Bar Controller添加一个View Controller
- 设置Tab Bar Items的统一颜色、Tab Bar Items选中时候的样式
- 简单定制TabBarItem，设置Tab Bar Item的图标（可以选择System Item，也可以自己定制）
- （ps: 还可以自定义放在左侧的Tab Bar）



### demo6_TableView

- 给ViewController添加一个Table View
- Table View的DataSource、Delegate的绑定
- 设置Section的行数：numberOfRowsInSection
- 设置Section的个数：numberOfSectionInTableView
- 设置每一个section的header和footer的颜色：viewForHeaderInSection、viewForFooterInSection
- 使用RGB表示法自定义颜色UIColor
- Navigation Bar与TableViewController的结合
- 设置cell的高度tableView.rowHeight
- 设置cell的大标题、小标题、图片
- 使Table View的Controller界面跳转到另一个DetailViewController界面
- 将Table View的row和section信息传递到DetailViewController界面



### demo7_CollectionView

