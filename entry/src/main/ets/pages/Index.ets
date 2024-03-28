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
        TabContent() {
          HomePage()
        }
        .tabBar(this.bottomTabItem({
          'index': 0,
          'title': '首页',
          'selectImage': 'resources/base/media/icon_sel_home.png',
          'unSelectImage': 'resources/base/media/icon_unsel_home.png'
        }))

        TabContent() {
          HomePage()
        }
        .tabBar('我的')

        TabContent() {
          HomePage()
        }
        .tabBar('我的')

        TabContent() {
          MinePage()
        }
        .tabBar('我的')
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


  //tabbar
  @Builder bottomTabItem(itemModel: TabItemModel): void {
    Column() {
      Image(this.selectedIndex == itemModel.index ? itemModel.selectImage : itemModel.unSelectImage)
        .height('21vp')
        .width('21vp')
      Text(itemModel.title)
    }
  }
}



