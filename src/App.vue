<template>
  <div id="app">
    <nav class="navbar">
      <router-link to="/about" class="nav-link">About</router-link> |
      <router-link to="/quotes" class="nav-link">Random Quotes</router-link> |
      <router-link to="/contact" class="nav-link">Contact</router-link>
    </nav>
    <main class="content-area">
      <router-view />
    </main>
  </div>
</template>

<style>
#app {
  font-family: Arial, sans-serif;
  text-align: center;
  margin-top: 40px;
}
.navbar {
  padding: 20px;
  background-color: #f8f9fa;
  margin-bottom: 30px;
}
.nav-link {
  font-weight: bold;
  color: #2c3e50;
  text-decoration: none;
  margin: 0 10px;
}
.nav-link.router-link-exact-active {
  color: #42b983;
}
.content-area {
  padding: 20px;
  max-width: 600px;
  margin: 0 auto;
}
</style>
