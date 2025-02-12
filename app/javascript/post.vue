<template>
    <div class="post">
        <h2>{{ post.title }}</h2>
        <p class="content">{{ post.content }}</p>

        <div class="tags" v-if="post.tags.length">
            <strong>Tags:</strong>
            <span v-for="(tag, index) in post.tags" :key="index" class="tag">
                {{ tag.name }}
            </span>
        </div>
        <p v-else class="no-tags">No tags available</p>
    </div>
</template>

<script>
export default {
    props: {
        post: {
            type: Object,
            required: true,
        }
    }
}
</script>

<style scoped>
.post {
    background: #fff;
    padding: 15px;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    margin-bottom: 15px;
    text-align: left;
}

h2 {
    margin-bottom: 10px;
    font-size: 20px;
    color: #333;
}

.content {
    font-size: 16px;
    color: #555;
    margin-bottom: 10px;
}

.tags {
    margin-top: 10px;
    font-size: 14px;
}

.tag {
    display: inline-block;
    background: #007bff;
    color: white;
    padding: 5px 10px;
    margin-right: 5px;
    border-radius: 5px;
    font-size: 14px;
}

.no-tags {
    font-size: 14px;
    color: #888;
    font-style: italic;
}
</style>