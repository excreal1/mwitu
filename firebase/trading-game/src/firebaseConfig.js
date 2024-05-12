
import firebase from 'firebase/app';
import 'firebase/database';


// Add config here

const firebaseConfig = {
    apiKey: "AIzaSyAC3gUEkddYUozXXzbFryI56pZdQNgda34",
    authDomain: "test-8a205.firebaseapp.com",
    databaseURL: "https://test-8a205-default-rtdb.firebaseio.com",
    projectId: "test-8a205",
    storageBucket: "test-8a205.appspot.com",
    messagingSenderId: "93925993370",
    appId: "1:93925993370:web:6c01853d8e01e9e029a823"
  };

//end here

firebase.initializeApp(firebaseConfig);

export default firebase;
