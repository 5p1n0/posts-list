<template>
    <div id="app">
        <div class="container">
            <a href="/"><h1>Post Search</h1></a>

            <form @submit.prevent="fetchPosts" class="search-form">
                <label for="search">Search posts by content or tags:</label>
                <div class="input-group">
                    <input type="text" id="search" v-model="searchTerm" placeholder="Enter search term..." />
                    <button type="submit">Search</button>
                </div>
            </form>

            <div class="posts">
                <post v-for="post in posts" :key="post.id" :post="post"></post>
            </div>
        </div>
    </div>
</template>

<script>
import Post from './post'

export default {
    components: { Post },

    data() {
        return {
            posts: [],
            searchTerm: ""
        }
    },

    methods: {
        fetchPosts() {
            let url = this.searchTerm.trim()
                ? `/api/posts?term=${encodeURIComponent(this.searchTerm)}`
                : `/api/posts`;

            fetch(url)
                .then(response => response.json())
                .then(data => {
                    this.posts = data;
                })
                .catch(error => console.error("Error fetching posts:", error));
        }
    },
}
</script>

<style scoped>
.container {
    max-width: 600px;
    margin: 40px auto;
    padding: 20px;
    text-align: center;
    background: #f9f9f9;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

h1 {
    margin-bottom: 20px;
    font-size: 24px;
}

h1 a {
  text-decoration: none;  /* Removes underline */
  color: #007bff;
  font-weight: bold;
  transition: color 0.3s;
}

.search-form {
    display: flex;
    flex-direction: column;
    gap: 10px;
    margin-bottom: 20px;
}

label {
    font-size: 16px;
    font-weight: bold;
}

.input-group {
    display: flex;
    gap: 10px;
}

input {
    flex: 1;
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

button {
    padding: 10px 20px;
    font-size: 16px;
    color: white;
    background: #007bff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background 0.3s;
}

button:hover {
    background: #0056b3;
}

.posts {
    margin-top: 20px;
}
</style>