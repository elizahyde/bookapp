BooksService = angular.module "BooksService", ["ngResource"]

BooksService.factory("BookRes", ["$resource",
  ($resource)->
    return $resource("/books/:id.json", {id: "@id"}, {update: {method: "PATCH"}})
])