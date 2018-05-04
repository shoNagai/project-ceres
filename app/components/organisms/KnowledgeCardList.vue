<template>
  <div class="">
    <article-card
      v-for="(knowledge) in knowledges"
      :knowledge="knowledge"
      :key="knowledge.id"
      :linkTo="linkTo"
    />
  </div>
</template>

<script>
import KnowledgeCard from '../organisms/KnowledgeCard'
export default {
  components: {
    KnowledgeCard
  },
  props: ['knowledge', 'linkTo']
}
</script>