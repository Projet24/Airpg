app.controller("MainCtrl", function($scope, $route, $location, socket) {
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

    $scope.displayNav = function() {
        return $location.url() != '/introduction';
    };
});
