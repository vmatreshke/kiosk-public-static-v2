###* @jsx React.DOM ###

window.ValueSlider = React.createClass
  propTypes:
    name:  React.PropTypes.string.isRequired
    range: React.PropTypes.object.isRequired
    step:  React.PropTypes.number.isRequired
    start: React.PropTypes.string

  getDefaultProps: ->
    range:
      min: 0
      max: 1
    value: 0
    step: .1

  componentDidMount: ->
    domNode = $(@getDOMNode())
    
    domNode.noUiSlider(
      start: @props.value
      step: @props.step
      range: @props.range
    )

    domNode.on
      slide: =>
        currentValue = domNode.val()
        @setState value: currentValue

        if @props.onChange
          @props.onChange @props.name, currentValue

  
  render: ->
    return `<div/>`