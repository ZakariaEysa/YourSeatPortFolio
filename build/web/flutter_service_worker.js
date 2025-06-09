'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "7c7aa23112486e75e99e92f3386ee895",
"assets/AssetManifest.bin.json": "2aedd71ee79f2da8d76a4dabb904210b",
"assets/AssetManifest.json": "f7853b9f01430209ac23046d3a3b7640",
"assets/assets/fonts/BAUHS93.ttf": "191734283bbd6d5733e73020039923d4",
"assets/assets/fonts/Sigmar-Regular.ttf": "ebffdd8704d0138fcc4f9982d698bdc1",
"assets/assets/images/cover_null_2.jpg": "9b79fc932f7d095817f5b9753d8feb8b",
"assets/assets/images/firstApp/about.jpg": "e86a8920a45affd9d70534e081fd07d8",
"assets/assets/images/firstApp/chatPot.jpg": "a80c6e16760e59a3ac6dda86d8af9ed5",
"assets/assets/images/firstApp/home.jpg": "287343e5c68ff16127aba2f4d877bbcb",
"assets/assets/images/firstApp/map.jpg": "18fde12ea37d91b6322136ca27771de6",
"assets/assets/images/firstApp/payment.jpg": "cf2a3528fea67e1ad625bd9ec33a2465",
"assets/assets/images/firstApp/playing.jpg": "cff460bd0b02697630a10c3c7a4b59da",
"assets/assets/images/firstApp/select.jpg": "f16bd9f325ac7a336ced04b389335161",
"assets/assets/images/firstApp/signin.jpg": "eadd03807ed6291fc018e60b8e2dd705",
"assets/assets/images/firstApp/signup.jpg": "fac7a3c8da62cf996d24f63e895236fd",
"assets/assets/images/firstApp/watchList.jpg": "d99fde67fd076c67e2e698cde7a75fbe",
"assets/assets/images/frontlogo.jpg": "41cb6c3a6847afa9351d91b10d9b2028",
"assets/assets/images/LinKat_LOGO.png": "42a92ce78e1dcac6117bd209f9c87c1e",
"assets/assets/images/logo.png": "4f1011247574a36ce63c91f962e707df",
"assets/assets/images/null.jpg": "4f036a7f8c631aa3031d2665d69c979d",
"assets/assets/images/upload.png": "ac9b44410c116e49c9809862dd360e1b",
"assets/FontManifest.json": "aa2b478987c1e2e4038449771d806d92",
"assets/fonts/MaterialIcons-Regular.otf": "4fab256541ddaadda0c336e270e82407",
"assets/NOTICES": "f3f9e55d07979368617a3a4b72d279cc",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "ec3deb6a2a797159c2100fb77e51a8a7",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "2102133d32ee99df6528804f81ff081c",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "9afb4dacaa231f93166688b2999baa29",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "3bd83144593f7accf5711f1371ee94df",
"icons/Icon-192.png": "2abbf8f48dc44a317ff9f0f2a9cd1f6f",
"icons/Icon-512.png": "ff9d0ab9632fec69f0208f970a6bc2e8",
"icons/Icon-maskable-192.png": "2abbf8f48dc44a317ff9f0f2a9cd1f6f",
"icons/Icon-maskable-512.png": "ff9d0ab9632fec69f0208f970a6bc2e8",
"index.html": "4fe499eed342999a20e14d1fa8b483aa",
"/": "4fe499eed342999a20e14d1fa8b483aa",
"main.dart.js": "e29d5fbd28baecad8581970604ae57fa",
"manifest.json": "af6dbb8fbba736dc437959b96cb53a8b",
"version.json": "8a83505fdbc3330a8aae5319b9ecc00e"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
