let urlInput = document.getElementById("url");
let priceInput = document.getElementById("price");
let message = document.getElementById("message");
alert("loaded");
document.getElementById("submit").addEventListener("click", function () {
  let url = urlInput.value;
  let price = priceInput.value;

  chrome.tabs.query({ active: true, currentWindow: true }, function (tabs) {
    chrome.tabs.sendMessage(
      tabs[0].id,
      { url: url, price: price },
      function (response) {
        message.textContent = response.message;
      }
    );
  });
});
