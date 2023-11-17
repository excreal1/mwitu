
import { getAuth} from "firebase/auth"
import { initializeApp } from "firebase/app";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyDBpHDF0mxITPmrRKQBQLKsa3llnV2DLZA",
  authDomain: "mwitu-d9f4d.firebaseapp.com",
  projectId: "mwitu-d9f4d",
  storageBucket: "mwitu-d9f4d.appspot.com",
  messagingSenderId: "115335347541",
  appId: "1:115335347541:web:8d61622b2594409e4cc3dc"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);

// Initialize Firebase Authentication and get a reference to the service

// export
export const auth = getAuth(app);
// initialize this way ^^^