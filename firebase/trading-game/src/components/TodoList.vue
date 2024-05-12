<!-- TodoList.vue -->
<template>
    <div>
      <h2>Todo List</h2>
      <ul>
        <li v-for="(todo, index) in todos" :key="index">
          <input type="checkbox" v-model="todo.completed" @change="toggleCompletion(todo)">
          <span :class="{ 'completed': todo.completed }">{{ todo.text }}</span>
          <button @click="deleteTodo(index)">Delete</button>
        </li>
      </ul>
      <input type="text" v-model="newTodo" @keyup.enter="addTodo">
      <button @click="addTodo">Add Todo</button>
    </div>
  </template>
  
  <script>
  import { ref } from 'vue';
  import { db } from '@/firebase';
  
  export default {
    name: 'TodoList',
    data() {
      return {
        todos: [],
        newTodo: ''
      };
    },
    mounted() {
      db.ref('todos').on('value', snapshot => {
        const data = snapshot.val();
        if (data) {
          this.todos = Object.values(data);
        }
      });
    },
    methods: {
      addTodo() {
        if (this.newTodo.trim() !== '') {
          db.ref('todos').push({
            text: this.newTodo,
            completed: false
          });
          this.newTodo = '';
        }
      },
      toggleCompletion(todo) {
        db.ref(`todos/${todo['.key']}`).update({
          completed: todo.completed
        });
      },
      deleteTodo(index) {
        const todo = this.todos[index];
        db.ref(`todos/${todo['.key']}`).remove();
      }
    }
  };
  </script>
  
  <style>
  .completed {
    text-decoration: line-through;
  }
  </style>
  