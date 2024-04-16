import router from '@ohos.router';

@Component
export struct HomePage {
  build() {
    List() {
      //1.
      ListItem() {
        Button('路由跳转:空页面').onClick(()=> this.routerPushClick('pages/Home/Empty'))
      }
      .width('100%')
      .backgroundColor(this.randomColor())
      .margin({
        bottom:"10"
      })
      //2.
      ListItem() {
        Button('路由跳转:列表页').onClick(()=> this.routerPushClick('pages/Home/ListViewPage'))
      }
      .width('100%')
      .backgroundColor(this.randomColor())
      .margin({
        bottom:"10"
      })
    }
    .backgroundColor(Color.White)
    .height('100%')
    .margin({
      top: 44
    })
  }
  //获取随机颜色
  randomColor():ResourceColor {
    return  Math.floor(Math.random()*16777215).toString(16);
  }


  //路由跳转 'pages/Home/Empty'
  routerPushClick(routerUrl:string): void {
    console.log('app_log:跳转')
    router.pushUrl({
      url: routerUrl
    },
      router.RouterMode.Standard,
      (err) => {
        console.error(err.message)
      }
    )
  }
}