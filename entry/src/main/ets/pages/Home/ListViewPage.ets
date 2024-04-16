@Entry
@Component
struct ListViewPage {
  build() {
    Column() {
      this.nav()
    }
  }

  @Builder
  nav() {
    Navigation() {
      this.mainListView()
    }
    .titleMode(NavigationTitleMode.Mini)
    .title('列表页')
    .mode(NavigationMode.Auto)
  }

  @Builder
  mainListView() {
    List() {
      ForEach(["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"], (item, index) => {
        ListItem() {
          this.listItemView(item, { index: index })
        }
        .height('44')
        .padding({
          left: "20"
        })
      })
    }
  }

  @Builder
  listItemView(item: string, {index: number}) {

  }
}