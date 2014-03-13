# the string is the name that accesses the module

BookAppCtrls = angular.module("BookAppCtrls", [])

BookAppCtrls.controller("BooksCtrl", ["$scope",
"$http", "$routeParams", "BookRes",
  ($scope, $http, $routeParams, BookRes )->
    $scope.message = "Hello world"
    bookId = $routeParams.id
    $scope.fakeBooks = [
        id: 1
        title: "Happy Tails"
        description: "The tales of two foxes on the run"
      ,
        id: 2
        title: "Boggle Adventures"
        description: "Games, games, games!"
        ]
    console.log $scope.fakeBooks
    $scope.selectedBook = $scope.fakeBooks[bookId-1]

    $http.get("/books.json").success(
      (newBooks)->
        console.log(newBooks)
        $scope.newBooks = $scope.fakeBooks.concat(newBooks)
      )
    $scope.newBook = {title: "Title Goes"}
    $scope.saveBook = ()->
      $http({method: "post",url: "/books", data: {book: {name: $scope.mock_Book}}
      }).success((data)->
          console.log(data)
      )
    BookRes.query(
      (data)->
        console.log(data)
    )
])