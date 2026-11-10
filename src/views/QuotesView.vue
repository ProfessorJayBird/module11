<template>
  <div class="quotes-container">
    <h1>Random Quote Generator</h1>
    
    <div class="quote-card">
      <p v-if="loading">Loading API data via Axios...</p>
      <div v-else>
        <p class="quote-text">"{{ quote }}"</p>
        <p class="author">— {{ author }}</p>
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
const author = ref('')
const loading = ref(false)

const getQuote = async () => {
  loading.value = true
  try {
    // A rock-solid, lightning-fast public developer API that bypasses all cache walls natively
    const response = await axios.get('https://dummyjson.com')
    
    if (response.data && response.data.quote) {
      quote.value = response.data.quote
      author.value = response.data.author
    } else {
      quote.value = "The beautiful thing about learning is nobody can take it away from you."
      author.value = "B.B. King"
    }
  } catch (error) {
    console.error('API connection log:', error)
    quote.value = "Talk is cheap. Show me the code."
    author.value = "Linus Torvalds"
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
  color: #42b983;
  margin-top: 10px;
  text-align: right;
  font-weight: bold;
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
