###* @jsx React.DOM ###

ProductsViewActions = require '../../../actions/view/products'
{ PropTypes } = React

LOADING_STATE = 'loading'
LOADED_STATE  = 'loaded'
ERROR_STATE   = 'error'

Tooltip = React.createClass

  propTypes:
    title:    PropTypes.string
    # url:      PropTypes.string
    filter:   PropTypes.object
    position: PropTypes.shape(
      left: PropTypes.number
      top:  PropTypes.number
    ).isRequired

  getDefaultProps: ->
    title: 'Показать'
    # url:   '#'

  getInitialState: ->
    currentState: LOADING_STATE
    count:        null

  componentDidMount: ->
    ProductsViewActions.filteredCount()
      .then (count) =>
        @setState
          currentState: LOADED_STATE
          count:        count
      .fail @activateErrorState

  render: ->
    `<div className="b-tooltip">
      { this.renderContent() }
    </div>`

  renderContent: ->
    switch @state.currentState
      when LOADING_STATE then 'Загрузка..'
      when ERROR_STATE   then 'Ошибка загрузки:('
      when LOADED_STATE
        `<span>
          { this.props.title } <a href={ this.props.url }>{ this.state.count } вариантов</a>
        </span>`

  activateLoadedState: -> @setState(currentState: LOADED_STATE)
  activateErrorState:  -> @setState(currentState: ERROR_STATE)

module.exports = Tooltip