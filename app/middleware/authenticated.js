export default function ({ store, route, redirect }) {
  console.log(route.name)
  if (!store.getters["user/isAuthenticated"] && route.name !== 'login') {
    redirect('/login')
  }
  if (store.getters["user/isAuthenticated"] && route.name === 'login') {
    redirect('/')
  }
}