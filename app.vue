<script setup lang="ts">
import { useUser } from "~/composables/useAuth";

useHead({
  title: "Pokemon Guess",
  meta: [{name: "description", content: "Pokemon Guess"}, {property: "og:title", content: "Pokemon Guess"}]
})


const nuxtApp = useNuxtApp();
nuxtApp.hook("page:finish", () => {
  window.scrollTo(0, 0);  
});
await useUser();
</script>

<template>
  <NuxtLayout>
    <NuxtPage />
  </NuxtLayout>
</template>


