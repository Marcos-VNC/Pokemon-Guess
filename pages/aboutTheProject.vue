<script setup lang="ts">
// ------------------------- SERVER API
</script>

<template>
  <div
    class="flex justify-center items-center bg-gray-100 dark:bg-gray-800"
  >
    <!-- <a href="./games/freePlay">Free play</a> -->
    <div
      class="flex justify-center items-center bg-gray-200 dark:bg-gray-900 p-7 rounded-md m-2 mb-40 mt-12"
    >
      <div
        class="mx-auto grid max-w-2xl grid-cols-1 items-center gap-y-16 gap-x-8 py-24 px-4 sm:px-6 sm:py-32 lg:max-w-7xl lg:grid-cols-2 lg:px-8"
      >
        <div>
          <h2
            class="text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl dark:text-white"
          >
            About "Pokemon Guess Project"
          </h2>
          <p class="mt-4 text-gray-500">
            This is a project I created with the purpose of training some of my developer skills,
            the project is so cool that I decided to leave it online so that other people can give
            it some inspiration and have fun.
          </p>

          <dl
            class="mt-16 grid grid-cols-1 gap-x-6 gap-y-10 sm:grid-cols-2 sm:gap-y-16 lg:gap-x-8"
          >
            <div class="border-t border-gray-200 pt-4">
              <dt class="font-medium text-gray-900 dark:text-white">Origin</dt>
              <dd class="mt-2 text-sm text-gray-500">
                Designed by Marcos Correa.
              </dd>
            </div>

            <div class="border-t border-gray-200 pt-4">
              <dt class="font-medium text-gray-900 dark:text-white">Front-End</dt>
              <dd class="mt-2 text-sm text-gray-500">
                HTML5, CSS3, JS, VUE3, NUXT3.
              </dd>
            </div>

            <div class="border-t border-gray-200 pt-4">
              <dt class="font-medium text-gray-900 dark:text-white">Back-End</dt>
              <dd class="mt-2 text-sm text-gray-500">
                JS, PRISMA.
              </dd>
            </div>

            <div class="border-t border-gray-200 pt-4">
              <dt class="font-medium text-gray-900 dark:text-white">APIs</dt>
              <dd class="mt-2 text-sm text-gray-500">
                PokéAPI
              </dd>
            </div>

            <div class="border-t border-gray-200 pt-4">
              <dt class="font-medium text-gray-900 dark:text-white">UI</dt>
              <dd class="mt-2 text-sm text-gray-500">
                TailWind CSS
              </dd>
            </div>

            <div class="border-t border-gray-200 pt-4">
              <dt class="font-medium text-gray-900 dark:text-white">Development Software</dt>
              <dd class="mt-2 text-sm text-gray-500">
                VS CODE
              </dd>
            </div>
          </dl>
        </div>
        <div class="grid grid-cols-2 grid-rows-2 gap-4 sm:gap-6 lg:gap-8">
          <img
            src="/img/pokeBanner1.jpg"
            alt=""
            class="rounded-lg bg-gray-100 "
          />
          <img
            src="/img/pokeBanner2.jpg"
            alt=""
            class="rounded-lg bg-gray-100 "
          />
          <img
            src="/img/pokeBanner3.png"
            alt=""
            class="rounded-lg bg-gray-100 "
          />
          <img
            src="/img/pokeBanner4.jpg"
            alt=""
            class="rounded-lg bg-gray-100"
          />
        </div>
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

@media only screen and (max-width: 375px) {
}

@media only screen and (max-width: 320px) {
}
</style>
