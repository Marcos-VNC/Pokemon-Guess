import axios, { AxiosInstance } from "axios";

const pokemon_api: AxiosInstance = axios.create({
  baseURL: "https://pokeapi.co/api/v2/",
});

export default pokemon_api;
