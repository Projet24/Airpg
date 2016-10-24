var app = angular.module('app',['ngRoute']);

app.config(function($routeProvider) {
    $routeProvider
    .when("/airpg", {
        templateUrl: "ng-templates/introduction.html",
        controller: "IntroCtrl"
    });
});

app.factory('socket', function ($rootScope) {
    var socket = io();
    return {
        on: function (eventName, callback) {
            socket.on(eventName, function () {
                var args = arguments;
                $rootScope.$apply(function () {
                    callback.apply(socket, args);
                });
            });
        },
        emit: function (eventName, data, callback) {
            socket.emit(eventName, data, function () {
                var args = arguments;
                $rootScope.$apply(function () {
                    if (callback) {
                        callback.apply(socket, args);
                    }
                });
            })
        }
    };
});
