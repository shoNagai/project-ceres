<template>
  <section>
    <a :href="`${getLink}`" class="" >
      <knowledge-card-content :knowledge="knowledge"/>
    </a>
  </section>
</template>

<script>
import KnowledgeCardContent from '../organisms/KnowledgeCardContent'
export default {
  props: {
    knowledge: {
      type: Object
    },
    linkTo: {
      type: String
    }
  },
  components: {
    KnowledgeCardContent
  },
  computed: {
    getLink() {
      let link = `/${this.knowledge.knowledge_id}`
    }
  }
}
</script>