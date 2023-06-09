<template>
  <div class="chat-window">
    <div v-if="messages" class="messages">
      <ul v-for="message in messages" :key="message.id">
        <li :class="{ received: message.email !== uid, sent: message.email == uid }">
          <span class="name">{{ message.name }}</span>
          <div class="message" @dblclick="createLike(message.id)">
            {{ message.content }}
            <!-- 👇 ここから変更する -->
            <div v-if="message.likes.length" class="heart-container">
              <font-awesome-icon icon="heart" class="heart" />
              <span class="heart-count">{{ message.likes.length }}</span>
            </div>
            <!-- 👆 ここまで追加する -->
          </div>
          <span class="created-at">{{ message.created_at }}</span>
          
        </li>
      </ul>
    </div>
  </div>
</template>
<!-- ...省略 -->


<script>
// ======= 👇 ここから追加する =======
import axios from 'axios' 
// ======= 👆 ここまで追加する =======

export default {
  emits: ['connectCable'],
  props: ['messages'],
  data () {
    return {
      uid: localStorage.getItem('uid')
    }
  },
  // ======= 👇 ここから追加する =======
  methods: {
    async createLike (messageId) {
      try {
        const res = await axios.post(`http://localhost:3000/messages/${messageId}/likes`, {},
          {
            headers: {
              uid: this.uid,
              "access-token": window.localStorage.getItem('access-token'),
              client: window.localStorage.getItem('client')
            }
          })

        if (!res) {
          new Error('いいねできませんでした')
        }
        this.$emit('connectCable')

      } catch (error) {
        console.log(error)
      }
    }
  }
  // ======= 👆 ここまで追加する =======
}
</script>

<!-- ...省略 -->
<style scoped>
  .chat-window {
    background: white;
    padding: 30px 20px;
    border-bottom: 1px solid #eee;
  }
  ul {
    list-style: none;
    margin: 0;
    padding: 0;
  }
  ul li {
    display:inline-block;
    clear: both;
  }
  .received .message {
    background: #eee;
    padding: 10px;
    display: inline-block;
    border-radius: 30px;
    margin-bottom: 2px;
    max-width: 400px;
  }
  .received {
    float: left;
  }
  .sent {
    float: right;
  }
  .sent .message {
    background: #677bb4;
    color: white;
    padding: 10px;
    display: inline-block;
    border-radius: 30px;
    margin-bottom: 2px;
    max-width: 400px;
  }
  .name {
    position: relative;
    margin-right: 6px;
    display: block;
    font-size: 13px;
  }
  .created-at {
    display: block;
    color: #999;
    font-size: 12px;
    margin-bottom: 20px;
    margin-left: 4px;
    margin-top: 3px;
  }
  .messages {
    max-height: 400px;
    overflow: auto;
  }

  /* 👇 ここから追加する */
  .message {
    position: relative;
  }

  .heart-container {
    background: white;
    position: absolute;
    display: flex;
    justify-content: space-around;
    align-items: center;
    border-radius: 30px;
    min-width: 25px;
    border-style: solid;
    border-width: 1px;
    border-color: rgb(245, 245, 245);
    padding: 1px 2px;
    z-index: 2;
    bottom: -7px;
    right: 0px;
    font-size: 9px;
  }
  .heart {
    color: rgb(236, 29, 29);
  }
  .heart-count {
    color: rgb(20, 19, 19);
  }
  .received.message::selection {
    background: #eee;
  }

  .sent .message::selection {
    background: #677bb4;
  }
</style>
