###* @jsx React.DOM ###

{ PropTypes } = React

CatalogFilterList_Range = React.createClass

  propTypes:
    title:     PropTypes.string.isRequired
    paramName: PropTypes.string.isRequired
    units:     PropTypes.string
    from:      PropTypes.number.isRequired
    to:        PropTypes.number.isRequired

  getInitialState: ->
    from: @props.from
    to:   @props.to

  componentDidMount: ->
    slider = @refs.slider.getDOMNode()

    $(slider)
      .noUiSlider
        start: [@state.from, @state.to]
        connect: true
        range:
          'min': @state.from
          'max': @state.to

    $(slider).on 'slide', @handleSlide

  componentWillUnmount: ->
    slider = @refs.slider.getDOMNode()

    $(slider).on 'off', @handleSlide
    $(slider).destroy()

  render: ->
    `<li className="b-full-filter__item b-full-filter__item_price">
      <div className="b-full-filter__item__title">
        { this.props.title }
      </div>
      <div className="b-full-filter__widget">
        <div className="b-full-filter__slider">
          <div className="b-full-filter__slider__value">
            { this.state.from }
            <span> – </span>
            { this.state.to } <span dangerouslySetInnerHTML={{ __html: this.props.units }} />
          </div>
          <div ref="slider"
               className="b-full-filter__slider__embed" />
        </div>
      </div>
      <input type="hidden"
             name={ this.props.paramName + '[from]'}
             value={ this.state.from } />
      <input type="hidden"
             name={ this.props.paramName + '[to]'}
             value={ this.state.to } />
    </li>`

  handleSlide: (e, range) ->
    @setState
      from: parseInt range[0]
      to:   parseInt range[1]

module.exports = CatalogFilterList_Range