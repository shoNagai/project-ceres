<template>
  <div class="">
    <knowledge-card-content-title :title="knowledge.title" />
    <knowledge-card-content-overview :overview="knowledge.overview"/>
    <knowledge-card-content-token-amount :thothCount="knowledge.alisToken"/>
  </div>
</template>

<script>
import KnowledgeCardContentTitle from '../atoms/KnowledgeCardContentTitle'
import KnowledgeCardContentOverview from '../atoms/KnowledgeCardContentOverview'
import KnowledgeCardContentThothCount from '../atoms/KnowledgeCardContentThothCount'
export default {
  props: {
    knowledge: {
      type: Object,
      required: true
    }
  },
  components: {
    KnowledgeCardContentTitle,
    KnowledgeCardContentOverview,
    KnowledgeCardContentThothCount
  }
}
</script>