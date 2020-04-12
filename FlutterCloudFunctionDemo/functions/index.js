const functions = require('firebase-functions');
const admin = require('firebase-admin');


admin.initializeApp(functions.config().functions);

var newData;

exports.messageTrigger = functions.firestore.document('Users/{userid}/books/{bookid}').onUpdate( async (snapshot, context) => {
	if(snapshot.empty) {
		console.log("No Devices");
		return;
	}
	var tokens = [];
	newData = snapshot.data;

	const deviceTokens = await admin.firestore().collection("UserList").get();
	for(var token of deviceTokens.docs) {
		tokens.push(token.data().device_token);
	}
	tokens = tokens.filter(x => x !== undefined);
	var payload = {
		notification : {title: 'Library Assistant', body: 'The due dates of the books have been updated. Open the app to check them.', sound: 'default'},
		data : {click_action: 'FLUTTER_NOTIFICATION_CLICK', message: 'Sample Push Message'},
	};
	try {
		const response = await admin.messaging().sendToDevice(tokens, payload);
		console.log("Notification sent successfully to ");
		console.log(tokens);
	}catch (err) {
		console.log(tokens);
		console.log('Error sending notification');
	}
});

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//  response.send("Hello from Firebase!");
// });


