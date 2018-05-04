<template>
  <p class="">
    {{ overview }}
  </p>
</template>

<script>
export default {
  props: {
    overview: {
      type: String,
      required: false
    }
  }
}
</script>