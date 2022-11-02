<template>
  <div class="content dark:bg-gray-800">
    <div
      class="flex flex-col h-screen max-w-md mx-auto justify-evenly game text-white"
    >
      <!-- <button
        @click="openTipModal"
        type="button"
        data-modal-toggle="crypto-modal"
        class="text-gray-900 bg-white hover:bg-gray-100 border border-gray-200 focus:ring-4 focus:outline-none m-2 focus:ring-gray-100 font-medium rounded-lg text-sm px-5 py-2.5 text-center inline-flex items-center dark:focus:ring-gray-600 dark:bg-gray-800 dark:border-gray-700 dark:text-white dark:hover:bg-gray-700"
      >
        <svg
          aria-hidden="true"
          class="mr-2 w-4 h-4"
          fill="none"
          stroke="currentColor"
          viewBox="0 0 24 24"
          xmlns="http://www.w3.org/2000/svg"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="2"
            d="M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.101m-.758-4.899a4 4 0 005.656 0l4-4a4 4 0 00-5.656-5.656l-1.1 1.1"
          ></path>
        </svg>
        Pokemon tip
      </button> -->
      <div
        @click="openTipModal"
        class="pokeball"
        type="button"
        data-modal-toggle="crypto-modal"
        style="cursor: pointer"
      >
        <div class="top"></div>
        <div class="bottom"></div>
        <div class="middle"></div>
      </div>
      <div class="justify-center pt-12 items-center my-auto p-1 mt-16">
        <word-row
          class="text-black"
          v-for="(guess, i) in state.guesses"
          :key="i"
          :value="guess"
          :tempValue="temp_resp"
          :solution="state.solution"
          :submitted="i < state.currentGuessIndex"
          :letterLength="letterLength"
        />
        <simple-keyboard
          @onKeyPress="handleInput"
          :guessedLetters="state.guessedLetters"
        />
      </div>
      <!-- Main modal -->
      <div
        id="crypto-modal"
        tabindex="-1"
        aria-hidden="true"
        class="overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full"
        v-if="tip"
      >
        <div class="relative p-4 items-center w-full max-w-md h-full md:h-auto">
          <!-- Modal content -->
          <div
            class="relative m-2 mt-16 ml-5 bg-white rounded-lg shadow dark:bg-gray-700"
          >
            <button
              @click="openTipModal"
              type="button"
              class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-800 dark:hover:text-white"
              data-modal-toggle="crypto-modal"
            >
              <svg
                aria-hidden="true"
                class="w-5 h-5"
                fill="currentColor"
                viewBox="0 0 20 20"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  fill-rule="evenodd"
                  d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                  clip-rule="evenodd"
                ></path>
              </svg>
              <span class="sr-only">Who is this pokemon?</span>
            </button>
            <!-- Modal header -->
            <div class="py-4 px-6 rounded-t border-b dark:border-gray-600">
              <h3
                class="text-base font-semibold text-gray-900 lg:text-xl dark:text-white"
              >
                Who is this pokemon?
              </h3>
            </div>
            <!-- Modal body -->
            <div class="p-6">
              <figure class="max-w-xl justify-center">
                <img
                  v-if="state.currentGuessIndex >= 5"
                  class="mx-auto max-w-lg h-auto w-28"
                  :src="state.pokemon.sprite"
                  alt="image description"
                />
                <figcaption
                  class="mt-2 text-xl text-center font-bold text-gray-500 dark:text-gray-400"
                >
                  <p v-if="wonGame || lostGame">
                    {{ state.pokemon.name }}
                  </p>
                  <p v-else>???</p>
                </figcaption>
              </figure>
              <ul class="my-4 space-y-2">
                <li>
                  <a
                    href="#"
                    class="flex items-center p-1.5 text-base font-bold text-gray-900 bg-gray-50 rounded-lg hover:bg-gray-100 group hover:shadow dark:bg-gray-600 dark:hover:bg-gray-500 dark:text-white"
                  >
                    <img
                      class="h-8"
                      src="/img/icon-habitat.png"
                      alt=""
                      srcset=""
                    />
                    <span class="flex-1 ml-2 whitespace-nowrap">Habitat</span>
                    <span
                      class="inline-flex items-center justify-center px-4 py-2 ml-3 text-sm font-bold text-gray-500 bg-gray-200 rounded dark:bg-gray-700 dark:text-gray-400"
                    >
                      {{ state.pokemon.habitat }}
                    </span>
                  </a>
                </li>
                <li>
                  <a
                    href="#"
                    class="flex items-center p-1 text-base font-bold text-gray-900 bg-gray-50 rounded-lg hover:bg-gray-100 group hover:shadow dark:bg-gray-600 dark:hover:bg-gray-500 dark:text-white"
                  >
                    <img
                      class="h-8"
                      src="/img/icon-type.png"
                      alt=""
                      srcset=""
                    />
                    <span class="flex-1 ml-2 whitespace-nowrap">type</span>
                    <div
                      v-if="tipos.length === 1 && state.currentGuessIndex >= 1"
                    >
                      <span
                        class="inline-flex items-center justify-center px-4 py-2 ml-3 text-sm font-bold bg-gray-200 rounded dark:bg-gray-700"
                        :class="[coresTipos[0]]"
                        >{{ tipos[0] }}</span
                      >
                    </div>
                    <div
                      v-else-if="
                        tipos.length === 2 && state.currentGuessIndex >= 1
                      "
                    >
                      <span
                        class="inline-flex items-center justify-center px-4 py-2 ml-3 text-sm font-bold text-gray-500 bg-gray-200 rounded dark:bg-gray-700"
                        :class="[coresTipos[0]]"
                        >{{ tipos[0] }}</span
                      >
                      <span
                        class="inline-flex items-center justify-center px-4 py-2 ml-3 text-sm font-bold text-gray-500 bg-gray-200 rounded dark:bg-gray-700"
                        :class="[coresTipos[1]]"
                        >{{ tipos[1] }}</span
                      >
                    </div>
                  </a>
                </li>
                <li>
                  <a
                    href="#"
                    class="flex items-center p-1 text-base font-bold text-gray-900 bg-gray-50 rounded-lg hover:bg-gray-100 group hover:shadow dark:bg-gray-600 dark:hover:bg-gray-500 dark:text-white"
                  >
                    <img
                      class="h-8"
                      src="/img/icon-generation.png"
                      alt=""
                      srcset=""
                    />
                    <span class="flex-1 ml-2 whitespace-nowrap"
                      >Generation</span
                    >
                    <span
                      v-if="state.currentGuessIndex >= 2"
                      class="inline-flex items-center justify-center px-4 py-2 ml-3 text-sm font-bold text-gray-900 bg-gray-200 rounded dark:bg-gray-700 dark:text-gray-400"
                      >{{ state.pokemon.geracao }}</span
                    >
                  </a>
                </li>
                <li>
                  <a
                    href="#"
                    class="flex items-center p-1 text-base font-bold text-gray-900 bg-gray-50 rounded-lg hover:bg-gray-100 group hover:shadow dark:bg-gray-600 dark:hover:bg-gray-500 dark:text-white"
                  >
                    <img
                      class="h-8"
                      src="/img/icon-color.png"
                      alt=""
                      srcset=""
                    />
                    <span class="flex-1 ml-2 whitespace-nowrap">Color</span>
                    <span
                      v-if="state.currentGuessIndex >= 3"
                      class="inline-flex items-center justify-center px-4 py-2 ml-3 text-sm font-bold bg-gray-200 rounded dark:bg-gray-700"
                      >{{ state.pokemon.cor }}</span
                    >
                  </a>
                </li>

                <li>
                  <a
                    href="#"
                    class="flex items-center p-1 text-base font-bold text-gray-900 bg-gray-50 rounded-lg hover:bg-gray-100 group hover:shadow dark:bg-gray-600 dark:hover:bg-gray-500 dark:text-white"
                  >
                    <img
                      class="h-8"
                      src="/img/icon-description.png"
                      alt=""
                      srcset=""
                    />

                    <span class="flex-1 ml-3 whitespace-nowrap"
                      >Description</span
                    >
                    <span
                      v-if="state.currentGuessIndex >= 4"
                      class="inline-flex items-center justify-center px-4 py-2 ml-3 text-sm font-medium text-gray-500 bg-gray-200 rounded dark:bg-gray-700 dark:text-gray-400"
                      >{{ state.pokemon.descricao }}</span
                    >
                  </a>
                </li>
                <!-- STATUS WON or Lose-->
                <li v-if="wonGame || lostGame">
                  <a
                    href="#"
                    class="flex items-center p-2 text-base font-bold text-gray-900 bg-gray-50 rounded-lg hover:bg-gray-100 group hover:shadow dark:bg-gray-600 dark:hover:bg-gray-500 dark:text-white"
                  >
                    <img
                      v-if="wonGame"
                      class="h-8"
                      src="/img/icon-gameWinner.png"
                      alt=""
                      srcset=""
                    />
                    <img
                      v-else-if="lostGame"
                      class="h-8"
                      src="/img/icon-gameOver.png"
                      alt=""
                      srcset=""
                    />
                    <span v-if="wonGame" class="flex-1 ml-1 whitespace-nowrap"
                      >Congrats, you WON!</span
                    >
                    <span
                      v-else-if="lostGame"
                      class="flex-1 ml-1 whitespace-nowrap"
                      >What a pity, you LOST!</span
                    >
                    <a href="" v-if="wonGame">
                      <button
                        class="relative inline-flex items-center justify-center p-0.5 mb-2 mr-1 overflow-hidden text-sm font-medium text-gray-900 rounded-lg group bg-gradient-to-br from-teal-300 to-lime-300 group-hover:from-teal-300 group-hover:to-lime-300 dark:text-white dark:hover:text-gray-900 focus:ring-4 focus:outline-none focus:ring-lime-200 dark:focus:ring-lime-800"
                      >
                        <span
                          class="relative px-2 py-2.5 transition-all ease-in duration-75 bg-white dark:bg-gray-900 rounded-md group-hover:bg-opacity-0"
                        >
                          New game
                        </span>
                      </button>
                    </a>
                    <a href="" v-else-if="lostGame">
                      <button
                        class="relative inline-flex items-center justify-center p-0.5 mb-2 mr-2 overflow-hidden text-sm font-medium text-gray-900 rounded-lg group bg-gradient-to-br from-pink-500 to-orange-400 group-hover:from-pink-500 group-hover:to-orange-400 hover:text-white dark:text-white focus:ring-4 focus:outline-none focus:ring-pink-200 dark:focus:ring-pink-800"
                      >
                        <span
                          class="relative px-2 py-2.5 transition-all ease-in duration-75 bg-white dark:bg-gray-900 rounded-md group-hover:bg-opacity-0"
                        >
                          New game
                        </span>
                      </button>
                    </a>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import pokemon_api from "@/server/services/pokemon_api";
import { reactive, onMounted, computed } from "vue";

// VARS
const state = reactive({
  solution: "",
  guesses: ["", "", "", "", "", ""],
  currentGuessIndex: 0,
  guessedLetters: {
    miss: [],
    found: [],
    hint: [],
  },
  pokemon: {
    name: "",
    cor: "",
    descricao: "",
    geracao: "",
    habitat: "",
    sprite: "",
    spriteOficial: "",
  },
});

var letterLength = ref(0);
var coresTipos = ref([]);
var tipos = ref([]);
var tip = ref(false);
var temp_resp = ref(null);

// METHODS
function openTipModal() {
  if (tip.value === true) {
    tip.value = false;
  } else {
    tip.value = true;
  }
}

function whatColorIS(pokeonType: String) {
  if (pokeonType == "fire") {
    return "red";
  } else if (pokeonType == "water") {
    return "red";
  } else if (pokeonType == "grass") {
    return "red";
  } else if (pokeonType == "psychic") {
    return "red";
  } else if (pokeonType == "fairy") {
    return "red";
  } else if (pokeonType == "poison") {
    return "red";
  } else if (pokeonType == "ground") {
    return "red";
  } else if (pokeonType == "rock") {
    return "red";
  } else if (pokeonType == "electric") {
    return "red";
  } else if (pokeonType == "fighting") {
    return "red";
  } else if (pokeonType == "normal") {
    return "red";
  } else if (pokeonType == "bug") {
    return "red";
  } else if (pokeonType == "ice") {
    return "red";
  } else if (pokeonType == "flying") {
    return "red";
  } else if (pokeonType == "ghost") {
    return "red";
  } else if (pokeonType == "dark") {
    return "red";
  } else if (pokeonType == "dragon") {
    return "red";
  } else if (pokeonType == "steel") {
    return "red";
  }
}

const handleInput = async (key) => {
  if (state.currentGuessIndex >= 6 || wonGame.value) {
    return;
  }
  const currentGuess = state.guesses[state.currentGuessIndex];

  if (key == "{enter}") {
    //Envia a tentativa
    if (currentGuess.length == letterLength.value) {
      state.currentGuessIndex++;
      for (var i = 0; i < currentGuess.length; i++) {
        let c = currentGuess.charAt(i);
        if (c == state.solution.charAt(i)) {
          state.guessedLetters.found.push(c);
        } else if (state.solution.indexOf(c) != -1) {
          state.guessedLetters.hint.push(c);
        } else {
          state.guessedLetters.miss.push(c);
        }
      }
    }
  } else if (key == "{bksp}") {
    //Remove a ultima letra
    state.guesses[state.currentGuessIndex] = currentGuess.slice(0, -1);
    temp_resp = state.guesses[state.currentGuessIndex];
  } else if (currentGuess.length < letterLength.value) {
    //Adiciona a letra

    const alphaRegex = /[a-zA-Z]/;

    if (alphaRegex.test(key)) {
      state.guesses[state.currentGuessIndex] += key;
      temp_resp += key;
    }
    // console.log(state.guesses[0])
  }
};

function aleatorio(min: number, max: number) {
  return Math.floor(Math.random() * (max - min + 1) + min);
}

const pokemon_datails = async (name: String, types: any) => {
  await pokemon_api.get(`/pokemon-species/${name}`).then((response_specie) => {
    console.log(response_specie.data.color.name);
    state.pokemon.cor = response_specie.data.color.name;
    state.pokemon.descricao =
      response_specie.data.flavor_text_entries[0].flavor_text;
    state.pokemon.habitat = response_specie.data.habitat.name;
    state.pokemon.geracao = response_specie.data.generation.name;
  });

  for (let i = 0; i < types.length; i++) {
    tipos.value.push(types[i].type.name);
    if (types[i].type.name == "fire") {
      coresTipos.value.push(`text-red-600`);
    } else if (types[i].type.name == "water") {
      coresTipos.value.push(`text-blue-600`);
    } else if (types[i].type.name == "grass") {
      coresTipos.value.push(`text-green-600`);
    } else if (types[i].type.name == "psychic") {
      coresTipos.value.push(`text-purple-600`);
    } else if (types[i].type.name == "fairy") {
      coresTipos.value.push(`text-rose-400`);
    } else if (types[i].type.name == "poison") {
      coresTipos.value.push(`text-fuchsia-700`);
    } else if (types[i].type.name == "ground") {
      coresTipos.value.push(`text-yellow-200`);
    } else if (types[i].type.name == "rock") {
      coresTipos.value.push(`text-amber-700`);
    } else if (types[i].type.name == "electric") {
      coresTipos.value.push(`text-yellow-400`);
    } else if (types[i].type.name == "fighting") {
      coresTipos.value.push(`text-red-800`);
    } else if (types[i].type.name == "normal") {
      coresTipos.value.push(`text-neutral-500`);
    } else if (types[i].type.name == "bug") {
      coresTipos.value.push(`text-lime-200`);
    } else if (types[i].type.name == "ice") {
      coresTipos.value.push(`text-teal-400`);
    } else if (types[i].type.name == "flying") {
      coresTipos.value.push(`text-fuchsia-200`);
    } else if (types[i].type.name == "ghost") {
      coresTipos.value.push(`text-violet-800`);
    } else if (types[i].type.name == "dark") {
      coresTipos.value.push(`text-stone-700`);
    } else if (types[i].type.name == "dragon") {
      coresTipos.value.push(`text-purple-700`);
    } else if (types[i].type.name == "steel") {
      coresTipos.value.push(`text-gray-400`);
    }
  }
};

// onMounted

onMounted(async () => {
  const id = aleatorio(1, 250);
  await pokemon_api.get(`/pokemon/${id}`).then((response) => {
    console.log(response.data.name);
    letterLength.value = response.data.name.length;
    console.log(letterLength);
    state.solution = response.data.name;
    state.pokemon = response.data;
    state.pokemon.sprite = response.data.sprites.front_default;
    state.pokemon.spriteOficial =
      response.data.sprites.other.home.front_default;
    console.log("id? " + response.data.species.name);

    pokemon_datails(response.data.name, response.data.types);
  });

  console.log(coresTipos);
  console.log(tipos);
  console.log(state.pokemon);

  window.addEventListener("keyup", (e) => {
    e.preventDefault();
    let key =
      e.keyCode == 13
        ? "{enter}"
        : e.keyCode == 8
        ? "{bksp}"
        : String.fromCharCode(e.keyCode).toLowerCase();

    handleInput(key);
  });
});

// COMPUTED
const lostGame = computed(() => {
  console.log(state.currentGuessIndex);
  if (state.currentGuessIndex >= 6) {
    return true;
  }
});

const wonGame = computed(() => {
  if (state.guesses[state.currentGuessIndex - 1] == state.solution) {
    return true;
  }
});
</script>

<style>
@font-face {
  font-family: pokemonFont;
  src: url(../fonts/Pokemon_Solid.ttf);
}

* {
  margin: 0;
  padding: 0;
  font-family: sans-serif;
}

::-webkit-scrollbar {
  display: none;
}

.pokebolls .rotate {
  width: 50px;
  animation: pokeboll 7s linear infinite;
  pointer-events: none;
}

.pokebolls .rotate img {
  width: 50px;
  animation: rotating 7s linear infinite;
}
.pokebolls {
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: space-between;
  position: absolute;
  bottom: -60px;
  /* top: 50%;
    left: 35%;*/
  /* transform: translateY(-50%);
    z-index: 2; */
  padding-right: 60px;
  padding-left: 50px;
}

@keyframes pokeboll {
  0% {
    transform: translateY(0);
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  70% {
    opacity: 1;
  }
  100% {
    transform: translateY(-70vh);
    opacity: 0;
  }
}

@keyframes rotating {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}

.pokebolls .rotate:nth-child(1) {
  animation-delay: 2s;
  width: 30px;
}
.pokebolls .rotate:nth-child(2) {
  animation-delay: 1s;
}
.pokebolls .rotate:nth-child(3) {
  animation-delay: 3s;
  width: 33px;
}
.pokebolls .rotate:nth-child(4) {
  animation-delay: 4.5s;
}
.pokebolls .rotate:nth-child(5) {
  animation-delay: 6s;
  width: 28px;
}
.pokebolls .rotate:nth-child(6) {
  animation-delay: 3s;
  width: 40px;
}

.pokeball {
  position: absolute;
  /* margin-top: -250px; */
  top: calc(12% - 39.5px);
  left: calc(50% - 39.5px);
  width: 80px;
  height: 80px;
  border-radius: 50%;
  overflow: hidden;
  transform-origin: 50% 100%;
  animation: wobble 5s infinite;
}

.top {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 50%;
  background: linear-gradient(to right, crimson, darkred);
}

.middle {
  position: absolute;
  top: 50%;
  left: 0;
  width: 100%;
  height: 10px;
  background: black;
  transform: translateY(-50%);
}

.middle::before {
  content: "";
  position: absolute;
  top: 4px;
  left: 50%;
  width: 23px;
  height: 23px;
  background: black;
  border-radius: 50%;
  transform: translate(-50%, -50%);
}

.middle::after {
  content: "";
  position: absolute;
  top: 4px;
  left: 50%;
  width: 13px;
  height: 13px;
  background: linear-gradient(to right, white, lightgray);
  border-radius: 50%;
  transform: translate(-50%, -50%);
}

.bottom {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 50%;
  background: linear-gradient(to right, white, lightgray);
}

@keyframes wobble {
  0%,
  20%,
  24%,
  28%,
  80%,
  84%,
  88%,
  92%,
  96%,
  100% {
    transform: rotate(0deg);
  }

  22%,
  82%,
  90% {
    transform: rotate(4deg);
  }

  26%,
  86%,
  94% {
    transform: rotate(-4deg);
  }
}
</style>
