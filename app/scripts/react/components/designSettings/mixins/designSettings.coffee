DesignSettingsMixin =

  getDefaultProps: ->
    pageColor:
      title: 'цвет страницы'
      optionName: 'pageColor'
      value: 'gray'
      items:
        dark: '#000'
        white: '#fff'
        gray: '#eee'
        red: '#EF1919'
    pageBackground:
      title: 'фон страницы'
      optionName: 'pageBackground'
      value: 'steve'
      items:
        pokeball: 'https://s-media-cache-ak0.pinimg.com/originals/56/b8/bd/56b8bdb28de8e41c9acbaa993e16a1eb.jpg'
        steve: 'http://img.faceyourmanga.com/mangatars/0/0/39/large_511.png'
    feedColor:
      title: 'цвет ленты'
      optionName: 'feedColor'
      value: 'green'
      items:
        black: '#000'
        white: '#fff'
        green: '#309060'
    feedOpacity:
      title: 'прозрачность ленты'
      optionName: 'feedOpacity'
      value: .3
    font:
      title: 'шрифт'
      optionName: 'font'
      value: 'gotham'
      items:
        gotham: 'Gotham Serif'
        times: 'Times New Roman'
        arial: 'Arial'
        helvetica: 'Helvetica'
    fontColor:
      title: 'цвет текста'
      optionName: 'fontColor'
      value: 'white'
      items:
        black: '#000'
        white: '#fff'
        green: '#309060'
    fontSize:
      title: 'размер шрифта'
      optionName: 'fontSize'
      value: 14
      from: 13
      to: 15
    activeElementsColor:
      title: 'цвет активных элементов'
      optionName: 'activeElementsColor'
      value: 'black'
      items:
        black: '#000'
        white: '#fff'
        green: '#309060'
    productLayout:
      title: 'лейаут товара'
      optionName: 'productLayout'
      value: 'layoutOne'
      items:
        layoutOne: 'http://cs9514.vk.me/v9514976/2b7d/dV_vHdU34H8.jpg'
        layoutTwo: 'http://cs9514.vk.me/v9514976/2b7d/dV_vHdU34H8.jpg'
    catalog:
      title: 'каталог'
      optionName: 'catalog'
      value: ['filter', 'sidebar']
      items:
        filter: 'Фильтр'
        sidebar: 'Меню'
        search: 'Поиск'
    productsInRow:
      title: 'товаров в ряд'
      optionName: 'productsInRow'
      value: 3
      from: 2
      to: 4
    mainPage:
      title: 'главная страница'
      optionName: 'mainPage'
      value: ['bigBanner']
      items:
        bigBanner: 'Большой баннер' 
        callback: 'Форма обратного звонка'

module.exports = DesignSettingsMixin