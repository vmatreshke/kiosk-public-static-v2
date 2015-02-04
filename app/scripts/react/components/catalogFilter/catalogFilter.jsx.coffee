###* @jsx React.DOM ###

CatalogFilterMixin = require './mixins/catalogFilter'
CatalogFilterList  = require './list'
{ PropTypes } = React

window.CatalogFilter = React.createClass
  mixins: [CatalogFilterMixin]

  propTypes:
    options:    PropTypes.array.isRequired
    filterName: PropTypes.string

  getDefaultProps: ->
    filterName: 'f'

  render: ->
   `<div className="b-full-filter">
      <input className="b-full-filter__toggle" id="filter-toggle" type="checkbox" />
      <label className="b-full-filter__trigger" htmlFor="filter-toggle">
        <span className="b-btn b-full-filter__trigger__action b-full-filter__trigger__action_open">
          Показать фильтр
        </span>
        <span className="b-btn b-full-filter__trigger__action b-full-filter__trigger__action_close">
          Скрыть фильтр
        </span>
      </label>
      <CatalogFilterList
          options={ this.props.options }
          filterName={ this.props.filterName } />
    </div>`

module.exports = CatalogFilter