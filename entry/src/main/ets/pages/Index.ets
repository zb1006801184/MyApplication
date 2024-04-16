import { HomePage } from './Home/Home'
import { MinePage } from './Mine/Mine'
import { TabItemModel } from '../model/TabItemModel'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World 1222'
  @State selectedIndex: number = 0
  // @Provide homeTabSelected: number = 0

  build() {
    Column() {
      Tabs({
        index: this.selectedIndex,
        barPosition: BarPosition.End,
      }) {
        TabContent() {HomePage()}
        .tabBar(this.bottomTabItem({
          'index': 0,
          'title': '首页',
          'selectImage': $r('app.media.tab_0_s'),
          'unSelectImage': $r('app.media.tab_0_n')
        }))

        TabContent() {MinePage()}
        .tabBar(this.bottomTabItem({
          'index': 1,
          'title': '菜单',
          'selectImage': $r('app.media.tab_1_s'),
          'unSelectImage': $r('app.media.tab_1_n')
        }))

        TabContent() {MinePage()}
        .tabBar(this.bottomTabItem({
          'index': 2,
          'title': '订单',
          'selectImage': $r('app.media.tab_2_s'),
          'unSelectImage': $r('app.media.tab_2_n')
        }))

        TabContent() {MinePage()}
        .tabBar(this.bottomTabItem({
          'index': 3,
          'title': '购物车',
          'selectImage': $r('app.media.tab_3_s'),
          'unSelectImage': $r('app.media.tab_3_n')
        }))

        TabContent() {MinePage()}
        .tabBar(this.bottomTabItem({
          'index': 4,
          'title': '我的',
          'selectImage': $r('app.media.tab_4_s'),
          'unSelectImage': $r('app.media.tab_4_n')
        }))
      }
      .barMode(BarMode.Fixed)
      .barWidth('100%')
      .scrollable(true)
      .barHeight(44)
      .borderColor(Color.Red)
      .onChange((index: number) => {
        this.selectedIndex = index;
      })

    }.width('100%')

  }

  clickAction(): void {
    console.log('666')
    this.action('1', '2', '3', '4', '5', '6')
  }
  //  paramA  必须参数
  //  paramB  可选参数
  //  y 剩余参数
  action(paramA: string, paramB?: string, ...y: string[]): void {
    //获取剩余参数  y[0]
    console.log(paramA + paramB);
    var name: string = '12'

    function add(a: number, b: number): number {
      return a + b;
    }
  }

  //tabbar item
  @Builder bottomTabItem(itemModel: TabItemModel): void {
    Column() {
      Image(this.selectedIndex == itemModel.index ? itemModel.selectImage : itemModel.unSelectImage)
        .height('21vp')
        .width('21vp')
        .margin({
          bottom: '8vp'
        })

      Text(itemModel.title)
        .fontSize(12)
        .fontColor("#642b4c7e")

    }
  }
}



