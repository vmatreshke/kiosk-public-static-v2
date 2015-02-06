###* @jsx React.DOM ###

{ PropTypes } = React

DesignSettings_Range = React.createClass

  propTypes:
    value:    PropTypes.number.isRequired
    from:     PropTypes.number
    to:       PropTypes.number
    step:     PropTypes.number
    onChange: PropTypes.func.isRequired

  getDefaultProps: ->
    from: 0
    to:   1
    step: .1

  componentDidMount: ->
    slider = @getDOMNode()

    $(slider).noUiSlider
      start: @props.value
      step:  @props.step
      range:
        min: @props.from
        max: @props.to
    
    $(slider).on 'change', @handleChange

  componentWillUnmount: ->
    slider = @getDOMNode()

    $(slider).off 'change', @handleChange
    $(slider).destroy()

  render: ->
    `<div />`

  handleChange: (e, value) ->
    @props.onChange parseFloat value

module.exports = DesignSettings_Range