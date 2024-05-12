// Import the functions you need from the SDKs you need

// firebase.js
import firebase from 'firebase/app';
import 'firebase/database'; // Import the Firebase Realtime Database module if you're using the database

const firebaseConfig = {
  apiKey: "AIzaSyAC3gUEkddYUozXXzbFryI56pZdQNgda34",
  authDomain: "test-8a205.firebaseapp.com",
  databaseURL: "https://test-8a205-default-rtdb.firebaseio.com",
  projectId: "test-8a205",
  storageBucket: "test-8a205.appspot.com",
  messagingSenderId: "93925993370",
  appId: "1:93925993370:web:6c01853d8e01e9e029a823"
};

const firebaseApp = firebase.initializeApp(firebaseConfig);

export const db = firebaseApp.database();