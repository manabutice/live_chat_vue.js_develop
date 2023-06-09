<template>
<div>
  コンポーネントから表示されています。
  <p>{{ message }}</p>
  <button @click="onclick">親メソッドを実行するボタン</button>
</div>
</template>

<script>
export default {
  props: ['message'],
  methods: {
    onclick() {
      this.$emit('toggle')
    }
  }
}
</script>