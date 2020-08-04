$(function(){

  let flash = ['.alert', '.notice'];

  flash.forEach(function(Flash) {
    const flashMsg = document.querySelector(Flash)
    // 表示されてから4秒後にフェードアウトスタート
    const TIMEOUT_DELAY = 4000
    // 20ミリ秒に一回, opacity値を0.01減少させる設定
    const INTERVAL_DELAY = 20
    const OPACITY_SUB_VAL = 0.01

    // flashメッセージを消す処理
    const deleteFlashMessage = () => {
    const id = setInterval(() => {
    const opacity = flashMsg.style.opacity

    if (opacity > 0) {
      flashMsg.style.opacity = opacity - OPACITY_SUB_VAL
    } else {
      // opacityがゼロになったらflashメッセージをdisplay: noneに設定
      flashMsg.style.display = 'none'
      clearInterval(id)
    }
    }, INTERVAL_DELAY)
    }

    // flashメッセージが存在するかを真偽値に置き換えて判定
    if (!!flashMsg) {
    // opacityは元々設定されていないので、初期値を追加
    // opacity値は0~1の間で表現される
    flashMsg.style.opacity = 1
    setTimeout(deleteFlashMessage, TIMEOUT_DELAY)
    }
  });

  

});