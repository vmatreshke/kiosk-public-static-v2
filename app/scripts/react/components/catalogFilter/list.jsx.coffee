###* @jsx React.DOM ###

CatalogFilterList_SelectedOptions = require './list/selectedOptions'
CatalogFilterList_Checkbox        = require './list/checkbox'
CatalogFilterList_Radio           = require './list/radio'
CatalogFilterList_Range           = require './list/range'
CatalogFilterList_Color           = require './list/color'
{ PropTypes } = React

CatalogFilterList = React.createClass

  propTypes:
    options:         PropTypes.array.isRequired
    selectedOptions: PropTypes.array.isRequired
    filterName:      PropTypes.string.isRequired

  render: ->
    `<ul className="b-full-filter__list-wrap">
      <CatalogFilterList_SelectedOptions selectedOptions={ this.props.selectedOptions } />
      { this.renderListItems() }
    </ul>`

  renderListItems: ->
    that = @
    listItems = @props.options.map (item, i) ->
      switch item.type
        when 'checkbox'
          { title, paramName, items } = item

          `<CatalogFilterList_Checkbox
               title={ title }
               paramName={ paramName }
               filterName={ that.props.filterName }
               items={ items }
               key={ i } />`
        when 'radio'
          { title, value, paramName, items } = item

          `<CatalogFilterList_Radio
               title={ title }
               value={ value }
               paramName={ paramName }
               filterName={ that.props.filterName }
               items={ items }
               key={ i } />`
        when 'range'
          { title, paramName, units, valueFrom, valueTo, from, to } = item

          `<CatalogFilterList_Range
               title={ title }
               paramName={ paramName }
               filterName={ that.props.filterName }
               units={ units }
               valueFrom={ valueFrom }
               valueTo={ valueTo }
               from={ from }
               to={ to }
               key={ i } />`
        when 'color'
          { title, paramName, items } = item

          `<CatalogFilterList_Color
              title={ title }
              paramName={ paramName }
              filterName={ that.props.filterName }
              items={ items }
              key={ i } />`
        else console.warn? 'Unknown item type of CatalogFilterList component', item

module.exports = CatalogFilterList