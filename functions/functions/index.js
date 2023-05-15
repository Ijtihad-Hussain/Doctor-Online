const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.sendAppointmentNotification = functions.firestore
  .document('appointments/{appointmentId}')
  .onCreate(async (snapshot, context) => {
    const appointmentData = snapshot.data();
    const patientName = appointmentData.patientName;
    const appointmentTime = appointmentData.appointmentTime;

    // Retrieve the user's FCM token from Firestore using their user ID
    const userId = appointmentData.userId;
    const userSnapshot = await admin.firestore().collection('users').doc(userId).get();
    const user = userSnapshot.data();
    const fcmToken = user.fcmToken;

    // Send an FCM notification to the user
    const message = {
      token: fcmToken,
      notification: {
        title: 'New Appointment Booked',
        body: `Hi ${patientName}, your appointment is scheduled for ${appointmentTime}.`
      },
      data: {
        type: 'new_appointment',
        appointmentId: snapshot.id,
        patientName: patientName,
        appointmentTime: appointmentTime
      }
    };

    await admin.messaging().send(message);
  });

