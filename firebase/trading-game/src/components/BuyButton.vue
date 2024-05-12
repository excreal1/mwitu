<template>
  <button @click="buy">Buy</button>
</template>

<script>
// Import specific Firebase modules using named imports
import { database, ServerValue } from 'firebase/app';
import 'firebase/database';

export default {
  methods: {
    buy() {
      // Use imported modules
      database().ref('trading').update({
        action: 'buy',
        timestamp: ServerValue.TIMESTAMP
      });
    }
  }
};
</script>
