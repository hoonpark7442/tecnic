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
            <h1 class="text-2xl md:text-3xl text-gray-800 font-bold">Breadcrumb ✨</h1>
          </div>

          <div class="border-t border-gray-200">

            <!-- Components -->
            <div class="space-y-8 mt-8">

              <!-- With Slashes -->
              <div>
                <h2 class="text-2xl text-gray-800 font-bold mb-6">With Slashes</h2>
                <div class="px-6 py-8 bg-gray-50 border border-gray-200 rounded-sm">
                  <div class="text-center">
                    <!-- Start -->
                    <ul class="inline-flex flex-wrap text-sm font-medium">
                      <li class="after:content-['/'] last:after:hidden after:text-gray-400 after:px-2">
                        <a class="text-gray-500 hover:text-indigo-500" href="#0">Home</a>
                      </li>
                      <li class="after:content-['/'] last:after:hidden after:text-gray-400 after:px-2">
                        <a class="text-gray-500 hover:text-indigo-500" href="#0">Settings</a>
                      </li>
                      <li class="after:content-['/'] last:after:hidden after:text-gray-400 after:px-2">
                        <a class="text-gray-500 hover:text-indigo-500" href="#0">Notifications</a>
                      </li>
                    </ul>
                    <!-- End -->
                  </div>
                </div>
              </div>

              <!-- With Dots -->
              <div>
                <h2 class="text-2xl text-gray-800 font-bold mb-6">With Dots</h2>
                <div class="px-6 py-8 bg-gray-50 border border-gray-200 rounded-sm">
                  <div class="text-center">
                    <!-- Start -->
                    <ul class="inline-flex flex-wrap text-sm font-medium">
                      <li class="after:content-['·'] last:after:hidden after:text-gray-400 after:px-2">
                        <a class="text-gray-500 hover:text-indigo-500" href="#0">Home</a>
                      </li>
                      <li class="after:content-['·'] last:after:hidden after:text-gray-400 after:px-2">
                        <a class="text-gray-500 hover:text-indigo-500" href="#0">Settings</a>
                      </li>
                      <li class="after:content-['·'] last:after:hidden after:text-gray-400 after:px-2">
                        <a class="text-gray-500 hover:text-indigo-500" href="#0">Notifications</a>
                      </li>
                    </ul>
                    <!-- End -->
                  </div>
                </div>
              </div>

              <!-- With Chevrons -->
              <div>
                <h2 class="text-2xl text-gray-800 font-bold mb-6">With Chevrons</h2>
                <div class="px-6 py-8 bg-gray-50 border border-gray-200 rounded-sm">
                  <div class="text-center">
                    <!-- Start -->
                    <ul class="inline-flex flex-wrap text-sm font-medium">
                      <li class="flex items-center">
                        <a class="text-gray-500 hover:text-indigo-500" href="#0">Home</a>
                        <svg class="h-4 w-4 fill-current text-gray-400 mx-3" viewBox="0 0 16 16">
                          <path d="M6.6 13.4L5.2 12l4-4-4-4 1.4-1.4L12 8z" />
                        </svg>
                      </li>
                      <li class="flex items-center">
                        <a class="text-gray-500 hover:text-indigo-500" href="#0">Settings</a>
                        <svg class="h-4 w-4 fill-current text-gray-400 mx-3" viewBox="0 0 16 16">
                          <path d="M6.6 13.4L5.2 12l4-4-4-4 1.4-1.4L12 8z" />
                        </svg>
                      </li>
                      <li class="flex items-center">
                        <a class="text-gray-500 hover:text-indigo-500" href="#0">Notifications</a>
                      </li>
                    </ul>
                    <!-- End -->
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
  name: 'BreadcrumbPage',
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