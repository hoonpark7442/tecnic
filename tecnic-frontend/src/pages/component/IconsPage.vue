<template>
  <div class="flex h-screen overflow-hidden">

    <!-- Sidebar -->
    <Sidebar :sidebarOpen="sidebarOpen" @close-sidebar="sidebarOpen = false" />

    <!-- Content area -->
    <div class="relative flex flex-col flex-1 overflow-y-auto overflow-x-hidden bg-white">
      
      <!-- Site header -->
      <Header :sidebarOpen="sidebarOpen" @toggle-sidebar="sidebarOpen = !sidebarOpen" />

      <main>
        <div class="px-4 sm:px-6 lg:px-8 py-8 w-full max-w-9xl mx-auto">

          <!-- Page header -->
          <div class="mb-8">
            <h1 class="text-2xl md:text-3xl text-gray-800 font-bold">Icons ✨</h1>
          </div>

          <div class="border-t border-gray-200">

            <!-- Components -->
            <div class="space-y-8 mt-8">

              <div class="text-sm">If you need more icons than what we currently support in Mosaic, check out these great packs 👇</div>

              <!-- Nucleo -->
              <div>
                <div class="flex items-start space-x-3 mb-6">
                  <h2 class="text-2xl text-gray-800 font-bold">Nucleo</h2>
                  <div class="text-xs inline-flex font-medium bg-indigo-100 text-indigo-600 rounded-full text-center px-2.5 py-1">Recommended</div>
                </div>
                <div class="px-6 py-8 bg-gray-800 rounded-sm text-center xl:text-left xl:flex xl:flex-wrap xl:justify-between xl:items-center">
                  <div class="text-gray-300 mb-4 xl:mb-0 max-w-lg mx-auto xl:mx-0 2xl:max-w-none">99% of the icons used in Mosaic come from Nucleo; a huge library of 3K+ vector icons!</div>
                  <div class="inline-flex space-x-3">
                    <a class="btn bg-indigo-500 hover:bg-indigo-600 text-white" href="https://nucleoapp.com/pricing" target="_blank" rel="noreferrer">Buy Nucleo</a>
                    <a class="btn bg-gray-700 hover:bg-gray-600 text-white" href="https://nucleoapp.com/free-icons" target="_blank" rel="noreferrer">Download Free Pack</a>
                  </div>
                </div>
              </div>

              <!-- Tabler Icons -->
              <div>
                <div class="flex items-start space-x-3 mb-6">
                  <h2 class="text-2xl text-gray-800 font-bold">Tabler Icons</h2>
                  <div class="text-xs inline-flex font-medium bg-green-100 text-green-600 rounded-full text-center px-2.5 py-1">Free Alternative</div>
                </div>
                <div class="px-6 py-8 bg-gray-800 rounded-sm text-center xl:text-left xl:flex xl:flex-wrap xl:justify-between xl:items-center">
                  <div class="text-gray-300 mb-4 xl:mb-0 max-w-lg mx-auto xl:mx-0 2xl:max-w-none">A set of 1250+ icons that are visually consistent with the style used in Mosaic!</div>
                  <div class="inline-flex space-x-3">
                    <a class="btn bg-indigo-500 hover:bg-indigo-600 text-white" href="https://tablericons.com/" target="_blank" rel="noreferrer">Download Tabler Icons</a>
                  </div>
                </div>
              </div>

            </div>

          </div>

        </div>        
      </main>

    </div> 

  </div>
</template>

<script>
import { ref } from 'vue'
import Sidebar from '../../partials/Sidebar.vue'
import Header from '../../partials/Header.vue'

export default {
  name: 'IconsPage',
  components: {
    Sidebar,
    Header,
  },
  setup() {

    const sidebarOpen = ref(false)

    return {
      sidebarOpen,
    }  
  }
}
</script>