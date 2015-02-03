###* @jsx React.DOM ###

{ PropTypes } = React

CatalogFilterList_Range = React.createClass

  propTypes:
    title: PropTypes.string.isRequired
    units: PropTypes.string
    from:  PropTypes.number.isRequired
    to:    PropTypes.number.isRequired

  getInitialState: ->
    from: @props.from
    to:   @props.to

  componentDidMount: ->
    slider = @refs.slider.getDOMNode()

    $(slider)
      .noUiSlider
        start: [@props.from, @props.to]
        connect: true
        range:
          'min': @props.from
          'max': @props.to

    $(slider).on 'slide', @handleSlide

    # .on
    #     slide: ->
    #       console.log 'slide', arguments
    #     set: ->
    #       console.log 'set', arguments
    #     change: ->
    #       console.log 'change', arguments

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
            { this.state.to } <span dangerouslySetInnerHTML={{ __html: this.props.units}} />
          </div>
          <div ref="slider"
               className="b-full-filter__slider__embed" />
        </div>
      </div>
    </li>`

  handleSlide: (e, range) ->
    @setState
      from: parseInt range[0]
      to:   parseInt range[1]

module.exports = CatalogFilterList_Range