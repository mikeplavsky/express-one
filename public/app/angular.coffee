init = ->

  angular.module( 'phonecat', []).
    config(['$routeProvider',
      ($routeProvider)->
        $routeProvider
          .when( '/phones',
          templateUrl: 'partials/phone-list.html',
          controller: PhoneListCtrl)
          .when( '/phones/:phoneId',
          templateUrl: ''
          controller: null
        ).otherwise({redirectTo:'/phones'})])

  angular.module('timeExampleModule', []).
    factory( 'time', ($timeout) ->
      time = {}
      tick = ->
        time.now = (new Date()).toString()
        $timeout tick, 1000
      tick()
      return time ).
    directive( 'helloWorld', () ->
      restrict: "E"
      scope:
        name: "@"
      templateUrl: 'partials/hello.html')

  window.PhoneListCtrl = ($scope,$http) ->

    $scope.orderProp = 'age'

    $scope.phones = [
      {
        name: "Nexus S",
        snippet: "Fast just got faster with Nexus S",
        age: 0
      },
      {
        name: "Motorolla XOOM with Wi-Fi",
        snippet: "The next generation tablet",
        age: 1
      },
      {
        name: "Motorolla XOOM",
        snippet: "The next generation tablet",
        age: 2
      }
    ]

  window.PhoneListCtrl = ($scope) ->

    $scope.phones = [
      {
        name: "Nexus S",
        snippet: "Fast just got faster with Nexus S",
        age: 0
      },
      {
        name: "Motorolla XOOM with Wi-Fi",
        snippet: "The next generation tablet",
        age: 1
      },
      {
        name: "Motorolla XOOM",
        snippet: "The next generation tablet",
        age: 2
      }
    ]

  window.ClockCtrl = ($scope, time) ->
    $scope.time = time

  window.GreetCtrl = ($scope)->
    $scope.name = 'World'

  window.ListCtrl = ($scope)->

    $scope.names = ['one', 'two', 'three']
    $scope.counter = 1

    $scope.new_name = ->
      $scope.names.push "Name #{$scope.counter}!"
      $scope.counter += 1

    $scope.clear = ->
      $scope.names.pop()

exports.init = init
