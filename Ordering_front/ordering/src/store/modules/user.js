const user = {
  // state: null != window.sessionStorage.getItem('userState') ? JSON.parse(window.sessionStorage.getItem('userState')) : {
  //   user: {
  //     role: '',
  //     username: '',
  //     password: '',
  //     uid: ''
  //   }
  // },
  // defaultUser: null != window.sessionStorage.getItem('userState') ? JSON.parse(window.sessionStorage.getItem('userState')) : window.sessionStorage.getItem('userState'),

  state: {
    user: JSON.parse(window.sessionStorage.getItem('userState'))
    || {
      role: '',
      username: '',
      password: '',
      uid: ''
    }
  },

  getters: {
    getUser(state) {
      return state.user;
    }
  },

  mutations: {
    updateUser(state, user) {
      window.sessionStorage.setItem(
        "userState",
        JSON.stringify(user),
      );
      state.user = user;
    }
  },

  actions: {
    asyncUpdateUser(context, user) {
      context.commit('updateUser', user);
    }
  }
}

export default user;