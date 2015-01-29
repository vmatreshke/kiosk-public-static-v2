###* @jsx React.DOM ###

window.Toggle = React.createClass
  propTypes:
    name: React.PropTypes.string.isRequired
    value: React.PropTypes.bool

  getDefaultProps: ->
    value: false

  handleChange: (e)->
    toggleState = $(e.target).prop 'checked'
    @setState value: toggleState

    if @props.onChange
      @props.onChange @props.name, toggleState
  
  render: ->
    return `<label className="b-design-option__cbox">
      <input type="checkbox" defaultChecked={this.props.value} onChange={this.handleChange}/>
      {this.props.name}
    </label>`
