app.controller("IntroCtrl", function($scope, $route, $location, socket) {
    // Socket listeners
    // ================

    // Internal functions
    // ==================

    // Methods published to the scope
    // ==============================
    $scope.isLoaded = "IntroLoaded";

    $scope.makeCharacter = function() {
        $location.url('/airpg');
    };

});
