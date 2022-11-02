<template>
  <div class="simple-keyboard"></div>
</template>

<script setup>
import Keyboard from "simple-keyboard";
import "simple-keyboard/build/css/index.css";
import { ref, onMounted, watch } from "vue";

const keyboard = ref(null);
const emit = defineEmits(["onKeyPress"]);

const props = {
  guessedLetters: Object,
};

const onKeyPress = (button) => {
  emit("onKeyPress", button);
};



onMounted(() => {
  keyboard.value = new Keyboard("simple-keyboard", {
    layout: {
      default: [
        "q w e r t y u i o p",
        "a s d f g h j k l",
        "{enter} z x c v b n m {bksp}",
      ],
    },
    onKeyPress: onKeyPress,
  });
});

watch(
  () => props.guessedLetters,
  (guessedLetters, prevGuessedLetters) => {
    keyboard.addButtonTheme(guessedLetters.miss.join(" "), "miss");
    keyboard.addButtonTheme(guessedLetters.found.join(" "), "found");
    keyboard.addButtonTheme(guessedLetters.hint.join(" "), "hint");
  },
  { deep: true }
);
</script>

<style>
div.miss {
  @apply bg-gray-500 !important;
  @apply text-white;
}

div.found {
  @apply bg-green-600 !important;
  @apply text-white;
}

div.hint:not(.found) {
  @apply bg-yellow-500 !important;
  @apply text-white;
}

.hg-theme-default .hg-button {
  background-color: #2b2b2b;
  font-size: 20px;
}

.hg-theme-default {
  background-color: transparent;
}
</style>
