###* @jsx React.DOM ###
Api = require '../../../api/api'
{ PropTypes } = React

TIMEOUT = 3000
LOADING_STATE = 'loading'
LOADED_STATE  = 'loaded'
ERROR_STATE   = 'error'

FilteredCountTooltip = React.createClass

  propTypes:
    title:    PropTypes.string
    filter:   PropTypes.string.isRequired
    timeout:  PropTypes.number
    position: PropTypes.shape(
      left: PropTypes.number.isRequired
      top:  PropTypes.number.isRequired
    ).isRequired

  getDefaultProps: ->
    title: 'Показать'
    timeout: TIMEOUT
    position: { left: 0, top: 0 }

  getInitialState: ->
    currentState: LOADING_STATE
    count:        null

  componentDidMount: ->    
    @timeout = setTimeout @props.onClose, @props.timeout

    Api.products.filteredCount @props.filter
      .then (count) =>
        @setState
          currentState: LOADED_STATE
          count:        count
      .fail @activateErrorState

  componentWillUnmount: ->
    clearTimeout @timeout if @timeout?

  render: ->
    `<div style={ this.getStyles() }
          className="b-tooltip">
      { this.renderContent() }
    </div>`

  renderContent: ->
    switch @state.currentState
      when LOADING_STATE then 'Загрузка..'
      when ERROR_STATE   then 'Ошибка загрузки:('
      when LOADED_STATE
        `<span>
          Выбрано вариантов: { this.state.count } <a href={ '?' + this.props.filter }>{ this.props.title }</a>
        </span>`

  activateErrorState: -> @setState(currentState: ERROR_STATE)

  getStyles: ->
    # Here we can calculate something more than just passing keys from @props.position
    { left, top } = @props.position

    { left, top }

module.exports = FilteredCountTooltip