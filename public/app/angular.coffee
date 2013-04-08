init = ->

  angular.module('timeExampleModule', []).
    factory 'time', ($timeout) ->
      time = {}
      tick = ->
        time.now = (new Date()).toString()
        $timeout tick, 1000
      tick()
      return time

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
