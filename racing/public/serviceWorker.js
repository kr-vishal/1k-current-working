const CACHE_NAME = "version-1";
const urlsToCache = [
  "index.html",
  "offline.html",
  "manifest.json",
  "assets/css/offline.css",
];

this.addEventListener("install", (event) => {
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => {
      console.log("Cache opened updated");
      return cache.addAll(urlsToCache);
    })
  );
});

this.addEventListener("fetch", (event) => {
  event.respondWith(
    caches.match(event.request).then((cachedResponse) => {
      // It can update the cache to serve updated content on the next request
      return (
        cachedResponse ||
        fetch(event.request).catch(() => caches.match("offline.html"))
      );
    })
  );
});

this.addEventListener("activate", (event) => {
  const cacheWhitelist = [];

  cacheWhitelist.push(CACHE_NAME);
  event.waitUntil(
    caches.keys().then((cacheNames) =>
      Promise.all(
        cacheNames.map((cacheName) => {
          if (!cacheWhitelist.includes(cacheName)) {
            return caches.delete(cacheName);
          }
        })
      )
    )
  );
});
