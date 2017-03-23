var usersApp = angular.module('usersApp', []);
console.log("Loading table...");
usersApp.controller('UsersListCrtl', function($scope, $http) {
	$http.get('http://155.246.213.143:3000/users').success(function(data) {
		$http.get('http://155.246.213.143:3000/user_info/' + data.user_id).success(function(fullData) {
			$scope.userData = fullData;
		});
	});
});