init = ->

  angular.module('timeExampleModule', []).
    factory 'time', ($timeout) ->
      time = {}
      tick = ->
        time.now = (new Date()).toString()
        $timeout tick, 1000
      tick()
      return time

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
