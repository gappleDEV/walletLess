var usersApp = angular.module('usersApp', ['ngRoute']);
console.log("Loading table...");
usersApp.controller('usersListCrtl', function($scope, $http) {
	$http.get('http://155.246.138.85:3000/user_info').success(function(data) {
		console.log(data);
		$scope.userData = data;
	});
});