chrome.runtime.onInstalled.addListener(function () {
  chrome.storage.sync.set({ trackedProducts: [] });
});

chrome.tabs.onUpdated.addListener(function (tabId, changeInfo, tab) {
  if (changeInfo.status == "complete" && tab.active) {
  }
});
