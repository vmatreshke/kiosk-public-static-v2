ApiRoutes =

  productsFilteredCount: (filter) ->
    gon.vendor_api_root_url + '/v1/products/filtered/count?' + filter

module.exports = ApiRoutes