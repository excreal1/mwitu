<template>
    <div class="chat-container">
      <div class="chat-messages">
        <div v-for="(message, index) in messages" :key="index" class="message">
          <strong>{{ message.user }}:</strong> {{ message.text }}
        </div>
      </div>
      <input type="text" v-model="newMessage" @keypress.enter="sendMessage" placeholder="Type your message...">
    </div>
  </template>
  
  <script>
  import firebase from 'firebase/app';
  import 'firebase/database';
  
  export default {
    data() {
      return {
        messages: [],
        newMessage: '',
        database: null,
      };
    },
    created() {
      // Initialize Firebase
      const firebaseConfig = {
        // Your Firebase configuration
      };
      firebase.initializeApp(firebaseConfig);
  
      // Get a reference to the Firebase Realtime Database service
      this.database = firebase.database();
  
      // Listen for new messages in the database
      this.database.ref('messages').on('child_added', snapshot => {
        const message = snapshot.val();
        this.messages.push(message);
      });
    },
    methods: {
      sendMessage() {
        if (this.newMessage.trim() !== '') {
          // Push new message to the database
          this.database.ref('messages').push({
            user: 'Anonymous',
            text: this.newMessage.trim()
          });
  
          // Clear the input field
          this.newMessage = '';
        }
      }
    }
  };
  </script>
  
  <style>
  .chat-container {
    max-width: 400px;
    margin: auto;
  }
  
  .chat-messages {
    margin-bottom: 20px;
  }
  
  .message {
    margin-bottom: 5px;
  }
  </style>
  