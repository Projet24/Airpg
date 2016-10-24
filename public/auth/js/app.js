var app = angular.module('app',['ngRoute']);

app.config(function($routeProvider) {
    $routeProvider
    .when("/", {
        templateUrl: "index.html",
        controller: "IndexCtrl"
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

app.controller("IntroCtrl", function($scope, socket) {
    // Socket listeners
    // ================
    socket.on('server_message', function(data) {
        console.log(data.message);
    });

    socket.emit('client_ping', {
        startTime: new Date()
    });



    // Internal functions
    // ==================
    var internalVar = "";

    var internalFunction = function() {
        return true;
    }

    // Methods published to the scope
    // ==============================
    $scope.email = "default@zilot.ddns.net";

    $scope.angularFunction = function() {
        internalFunction();
    }
});
