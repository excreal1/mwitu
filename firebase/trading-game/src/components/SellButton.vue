<template>
  <button @click="sell">Sell</button>
</template>

<script>
import firebase from 'firebase/app';
import 'firebase/database';

export default {
  methods: {
    sell() {
      firebase.database().ref('trading').update({
        action: 'sell',
        timestamp: firebase.database.ServerValue.TIMESTAMP
      });
    }
  }
};
</script>
