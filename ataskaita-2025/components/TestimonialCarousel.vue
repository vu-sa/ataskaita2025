<script setup lang="ts">
import { Carousel, type CarouselApi, CarouselContent, CarouselItem, CarouselNext, CarouselPrevious } from '@/ui/carousel'
import { watchOnce, useBreakpoints, useWindowSize } from '@vueuse/core'
import { ref, computed } from 'vue'
import TestimonialElement from "./TestimonialElement.vue";

const props = defineProps<{
  testimonials: {
    img: string
    name: string
    position: string
    anchor: string
    quotePreview: string
    objectPosition?: string
  }[];
  link: string;
}>()

const emblaMainApi = ref<CarouselApi>()
const emblaThumbnailApi = ref<CarouselApi>()
const selectedIndex = ref(0)

// Set up responsive breakpoints
const breakpoints = useBreakpoints({
  sm: 640,
  md: 768,
  lg: 1024,
  xl: 1280
})

const isMobile = breakpoints.smaller('sm')
const isTablet = breakpoints.between('sm', 'md')
const isDesktop = breakpoints.greater('md')

// Responsive carousel options
const carouselOptions = computed(() => {
  return {
    loop: true,
    skipSnaps: false,
    // Dragging feels better on mobile, less so on desktop
    draggable: isMobile.value || isTablet.value,
    // Use different slide spacing based on screen size
    align: isMobile.value ? 'center' as const : 'start' as const,
    // Show partial next slide on larger screens
    containScroll: isMobile.value ? 'trimSnaps' as const : 'keepSnaps' as const
  }
})

// Determine number of visible thumbnails based on screen width
const { width } = useWindowSize()
const visibleThumbs = computed(() => {
  if (width.value < 640) return 3  // Mobile: show 3
  if (width.value < 768) return 5  // Small tablet: show 5
  return 7 // Desktop: show 7
})

// Calculate responsive basis class for thumbnails
const thumbBasisClass = computed(() => {
  return `basis-1/${visibleThumbs.value}`
})

const onCarouselInit = (api: CarouselApi) => {
  emblaMainApi.value = api
  
  if (!emblaMainApi.value)
    return

  emblaMainApi.value.on('select', onSelect)
  emblaMainApi.value.on('reInit', onSelect)
};


function onSelect() {
  if (!emblaMainApi.value || !emblaThumbnailApi.value)
    return
  selectedIndex.value = emblaMainApi.value.selectedScrollSnap()
  emblaThumbnailApi.value.scrollTo(emblaMainApi.value.selectedScrollSnap())
}

function onThumbClick(index: number) {
  if (!emblaMainApi.value)
    return
    
  // Update the selected index immediately for responsive UI
  selectedIndex.value = index
  
  // Scroll to the selected slide
  emblaMainApi.value.scrollTo(index)
}

watchOnce(emblaMainApi, (api) => {
  if (!api)
    return

  // Initial selection
  onSelect()
  
  // Set up event listeners
  api.on('select', onSelect)
  api.on('reInit', onSelect)
})
</script>

<template>
  <div class="w-full max-w-full overflow-hidden">
    <Carousel 
      class="w-full" 
      :opts="carouselOptions" 
      @init-api="onCarouselInit"
    >
      <CarouselContent>
        <CarouselItem v-for="testimonial in props.testimonials" :key="testimonial.name">
          <TestimonialElement 
            class="p-2 sm:p-3 md:p-4 h-auto sm:h-96!" 
            :img-src="testimonial.img" 
            :name="testimonial.name" 
            :position="testimonial.position" 
            :href="`${link}${testimonial.anchor}`" 
            :object-position="testimonial.objectPosition"
            button-text="Sveikinimo kalba"
          >
            {{ testimonial.quotePreview }}
          </TestimonialElement>
        </CarouselItem>
      </CarouselContent>
      <CarouselPrevious class="hidden sm:flex absolute left-2 sm:left-4 bg-white/80 dark:bg-gray-800/80 hover:bg-white dark:hover:bg-gray-800 border border-amber-500/30" />
      <CarouselNext class="hidden sm:flex absolute right-2 sm:right-4 bg-white/80 dark:bg-gray-800/80 hover:bg-white dark:hover:bg-gray-800 border border-amber-500/30" />
    </Carousel>

    <Carousel
      class="relative w-full mt-4 sm:mt-6 md:mt-8 px-4 sm:px-8 md:px-12"
      :opts="{ dragFree: true, containScroll: 'keepSnaps' as const, align: 'start' as const }"
      @init-api="(val) => emblaThumbnailApi = val"
    >
      <CarouselContent class="flex ml-0">
        <CarouselItem 
          v-for="(testimonial, index) in props.testimonials" 
          :key="testimonial.name" 
          class="pl-0 cursor-pointer transition-all duration-300"
          :class="[thumbBasisClass]" 
          @click="onThumbClick(index)"
        >
          <div class="p-1">
            <img 
              :alt="`Thumbnail of ${testimonial.name}`" 
              :src="testimonial.img"
              :style="testimonial.objectPosition ? { objectPosition: testimonial.objectPosition } : { objectPosition: '50% 30%' }"
              class="w-full aspect-[1/2.5] h-16! sm:h-20! md:h-30! object-cover rounded-lg transition-all duration-300" 
              :class="[selectedIndex === index ? 'border-2 border-amber-500 shadow-md' : 'opacity-70 hover:opacity-100']"
            >
          </div>
        </CarouselItem>
      </CarouselContent>
    </Carousel>
  </div>
</template>
