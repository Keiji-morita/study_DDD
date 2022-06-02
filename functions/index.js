const functions = require('firebase-functions');
// firebase-adminもnpm installしておいてください！
const admin = require('firebase-admin');

admin.initializeApp();

const db = admin.firestore();

exports.writeUserInfo = functions.firestore.document('private/users/{userId}/writeOnly').onCreate(
  (snap, context) => {
    const doc = snap.data();

    if (doc == null) {
      console.log('doc was null...');
      return;
    }

    return db.doc(`private/users/${doc.userId}/readOnly`).set({
      'userId': doc.userId,
      'name': doc.name,
    },
    {merge: true}
    );
  }
);

exports.updateUserInfo = functions.firestore.document('private/users/{userId}/writeOnly').onUpdate(
  (snap, context) => {
    const doc = snap.after.data();

    if (doc == null) {
      console.log('doc was null...');
      return;
    }

    return db.doc(`private/users/${doc.userId}/readOnly`).set({
      'message': doc.message,
      'userImage': doc.userImage,
    },
    {merge: true}
    );
  }
);