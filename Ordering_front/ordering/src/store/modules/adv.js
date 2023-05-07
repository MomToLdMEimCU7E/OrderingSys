const adv = {
  // state: null != window.sessionStorage.getItem('advState') ? JSON.parse(window.sessionStorage.getItem('advState')) : {
  //   adv: {
  //     advShowFlag: 'false',
  //   }
  // },
  state: {
    adv: JSON.parse(window.sessionStorage.getItem('advState')) || {advShowFlag:'false'}
  },

  getters: {
    getAdv(state) {
      return state.adv;
    }
  },

  mutations: {
    updateAdv(state, adv) {
      window.sessionStorage.setItem(
        "advState",
        JSON.stringify(adv),
      );
      state.adv = adv;
    }
  },

  actions: {
    asyncUpdateAdv(context, adv) {
      context.commit('updateAdv', adv);
    }
  }
}

export default adv;