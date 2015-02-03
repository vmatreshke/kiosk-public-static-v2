###* @jsx React.DOM ###

CatalogFilterList_SelectedOptions = React.createClass

  render: ->
   `<li className="b-full-filter__item">
      <div className="b-full-filter__item__title">Текущий выбор</div>
      <div className="b-full-filter__widget">
        <span className="b-full-filter__value">Цена от 20 000 до 5000 Р</span>
        <span className="b-full-filter__value">Категория: гибридные</span>
        <span className="b-full-filter__value">Материал: карбон</span>
      </div>
    </li>`

module.exports = CatalogFilterList_SelectedOptions