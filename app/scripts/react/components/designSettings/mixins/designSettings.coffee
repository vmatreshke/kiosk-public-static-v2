DesignSettingsMixin =

  getDefaultProps: ->
    pageColor:
      title: 'цвет страницы'
      optionName: 'pageColor'
      value: '#ff0000'
      items: ['#bf443f', '#569a9f', '#4f617d', '#f4d3c4', '#d4c3c9']
    pageBackground:
      title: 'фон страницы'
      optionName: 'pageBackground'
      value: 'http://img.faceyourmanga.com/mangatars/0/0/39/large_511.png'
      items: [
        'https://s-media-cache-ak0.pinimg.com/originals/56/b8/bd/56b8bdb28de8e41c9acbaa993e16a1eb.jpg'
        'http://img.faceyourmanga.com/mangatars/0/0/39/large_511.png'
      ]
    feedColor:
      title: 'цвет ленты'
      optionName: 'feedColor'
      value: '#ffd46c'
      items: ['#894c00', '#fff2a6', '#720000', '#513100', '#ffd46c']
    feedOpacity:
      title: 'прозрачность ленты'
      optionName: 'feedOpacity'
      value: 1
    font:
      title: 'шрифт'
      optionName: 'font'
      value: 'helvetica'
      items: ['helvetica', 'ptserif', 'ptsans', 'verdana', 'courier']
    fontColor:
      title: 'цвет текста'
      optionName: 'fontColor'
      value: '#c3a96c'
      items: ['#264c35', '#c3a96c', '#fa3c58', '#772d3c', '#1a0f17']
    fontSize:
      title: 'размер шрифта'
      optionName: 'fontSize'
      value: 14
      from:  13
      to:    15
    activeElementsColor:
      title: 'цвет активных элементов'
      optionName: 'activeElementsColor'
      value: '#264c35'
      items: ['#264c35', '#c3a96c', '#fa3c58', '#772d3c', '#1a0f17']
    productLayout:
      title: 'лейаут товара'
      optionName: 'productLayout'
      value: 'bigpic'
      items:
        bigpic:    'http://cs9514.vk.me/v9514976/2b7d/dV_vHdU34H8.jpg'
        layoutTwo: 'http://cs9514.vk.me/v9514976/2b7d/dV_vHdU34H8.jpg'
    catalog:
      title: 'каталог'
      optionName: 'catalog'
      value: ['filter', 'menu']
      items:
        menu:   'Меню'
        filter: 'Фильтр'
        search: 'Поиск'
    productsInRow:
      title: 'товаров в ряд'
      optionName: 'productsInRow'
      value: 3
      from:  2
      to:    4
    mainPage:
      title: 'главная страница'
      optionName: 'mainPage'
      value: ['bigBanner']
      items:
        bigBanner: 'Большой баннер' 
        callback:  'Форма обратного звонка'

module.exports = DesignSettingsMixin