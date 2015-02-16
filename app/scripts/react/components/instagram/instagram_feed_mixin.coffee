window.InstagramFeed_Mixin =
  STATE_LOADING: 'loading'
  STATE_LOADED:  'loaded'
  STATE_ERROR:   'error'

  INSTAGRAM_API_URL: 'https://api.instagram.com/v1/'

  _getRequestUrl: ->
    url = @INSTAGRAM_API_URL + 'users/' + @props.userId + '/media/recent/?client_id=' + @props.clientId
    url += '&count=' + @props.limit if @props.limit?
    url

  _loadPhotos: ->
    $.ajax(
      dataType: "jsonp"
      url: @_getRequestUrl()
      success: (photos) =>
        if @isMounted() && photos?
          @setState {
            currentState: @STATE_LOADED
            photos: photos.data
            profileUrl: 'http://instagram.com/' + photos.data[0].user.full_name
            hashtag: '#'+photos.data[0].user.full_name
          }
      error: (data) =>
        @_activateErrorState()
    )

  _activateErrorState: -> @setState(currentState: @STATE_ERROR) if @isMounted()
