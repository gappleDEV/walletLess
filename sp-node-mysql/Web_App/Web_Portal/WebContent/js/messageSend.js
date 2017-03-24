// Defining angularjs application.
var postApp = angular.module('sendMessage', []);
// Controller function and passing $http service and $scope var.
postApp.controller('sendMessageController', function($scope, $http) {
	// calling our submit function.
	$scope.submitForm = function() {
		var myData = {};
		myData["message_id"] = 13;
		myData["sender_id"] = "newEmail";
		myData["receiver_id"] = document.getElementById("username").value;
		myData["subject"] = document.getElementById("subject").value;
		myData["body"] = document.getElementById("messageBody").value;
		myData["create_date"] = new Date();
		myData["is_read"] = 0;

		// Posting data to php file
		$http({
			method : 'POST',
			url : 'http://155.246.138.85:3000/messages',
			data : myData
		}).success(function(data) {
			if (data.errors) {
				// Showing errors.
				console.log("Error");
				console.log(data);
			} else {
				console.log("Success");
				console.log(data);
			}
		});
	};
});
