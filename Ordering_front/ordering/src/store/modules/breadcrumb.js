const breadcrumb = {
    state: {
        //当前菜单
        currentMenu: null,
    },
    mutations: {
        selectMenu(state, val) {
            //如果点击应该是首页的话 要把这份数据清空 因为头部组件已经把首页写死了 只有点击不是首页菜单才存储当前菜单
            val.name === 'home' ? (state.currentMenu = null) : (state.currentMenu = val)
        }
    },
}

export default breadcrumb;