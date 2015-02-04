Api = require '../../api/api'

ProductsViewActions =

  filteredCount: (filter) ->
    Api.products.filteredCount filter

module.exports = ProductsViewActions