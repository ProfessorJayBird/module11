<template>
  <div>
    <h1>Contact Details</h1>
    <div class="contact-card">
      <p><strong>Name:</strong> Jay Pr</p>
      <p><strong>Email:</strong> jaypr@example.com</p>
    </div>
    <GoBackButton />
  </div>
</template>

<script setup>
import GoBackButton from '../components/GoBackButton.vue'
</script>

<style scoped>
.contact-card {
  border: 1px solid #ddd;
  padding: 20px;
  border-radius: 8px;
  margin-top: 20px;
  display: inline-block;
}
</style>
