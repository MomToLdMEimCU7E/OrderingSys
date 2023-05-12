import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '../views/Login'
import Register from '../views/register'
import Home from '../views/Home'
// import User from '../views/user'

import Orderingmgt from '../views/tea/Orderingmgt'
import Classmgt from '../views/tea/Classmgt'
import Classdetail from '../views/tea/Classdetail'
import meetingDetail from '../views/tea/meetingDetail'

import advertising from '../views/stu/advertising'
import OrderList from '../views/stu/OrderList'
import Ordering from '../views/stu/Ordering'
import Orderall from '../views/stu/Orderall'


Vue.use(VueRouter)

const routes = [
    {
        path: '/',
        name: 'Login',
        component: Login,
        hidden: true,
    },
    {
        path: '/register',
        name: 'Register',
        component: Register,
        hidden: true,
    },
    // {
    //     path: '/user',
    //     name: 'User',
    //     component: User,
    //     hidden: true,
    // },
    {
        path: '/home',
        name: '教师功能',
        component: Home,
        
        children: [
            {
                path: '/classmgt',
                name: '班级管理',
                component: Classmgt,
                
            },
            {
                path: '/classdetail',
                name: '班级详情',
                component: Classdetail,
                
            },
            {
                path: '/orderingmgt',
                name: '订货会管理',
                component: Orderingmgt,
                
            },
            {
                path: '/meetingdetail',
                name: '订货会详情',
                component: meetingDetail,
                
            },
        ]
    },
    {
        path: '/home',
        name: '学生功能',
        component: Home,
        children: [
            {
                path: '/orderall',
                name: '订货会',
                component: Orderall,
               
                children:[
                    
                ]
            },
            {
                path: '/advertising',
                name: '广告投放',
                component: advertising,
                
            },
            {
                path: '/ordering',
                name: '订货中心',
                component: Ordering,
                
            },
            {
                path: '/orderlist',
                name: '已选订单',
                component: OrderList,
                
            },
        ]
    },
]

const router = new VueRouter({
    routes
})

// 解决vue-router在3.0版本以上重复报错问题
const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push(location) {
  return originalPush.call(this, location).catch(err => err)
}


export default router