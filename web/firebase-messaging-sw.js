importScripts("https://www.gstatic.com/firebasejs/10.7.0/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/10.7.0/firebase-messaging-compat.js");

firebase.initializeApp({
//  apiKey: "YOUR_API_KEY",
//  authDomain: "YOUR_AUTH_DOMAIN",
//  projectId: "YOUR_PROJECT_ID",
//  messagingSenderId: "YOUR_SENDER_ID",
//  appId: "YOUR_APP_ID",
  apiKey: "AIzaSyA3GtNFepz9IqbTnK8bAcklXpqs_zeSKYY",
  authDomain: "lost-and-found-634f2.firebaseapp.com",
  projectId: "lost-and-found-634f2",
  storageBucket: "lost-and-found-634f2.firebasestorage.app",
  messagingSenderId: "790518871168",
  appId: "1:790518871168:web:7057ef1f9b4474d0fde265",
  measurementId: "G-52FEQLV7W9"
});

const messaging = firebase.messaging();