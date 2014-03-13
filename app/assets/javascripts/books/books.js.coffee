BookApp = angular.module "BookApp", ["BooksService", "BookAppCtrls", "BookRouter"]

# Include the angular router
BookRouter = angular.module "BookRouter", ["ngRoute"]

# Configure the routes
BookRouter.config(["$routeProvider",
  ($routeProvider)->
    $routeProvider.when("/",
      templateUrl: "/books"
      controller: "BooksCtrl"
    ).when("/books/:id",
      templateUrl: "/books/show"
      controller: "BooksCtrl"
    )
])

BookApp.config(["$httpProvider",($httpProvider)->
     $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
]);