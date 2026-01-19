const cacheName = "PocketHaven-RocketGoal-0.302";
const contentToCache = [
    "Build/b23dd96997961653e2825455633aac82.loader.js",
    "Build/98438f2e7a94945eb0c97aa68a131683.framework.js.unityweb",
    "Build/1c6b3fb6706375cf5f4e35c5d914385e.data.unityweb",
    "Build/def2138bbbbbb3dc09c6c604c4109263.wasm.unityweb",
    "TemplateData/style.css"

];

self.addEventListener('install', function (e) {
    console.log('[Service Worker] Install');
    
    e.waitUntil((async function () {
      const cache = await caches.open(cacheName);
      console.log('[Service Worker] Caching all: app shell and content');
      await cache.addAll(contentToCache);
    })());
});

self.addEventListener('fetch', function (e) {
    e.respondWith((async function () {
      let response = await caches.match(e.request);
      console.log(`[Service Worker] Fetching resource: ${e.request.url}`);
      if (response) { return response; }

      response = await fetch(e.request);
      const cache = await caches.open(cacheName);
      console.log(`[Service Worker] Caching new resource: ${e.request.url}`);
      cache.put(e.request, response.clone());
      return response;
    })());
});
