###* @jsx React.DOM ###

{ PropTypes } = React

CatalogFilterList_Range = React.createClass

  propTypes:
    title:      PropTypes.string.isRequired
    paramName:  PropTypes.string.isRequired
    filterName: PropTypes.string.isRequired
    units:      PropTypes.string
    valueFrom:  PropTypes.number
    valueTo:    PropTypes.number
    from:       PropTypes.number.isRequired
    to:         PropTypes.number.isRequired

  getInitialState: ->
    from: @props.valueFrom || @props.from
    to:   @props.valueTo   || @props.to

  componentDidMount: ->
    slider = @refs.slider.getDOMNode()

    $(slider).noUiSlider
      start: [@state.from, @state.to]
      range: 
        min: @props.from
        max: @props.to
      connect: true

    $(slider).on 'slide',  @handleSlide
    $(slider).on 'change', @handleChange

  componentWillUnmount: ->
    slider = @refs.slider.getDOMNode()

    $(slider).off 'slide',  @handleSlide
    $(slider).off 'change', @handleChange
    $(slider).destroy()

  render: ->
    `<li className="b-full-filter__item b-full-filter__item_price">
      <div className="b-full-filter__item__title">
        { this.props.title }
      </div>
      <div className="b-full-filter__widget"
           onClick={ this.handleClick }>
        <div className="b-full-filter__slider">
          <div ref="rangeValue"
               className="b-full-filter__slider__value">
            { this.state.from }
            <span className="slider-divider"> – </span>
            { this.state.to } <span dangerouslySetInnerHTML={{ __html: this.props.units }} />
          </div>
          <div ref="slider"
               className="b-full-filter__slider__embed" />
        </div>
      </div>
      <input type="hidden"
             name={ this.props.filterName + '[' + this.props.paramName + '][from]'}
             value={ this.state.from } />
      <input type="hidden"
             name={ this.props.filterName + '[' + this.props.paramName + '][to]'}
             value={ this.state.to } />
    </li>`

  handleSlide: (e, range) ->
    @setState
      from: parseInt range[0]
      to:   parseInt range[1]

  handleChange: ->
    elRect     = @refs.rangeValue.getDOMNode().getBoundingClientRect()
    offsetLeft = 15

    filter   = $(@getDOMNode()).closest('form').serialize()
    position =
      left: elRect.right + offsetLeft
      top:  elRect.top + document.body.scrollTop - elRect.height / 2

    KioskEvents.emit KioskEvents.keys.commandTooltipShow(), position, filter

module.exports = CatalogFilterList_Range