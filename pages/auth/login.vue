<template>
  <section class="bg-gray-100 dark:bg-gray-800">
    <div
      class="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0"
    >
      <a
        href="#"
        class="flex items-center mb-6 text-sm font-semibold text-gray-900 dark:text-white"
      >
        <img
          class="w-16 h-16 mr-2"
          src="/img/magikarp.png"
          alt="logo"
        />
        "I Swear when i evolve, i'm going to kill you all."
      </a>
      <div
        class="w-full bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700"
      >
        <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
          <h1
            class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white"
          >
          Welcome back!
          </h1>
          <form
            v-on:submit.prevent
            class="space-y-4 md:space-y-6"
            action="#"
            method="POST"
          >
            <div>
              <input
                v-model="email"
                type="email"
                name="email"
                id="email"
                class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                placeholder="name@company.com"
                required
              />
            </div>
            <div>
              <input
                v-model="password"
                type="password"
                name="password"
                id="password"
                placeholder="Password"
                class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                required
              />
            </div>

            <button
              @click.prevent="postLoginForm"
              type="submit"
              class="w-full text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800"
            >
              Login
            </button>
            <p class="text-sm font-light text-gray-500 dark:text-gray-400">
              Don't have an account?
              <a
                href="login"
                class="font-medium text-primary-600 hover:underline dark:text-primary-500"
                >Register here</a
              >
            </p>
          </form>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
import { ref } from "@vue/reactivity";
import { loginWithEmail } from "~/composables/useAuth";


const email = ref(null);
const password = ref(null);
const errors = ref(new Map());
// let response = ref<FormValidation>({ hasErrors: false });

definePageMeta({
  middleware: 'guest'
})

async function postLoginForm() {
  // response.value = await loginWithEmail(email.value, password.value);
  // errors.value = response.value.errors
  await loginWithEmail(email.value, password.value);
}
</script>

<style></style>
