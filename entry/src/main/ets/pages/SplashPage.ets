import router from '@ohos.router'
import { RoutePath } from '../route/RoutePath'

@Entry
@Component
struct SplashPage {
  @State count: number = 5;
  timer: number = -1;

  // 开屏页  -- 2秒后自动进入首页，无跳过按钮
  // aboutToAppear() {
  //   setTimeout(() => {
  //     router.replaceUrl({ url: RoutePath.MainPage })
  //   }, 2000)
  // }

  aboutToAppear() {
    this.timer = setInterval(()=>{
      if(this.count > 1) {
        this.count--
      } else {
        clearIntervalAndRouter(this.timer);
      }
    },1000)
  }

  build() {
    Stack() {
      // Image('http://p8-test.maiyaole.com/fky/img/print/sy2/1594973466155.jpg')
      Image($r('app.media.landing_image')).objectFit(ImageFit.ScaleDown)

      // 右侧 跳过按钮
      Button(`${this.count} 跳过>>`).onClick(()=> {
        clearIntervalAndRouter(this.timer);
      }).fontColor(Color.Black).fontSize(15)
        .backgroundColor($r("app.color.color_f5f5f5"))
        .borderRadius(90).position({ x: '75%', y: '80%' })

    }.width("100%").height("100%").backgroundColor($r("app.color.color_white"))
    .alignContent(Alignment.Center)
  }

}

function clearIntervalAndRouter(timer: number) {
  clearInterval(timer)
  router.replaceUrl({ url: RoutePath.MainPage })
}
