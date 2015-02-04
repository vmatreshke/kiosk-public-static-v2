TIMEOUT = 10000
_pendingRequests = {}

abortPendingRequests = (key) ->
  if _pendingRequests[key]
    _pendingRequests[key].abort()
    _pendingRequests[key] = null

vendorKey = ->
  #FIXME: get real vendor key
  'c3d753f03d73251bb4aa707e077ec8e7'

request = (_method, url, data = {}) ->
  headers =
    'X-Requested-With': 'XMLHttpRequest'
    'X-Vendor-Key': vendorKey()

  method = switch _method
    when 'GET'                   then 'GET'
    when 'POST', 'PUT', 'DELETE' then 'POST'
    else 'GET'

  _.extend data, {_method}

  $.ajax
    url: url
    method: method
    data: data
    headers: headers
    timeout: TIMEOUT
    xhrFields:
      withCredentials: true
      crossDomain:     true

getRequest =    (url, data) -> request 'GET', url, data
postRequest =   (url, data) -> request 'POST', url, data
putRequest =    (url, data) -> request 'PUT', url, data
deleteRequest = (url, data) -> request 'DELETE', url, data

Api =

  products:
    filteredCount: (filter) ->
      url  = ApiRoutes.productsFilteredCount filter
      key  = 'productsFilteredCount'

      abortPendingRequests key
      _pendingRequests[key] = getRequest url

module.exports = Api