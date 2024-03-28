import { HomePage } from './Home/Home'
import { MinePage } from './Mine/Mine'

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
        .tabBar('首页')

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
}


interface Person {
  name: string;
  age: Number

  say(): void
}

class A {
}

class B extends A implements Person {
  name = ''
  say = () => {
  }
  age = 2
}
