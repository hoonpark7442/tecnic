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
          <div class="sm:flex sm:justify-between sm:items-center mb-8">

            <!-- Left: Title -->
            <div class="mb-4 sm:mb-0">
              <h1 class="text-2xl md:text-3xl text-gray-800 font-bold">Empty State ✨</h1>
            </div>

            <!-- Right: Actions -->
            <div class="grid grid-flow-col sm:auto-cols-max justify-start sm:justify-end gap-2">

              <!-- Add board button -->
              <button class="btn bg-indigo-500 hover:bg-indigo-600 text-white">
                <svg class="w-4 h-4 fill-current opacity-50 flex-shrink-0" viewBox="0 0 16 16">
                  <path d="M15 7H9V1c0-.6-.4-1-1-1S7 .4 7 1v6H1c-.6 0-1 .4-1 1s.4 1 1 1h6v6c0 .6.4 1 1 1s1-.4 1-1V9h6c.6 0 1-.4 1-1s-.4-1-1-1z" />
                </svg>
                <span class="ml-2">Add Event</span>
              </button>

            </div>

          </div>

          <div class="border-t border-gray-200">
            <div class="max-w-2xl m-auto mt-16">

              <div class="text-center px-4">
                <div class="inline-flex items-center justify-center w-16 h-16 rounded-full bg-gradient-to-t from-gray-200 to-gray-100 mb-4">
                  <svg class="w-5 h-6 fill-current" viewBox="0 0 20 24">
                    <path class="text-gray-500" d="M10 10.562l9-5-8.514-4.73a1 1 0 00-.972 0L1 5.562l9 5z" />
                    <path class="text-gray-300" d="M9 12.294l-9-5v10.412a1 1 0 00.514.874L9 23.294v-11z" />
                    <path class="text-gray-400" d="M11 12.294v11l8.486-4.714a1 1 0 00.514-.874V7.295l-9 4.999z" />
                  </svg>
                </div>
                <h2 class="text-2xl text-gray-800 font-bold mb-2">Pay your bills in just a few clicks</h2>
                <div class="mb-6">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</div>
                <button class="btn bg-indigo-500 hover:bg-indigo-600 text-white">
                  <svg class="w-4 h-4 fill-current opacity-50 flex-shrink-0" viewBox="0 0 16 16">
                    <path d="M15 7H9V1c0-.6-.4-1-1-1S7 .4 7 1v6H1c-.6 0-1 .4-1 1s.4 1 1 1h6v6c0 .6.4 1 1 1s1-.4 1-1V9h6c.6 0 1-.4 1-1s-.4-1-1-1z" />
                  </svg>
                  <span class="ml-2">Add Event</span>
                </button>
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
  name: 'EmptyState',
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