<template>
  <div class="quotes-container">
    <h1>Random Quote Generator</h1>
    
    <div class="quote-card">
      <p v-if="loading">Loading API data via Axios...</p>
      <div v-else>
        <p class="quote-text">"{{ quote }}"</p>
        <p class="author">— {{"Unknown"}}</p>
      </div>
    </div>

    <button @click="getQuote" class="api-btn">Get New Quote</button>
    
    <div>
      <GoBackButton />
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'
import GoBackButton from '../components/GoBackButton.vue'

const quote = ref('')
const loading = ref(false)

// Uses a completely free, open public endpoint with Axios
const getQuote = async () => {
  loading.value = true
  try {
    const response = await axios.get('https://allorigins.win')
    // Extracts the slip data object without requiring any security headers
    if (response.data && response.data.slip) {
      quote.value = response.data.slip.advice
    } else {
      // Fallback safe string if network response delays
      quote.value = "The beautiful thing about learning is nobody can take it away from you."
    }
  } catch (error) {
    console.error('API connection log:', error)
    quote.value = "Talk is cheap. Show me the code."
  } finally {
    loading.value = false
  }
}

onMounted(() => {
  getQuote()
})
</script>

<style scoped>
.quotes-container {
  max-width: 550px;
  margin: 0 auto;
  text-align: center;
}
.quote-card {
  background: #f9f9f9;
  border-radius: 8px;
  padding: 25px;
  border: 1px solid #eee;
  margin: 20px 0;
  min-height: 100px;
}
.quote-text {
  font-size: 18px;
  color: #333;
  line-height: 1.5;
}
.author {
  font-style: italic;
  color: #555;
  margin-top: 10px;
  text-align: right;
}
.api-btn {
  background-color: #42b983;
  color: white;
  border: none;
  padding: 10px 20px;
  font-size: 16px;
  border-radius: 4px;
  cursor: pointer;
}
.api-btn:hover {
  background-color: #359a6c;
}
</style>
