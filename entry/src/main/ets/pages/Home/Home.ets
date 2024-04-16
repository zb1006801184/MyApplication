import router from '@ohos.router';

@Component
export struct HomePage {
  private swiperController: SwiperController = new SwiperController()
  @State dataList: Array<Resource> = [$r('app.media.banner_1'), $r('app.media.banner_2'), $r('app.media.banner_3'),];

  build() {
    Column() {
      //1.轮播图
      this.bannerView()
    }
    .justifyContent(FlexAlign.Start)
    .height('100%')
  }

  @Builder
  bannerView() {
    Stack() {
      Swiper(this.swiperController) {
        ForEach(this.dataList, item => {
          Image(item)
            .objectFit(ImageFit.Cover)
            .width('100%')
            .height('208')
        })
      }
      .loop(true)
      .autoPlay(true)
      //扫码按钮
      this.scanView()
    }
    .alignContent(Alignment.TopEnd)
  }
  //扫码按钮
  @Builder
  scanView() {
    Row() {
      Image($r('app.media.icn_scan'))
        .width('24')
        .height('21')
        .objectFit(ImageFit.Contain)
    }
    .width('40')
    .height('40')
    .backgroundColor(Color.Black)
    .opacity(0.3)
    .border({ radius: '20' })
    .justifyContent(FlexAlign.Center)
    .onClick(this.scanOnClick)
    .margin({
      right:'15',
      top:'30'
    })
  }


  //点击扫码
  scanOnClick() {
      console.log('app_log:点击扫码')
  }

  //获取随机颜色
  randomColor(): ResourceColor {
    return Math.floor(Math.random() * 16777215).toString(16);
  }


  //路由跳转 'pages/Home/Empty'
  routerPushClick(routerUrl: string): void {
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