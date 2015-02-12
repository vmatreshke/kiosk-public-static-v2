CatalogFilterMixin =

  getDefaultProps: ->
    selectedOptions: [
      { name: 'Цена от 20 000 до 5000 Р', url: '?filter_without_price' }
      { name: 'Категория: гибридные', url: '?filter_without_category' }
      { name: 'Материал: карбон', url: '?filter_without_material' }
    ]
    options: [{
      title: 'Показывать'
      type: 'checkbox'
      paramName: 'availability'
      items: [
        { name: 'Все', paramValue: 'all', checked: true }
        { name: 'В наличии', paramValue: 'in-stock', checked: false }
        { name: 'Под заказ', paramValue: 'on-request', checked: false }
        { name: 'Распродажа', paramValue: 'sale', checked: true }
      ]
    }, {
      title: 'Ценовой диапазон'
      type: 'range'
      paramName: 'price'
      units: '&#x20BD;'
      valueFrom: 20322
      valueTo: 35023
      from: 10000
      to: 50000
    }, {
      title: 'Показывать'
      type: 'checkbox'
      paramName: 'type'
      items: [
        { name: 'Все', paramValue: 'all', checked: true }
        { name: 'Гибридные', paramValue: 'hybrid', checked: false }
        { name: 'Складные', paramValue: 'foldable', checked: true }
        { name: 'Электро', paramValue: 'electro', checked: false }
      ]
    }, {
      title: 'Цвет' 
      type: 'color'
      paramName: 'color'
      items: [
        { name: 'Красный', paramValue: 'red', hexCode: '#fe2a2a', checked: false }
        { name: 'Оранжевый', paramValue: 'orange', hexCode: '#feac2a', checked: true }
        { name: 'Голубой', paramValue: 'cyan', hexCode: '#2fe1ec', checked: false }
        { name: 'Серый', paramValue: 'grey', hexCode: '#aeaeae', checked: true }
      ]
    }, {
      title: 'Материал рамы'
      type: 'checkbox'
      paramName: 'frame-material'
      items: [
        { name: 'Сталь', paramValue: 'steal', checked: false }
        { name: 'Карбон', paramValue: 'carbon', checked: true }
        { name: 'Алюминий', paramValue: 'aluminum', checked: false }
      ]
    }, {
      title: 'Модельный ряд'
      type: 'checkbox'
      paramName: 'series'
      items: [
        { name: '2014', paramValue: '2014', checked: false }
        { name: '2013', paramValue: '2013', checked: false }
        { name: '2012', paramValue: '2012', checked: true }
      ]
    }]

module.exports = CatalogFilterMixin