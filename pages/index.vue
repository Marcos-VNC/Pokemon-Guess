<script setup lang="ts">
import pokemon_api from "@/server/services/pokemon_api";

var comingsoon = ref(false);

function comingSoon() {
  console.log("coming soon");
  if (comingsoon.value === true) {
    comingsoon.value = false;
  } else {
    comingsoon.value = true;
  }
}

//! -------------------------  POKEMON API

// const { data } = await useFetch("https://pokeapi.co/api/v2/pokemon?limit=20", {
//   pick: ["name"],
// });

// ------------------------- SERVER API
</script>

<template>
  <div
    class="flex justify-center items-center h-screen bg-gray-100 dark:bg-gray-800"
  >
    <!-- <a href="./games/freePlay">Free play</a> -->
    <div
      class="flex justify-center items-center bg-gray-200 dark:bg-gray-900 p-7 rounded-md m-2"
    >
      <!-- <a href="./games/freePlay">Free play</a> -->
      <div class="flex flex-col">
        <a
          href="#"
          class="flex flex-col items-center bg-white rounded-lg border shadow-md md:flex-row md:max-w-xl hover:bg-gray-100 dark:border-gray-700 dark:bg-gray-800 dark:hover:bg-gray-700"
        >
          <img
            class="object-cover w-full h-56 rounded-t-lg md:h-auto md:w-60 md:rounded-none md:rounded-l-lg"
            src="/img/main-banner.png"
            alt=""
          />
          <div class="flex flex-col justify-between p-4 leading-normal">
            <h5
              class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white"
            >
              Pokemon Guess 1° versão!
            </h5>
            <p class="mb-3 font-normal text-gray-700 dark:text-gray-400">
              Esse site foi criado afim de treinar minhas técnicas de
              programação, mas acabou ficando bacana e resolvi deixalo online,
              divirta-se!
            </p>
          </div>
        </a>

        <div
          class="h-56 grid grid-cols-3 gap-4 content-center justify-center items-center"
        >
          <div class="text-center">
            <button
              @pointerover="comingSoon"
              @pointerleave="comingSoon"
              disabled
              class="bg-red-600 hover:bg-red-400 text-white font-bold py-2 px-4 border-b-4 border-red-900 hover:border-red-500 rounded"
            >
              Daily Pokemon
            </button>
          </div>
          <div class="text-center">
            <a href="./games/freePlay">
              <button
                class="bg-red-600 hover:bg-red-400 text-white font-bold py-2 px-5 border-b-4 border-red-900 hover:border-red-500 rounded"
              >
                Free Play
              </button>
            </a>
          </div>
          <div class="text-center">
            <button
              @pointerover="comingSoon"
              @pointerleave="comingSoon"
              disabled
              class="bg-red-600 hover:bg-red-400 text-white font-bold py-2 px-4 border-b-4 border-red-900 hover:border-red-500 rounded"
            >
              Daily Ranked
            </button>
          </div>
          <div class="text-center">
            <button
              class="bg-red-600 hover:bg-red-400 text-white font-bold py-2 px-2 border-b-4 border-red-900 hover:border-red-500 rounded"
            >
              About the Project
            </button>
          </div>
          <div class="text-center">
            <button
              class="bg-red-600 hover:bg-red-400 text-white font-bold py-2 px-8 border-b-4 border-red-900 hover:border-red-500 rounded customButton"
            >
              News
            </button>
          </div>
          <div class="text-center">
            <button
              @pointerover="comingSoon"
              @pointerleave="comingSoon"
              data-tooltip-target="tooltip-default"
              disabled
              class="bg-red-600 hover:bg-red-400 text-white font-bold py-2 px-1 border-b-4 border-red-900 hover:border-red-500 rounded"
            >
              Ranked Dashboard
            </button>
          </div>
        </div>
      </div>
      <div
        v-if="comingsoon"
        id="tooltip-default"
        role="tooltip"
        class="inline-block absolute z-10 py-2 px-3 text-sm font-medium text-white bg-gray-900 rounded-lg shadow-sm opacity-1 transition-opacity duration-300 tooltip dark:bg-gray-700"
      >
        Coming Soon
        <div class="tooltip-arrow" data-popper-arrow></div>
      </div>
    </div>
  </div>
</template>

<style>
*,
*:after,
*:before {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  text-decoration: none;
}
body {
  font-size: 100%;
  list-style-type: none;
}

@media screen and (max-width: 600px) {
  .customButton {
    width: 100%;
    height: 70px;
  }
}
</style>
