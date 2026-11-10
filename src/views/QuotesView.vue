<template>
  <div class="quotes-container">
    <h1>Random Quote Generator</h1>
    
    <div class="quote-card">
      <!-- Display the quote or a loading message matching rapidapi tutorial workflow -->
      <p v-if="loading">Loading...</p>
      <div v-else>
        <p class="quote-text">"{{ quote }}"</p>
        <p class="author">— {{ author }}</p>
      </div>
    </div>

    <!-- The button that triggers the API call -->
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

// State reactivity variables
const quote = ref('')
const author = ref('')
const loading = ref(false)

// Instructor tutorial method layout for Axios connections
const getQuote = async () => {
  loading.value = true
  try {
    const response = await axios.get('https://rapidapi.com', {
      headers: {
        'x-rapidapi-host': '://rapidapi.com',
        // PASTE YOUR PERSONAL API KEY STRING HERE:
        'x-rapidapi-key': 'YOUR_RAPIDAPI_KEY_HERE'
      }
    })
    
    // Extracting structural data objects to map template parameters
    quote.value = response.data.content
    author.value = response.data.originator.name
  } catch (error) {
    console.error('Error fetching quote:', error)
    quote.value = 'Oops! Something went wrong.'
    author.value = ''
  } finally {
    loading.value = false
  }
}

// Fire an API call on initial component hydration mount
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
