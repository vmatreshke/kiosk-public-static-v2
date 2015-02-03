CatalogFilterMixin =

  getDefaultProps: ->
    options: [{
      title: 'Показывать'
      type: 'checkbox'
      items: [
        { name: 'Все', checked: true }
        { name: 'Гибридные', checked: false }
        { name: 'Складные', checked: false }
        { name: 'Электро', checked: true }
      ]
    }, {
      title: 'Ценовой диапазон'
      type: 'range'
      units: '&#x20BD;'
      from: 10000
      to: 50000
    }, {
      title: 'Показывать'
      type: 'checkbox'
      items: [
        { name: 'Все', checked: true }
        { name: 'Гибридные', checked: false }
        { name: 'Складные', checked: true }
        { name: 'Электро', checked: false }
      ]
    }, {
      title: 'Цвет' 
      type: 'color'
      items: [
        { name: 'Красный', hexCode: '#fe2a2a', checked: false }
        { name: 'Оранжевый', hexCode: '#feac2a', checked: true }
        { name: 'Голубой', hexCode: '#2fe1ec', checked: false }
        { name: 'Серый', hexCode: '#aeaeae', checked: true }
      ]
    }, {
      title: 'Материал рамы'
      type: 'checkbox'
      items: [
        { name: 'Сталь', checked: false }
        { name: 'Карбон', checked: true }
        { name: 'Алюминий', checked: false }
      ]
    }, {
      title: 'Модельный ряд'
      type: 'checkbox'
      items: [
        { name: '2014', checked: false }
        { name: '2013', checked: false }
        { name: '2012', checked: true }
      ]
    }]

module.exports = CatalogFilterMixin