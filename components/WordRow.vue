<template>
  <div
    v-if="letterLength == 3"
    class="grid max-w-xs gap-1 mx-auto mb-1 grid-cols-3 teste"
  >
    <letter-box
      v-for="i in letterLength"
      :key="i"
      :letter="value[i - 1]"
      :color="colors[i - 1]"
      :tempColor="temp_color"
    />
  </div>
  <div
    v-else-if="letterLength == 4"
    class="grid max-w-xs gap-1 mx-auto mb-1 grid-cols-4"
  >
    <letter-box
      v-for="i in letterLength"
      :key="i"
      :letter="value[i - 1]"
      :color="colors[i - 1]"
      :tempColor="temp_color"
    />
  </div>
  <div
    v-else-if="letterLength == 5"
    class="grid max-w-xs gap-1 mx-auto mb-1 grid-cols-5"
  >
    <letter-box
      v-for="i in letterLength"
      :key="i"
      :letter="value[i - 1]"
      :color="colors[i - 1]"
      :tempColor="temp_color"
    />
  </div>
  <div
    v-else-if="letterLength == 6"
    class="grid max-w-xs gap-1 mx-auto mb-1 grid-cols-6"
  >
    <letter-box
      v-for="i in letterLength"
      :key="i"
      :letter="value[i - 1]"
      :color="colors[i - 1]"
      :tempColor="temp_color"
    />
  </div>
  <div
    v-else-if="letterLength == 7"
    class="grid max-w-xs gap-1 mx-auto mb-1 grid-cols-7"
  >
    <letter-box
      v-for="i in letterLength"
      :key="i"
      :letter="value[i - 1]"
      :color="colors[i - 1]"
      :tempColor="temp_color"
    />
  </div>
  <div
    v-else-if="letterLength == 8"
    class="grid max-w-xs gap-1 mx-auto mb-1 grid-cols-8"
  >
    <letter-box
      v-for="i in letterLength"
      :key="i"
      :letter="value[i - 1]"
      :color="colors[i - 1]"
      :tempColor="temp_color"
    />
  </div>
  <div
    v-else-if="letterLength == 9"
    class="grid max-w-xs gap-1 mx-auto mb-1 grid-cols-9"
  >
    <letter-box
      v-for="i in letterLength"
      :key="i"
      :letter="value[i - 1]"
      :color="colors[i - 1]"
      :tempColor="temp_color"
    />
  </div>
  <div
    v-else-if="letterLength == 10"
    class="grid max-w-xs gap-1 mx-auto mb-1 grid-cols-10"
  >
    <letter-box
      v-for="i in letterLength"
      :key="i"
      :letter="value[i - 1]"
      :color="colors[i - 1]"
      :tempColor="temp_color"
    />
  </div>
  <div
    v-else-if="letterLength == 11"
    class="grid max-w-xs gap-1 mx-auto mb-1 grid-cols-11"
  >
    <letter-box
      v-for="i in letterLength"
      :key="i"
      :letter="value[i - 1]"
      :color="colors[i - 1]"
      :tempColor="temp_color"
    />
  </div>
  <div
    v-else-if="letterLength == 12"
    class="grid max-w-xs gap-1 mx-auto mb-1 grid-cols-12"
  >
    <letter-box
      v-for="i in letterLength"
      :key="i"
      :letter="value[i - 1]"
      :color="colors[i - 1]"
      :tempColor="temp_color"
    />
  </div>
</template>

<script setup>
import LetterBox from "./LetterBox.vue";
import { ref } from "vue";

const props = defineProps({
  value: String,
  solution: String,
  letterLength: Number,
  submitted: Boolean,
  tempValue: String,
  customClass: String,
});

var colors = ref(["", "", "", "", "", ""]);
var localValue = "";
var temp_color = "";
var myclass = "";

watch(
  () => props.submitted,
  async (submitted, prevSubmitted) => {
    if (props.submitted) {
      let s = props.solution;
      let v = props.value;
      var temp = [];
      for (let i = 0; i < props.letterLength; i++) {
        temp.push("gray");
      }

      let letterPool = [];
      for (let i = 0; i < props.letterLength; i++) {
        if (s.charAt(i) == v.charAt(i)) {
          //se o valor bater
          temp[i] = "green";
        } else {
          letterPool.push(s.charAt(i));
        }
      }
      for (let i = 0; i < props.letterLength; i++) {
        if (temp[i] == "gray") {
          if (letterPool.indexOf(v.charAt(i)) != -1) {
            letterPool.splice(letterPool.indexOf(v.charAt(i)), 1);
            temp[i] = "yellow";
          }
        }
        colors.value[i] = temp[i];
        temp_color = temp[i];
        await new Promise((resolve) => setTimeout(resolve, 233));
      }
    }
  }
);
</script>

<style></style>
