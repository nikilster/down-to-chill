Parse.Cloud.define("verifyPhoneNumber", function(request, response) {
  
  console.log("Received a new text from: " + request.params.From);
  
  //So we can create users
  Parse.Cloud.useMasterKey();

  //TODO
  //Check if we already have a user with that phone number

  var user = new Parse.User();

  //TODO
  //Generate a random username
  user.set("username", "my name");
  //TODO
  //Use the same password for everyone
  user.set("password", "my pass");
  //TODO
  //Generate an email for them based off of the username
  user.set("email", "email@example.com");
   
  //TODO
  //Clean the phone!
  user.set("phone", request.params.From);
   
  //TODO
  //Either update the user or create a new user
  user.signUp(null, {
    success: function(user) {

      //TODO
      //Empty response - to twilio
      //Can set to test
      response.success();
    },
    error: function(user, error) {

      //TODO
      //Log an error so we know!
      // Show the error message somewhere and let the user try again.
      alert("Error: " + error.code + " " + error.message);
      response.success();
    }
  });

});