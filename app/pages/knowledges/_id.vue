<template>
  <div>
    <h1>{{id}}</h1>
  </div>
</template>

<script>
export default {
  async asyncData ({ params }) {
    const { id } = params
    return {
      id
    }
  }
}
</script>