---
# https://vitepress.dev/reference/default-theme-home-page
layout: home

hero:
  name: "VU SR report"
  text: "for 2024-2025"
  tagline: "VU SR report for 2024-2025"
  image:
    light:
      src: /img/logos/vusa-en-b.png
      alt: VU SA
    dark: 
      src: /img/logos/vusa-en-w.png
      alt: VU SA
  actions:
    - theme: brand
      text: Learn about this year!
      link: /en/strategija
    - theme: alt
      text: Download PDF Report
      link: /VU_SR_Report_2024_2025.pdf
---

<script setup lang="ts">
import { ref, onMounted, computed } from 'vue';
import { useDark } from '@vueuse/core'
import congrats from "../data/congrats.json"
import stats from "../data/stats.json"
import galleryImages from "../data/gallery.json"
import timelineData from "../data/timeline.json"
import people from "../data/dariniai.csv"

// Import components
import VPButton from "vitepress/dist/client/theme-default/components/VPButton.vue";
import NumberStatistic from "@/NumberStatistic.vue";
import PersonAvatar from "@/PersonAvatar.vue";
import MultiPersonAvatar from "@/MultiPersonAvatar.vue";
import EnhancedNumberStatistic from "@/EnhancedNumberStatistic.vue";
import ImageMosaic from "@/ImageMosaic.vue";
import InteractiveTimeline from "@/InteractiveTimeline.vue";
import AchievementSection from "@/AchievementSection.vue";
import TestimonialCarousel from "@/TestimonialCarousel.vue";

// Import icons
import { 
  Trophy, 
  Users, 
  GraduationCap,
  HeartHandshake,
  BookOpen,
  Building,
  Star,
  Lightbulb,
  Award,
  Heart,
  Scale,
  Handshake,
  TrendingUp
} from 'lucide-vue-next';

// Map icon strings to icon components
const iconMap = {
  Star,
  Building,
  Lightbulb,
  Users,
  Trophy
};

// Primary colors for the site
const primaryColor = '#fbad13';
const accentColor = '#b5333e';

// Import person utility functions
import { getPersonByName, getPersonsByDepartment } from '@/lib/personUtils';

// Prepare team data for MultiPersonAvatar
const centralOfficeTeam = computed(() => {
  return getPersonsByDepartment('Centrinis biuras');
});

import {
  Carousel,
  CarouselContent,
  CarouselItem,
} from "@/ui/carousel";

// Timeline events data
const timelineEvents = timelineData.en;

const isDark = useDark()

// Dynamic logo source based on dark/light mode
const logoSrc = computed(() => {
  return isDark.value ? './img/logos/vusa-lt-w.png' : './img/logos/vusa-lt-b.png';
});

</script>

<section class="lg:px-2 px-1.5 isolate">
  <div class="mx-auto relative">
    <figure class="grid grid-cols-1 md:grid-cols-2 gap-4 items-center rounded-xl p-6">
      <figcaption class="my-4 px-6 text-left order-2 md:order-1 flex flex-col">
        <p class="text-md font-medium italic mb-4 leading-6!">"We will enter the upcoming academic year with newly approved strategic projects that impact every member of our community. I am proud of the Organization, our collective engagement, and our strong partnerships. 
        </p>
        <p class="font-bold mb-4 leading-6!">
          I invite you to explore all the work done throughout the year in the VU SR 2024–2025 report. Sincere thanks to you for this year—let’s continue working “United for the future of students!" 
        </p>
        <PersonAvatar class="mt-4" :src="`/img/people/${people[0]['Nuotraukos pavadinimas']}`" size="small">
          <p style="margin: 0" class="font-bold leading-5!">{{ people[0]['Vardas Pavardė'] }}</p>
          <p style="margin: 0" class="opacity-80 text-sm">{{ people[0]['Pareigos'] }}</p>
        </PersonAvatar>
      </figcaption>
      <video playsinline autoplay controls muted loop class="mx-auto order-1 md:order-2 z-20 shadow-lg rounded-lg aspect-video">
        <source src="/video/kleja-en.webm" type="video/webm">
        Your browser does not support the video tag.
      </video>
    </figure>
  </div>
</section>

<!-- Interactive Timeline Section -->
<section class="lg:px-2 px-1.5 isolate my-8 py-4">
  <div class="max-w-6xl mx-auto">
    <InteractiveTimeline 
      title="VU SA 2024–2025 m. svarbiausios veiklos" 
      :events="timelineEvents" 
    />
  </div>
</section>

<!-- Gallery Section -->
<section class="lg:px-2 px-1.5 isolate my-8 py-4">
  <div class="max-w-6xl mx-auto">
    <ImageMosaic 
      title="VU SR moments" 
      :images="galleryImages.en" 
    />
  </div>
</section>

<!-- Enhanced Statistics Section with Icons -->
<section class="lg:px-2 px-1.5 isolate my-12">
  <div class="max-w-6xl mx-auto">
    <div class="text-center">
      <h2 style="border: 0; padding: 0" class="font-bold mb-2">VU SA – tai:</h2>
    </div>
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 mt-10">
      <template v-for="stat in stats.en" :key="stat.label">
        <EnhancedNumberStatistic 
          :end-number="stat.value" 
          :title="stat.label"
          :icon="iconMap[stat.icon]"
        >
          {{ stat.description }}
        </EnhancedNumberStatistic>
      </template>
    </div>
  </div>
</section>

<!-- Testimonials Section -->
<section class="lg:px-2 px-1.5 isolate my-20">
  <div class="max-w-6xl mx-auto">
    <h2 class="text-3xl md:text-4xl font-bold text-center mb-12">
      Congratulations
    </h2>
    <TestimonialCarousel :testimonials="congrats.en" link="/en/sveikinimai" button-text="Go to the speech" />
  </div>
</section>

<!-- Call to Action -->
<section class="lg:px-2 px-1.5 isolate my-20">
  <div class="max-w-5xl mx-auto text-center p-10 bg-gradient-to-br from-amber-500/10 via-white to-amber-500/5 dark:from-amber-900/20 dark:via-gray-800 dark:to-amber-900/10 rounded-2xl shadow-lg backdrop-blur-sm">
    <h2 class="text-3xl font-bold mb-4">Join the VU SR community</h2>
    <p class="text-lg mb-8 px-12">
      Every VU student can join VU SR!
    </p>
    <div class="flex flex-wrap justify-center gap-4 mt-8">
                <VPButton 
                  href="https://vusa.lt/tapk-nariu" 
                  text="Become a member"
                />
                <VPButton 
                  href="/VU_SA_Ataskaita_2024_2025.pdf" 
                  text="Download PDF" 
                  theme="brand"
                />
                <VPButton 
                  href="https://vusa.lt/lt/kontaktai/centrinis-biuras" 
                  text="Contact"
                  theme="alt"
                />
    </div>
  </div>
</section>
