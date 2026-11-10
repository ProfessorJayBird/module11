<template>
  <button @click="goBack" class="back-btn">⬅ Go Back</button>
</template>

<script setup>
import { useRouter } from 'vue-router'

const router = useRouter()
const goBack = () => {
  router.back()
}
</script>

<style scoped>
.back-btn {
  margin-top: 30px;
  padding: 10px 20px;
  font-size: 14px;
  background-color: #e7e7e7;
  border: none;
  cursor: pointer;
  border-radius: 4px;
}
.back-btn:hover {
  background-color: #d7d7d7;
}
</style>
