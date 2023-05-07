<template>
  <div id="app">
    <router-view />
  </div>
</template>

<script>
export default {
  name: "App",
  // mounted() {
  //   window.addEventListener("unload", this.saveState);
  //   console.log(this.$store.state.adv)
  // },
  // methods: {
  //   saveState() {
  //     window.sessionStorage.setItem(
  //       "userState",
  //       JSON.stringify(this.$store.state.user),
  //     );
  //     window.sessionStorage.setItem(
  //       "advState",
  //       JSON.stringify(this.$store.state.adv),
  //     );
  //   },
  // },
};
</script>

<style>
</style>
