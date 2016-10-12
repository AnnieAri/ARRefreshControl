# ARRefreshControl
一款轻量级下拉刷新控件

##效果图
<img src="https://raw.githubusercontent.com/AnnieAri/ARRefreshControl/master/ARRefreshDemo/Document/%E6%95%88%E6%9E%9C%E5%9B%BE.gif" width="320">

用法
=============

导入头文件  "ARRefreshControl.h"

```
    ARRefreshControl *refreshControl = [[ARRefreshControl alloc] init];
 //设置控件的frame
    refreshControl.frame = CGRectMake(0, -44, self.tableView.bounds.size.width, 44);
    //使用全局变量记录此控件
    self.arRefreshControl = refreshControl;
    [self.tableView addSubview:refreshControl];
    //监听控件的UIControlEventValueChanged事件
    [refreshControl addTarget:self action:@selector(refresh) forControlEvents:(UIControlEventValueChanged)];
    
    //实现refresh方法
    - (void)refresh {
    	/**
    	  这里实现tableView的刷新方法 可在异步请求网络数据回来调用下面两个方法
    	*/
    	[self.tableView reloadData];
    	//调用控件结束刷新的方法
        [self.arRefreshControl endRefreshing];
    }
```