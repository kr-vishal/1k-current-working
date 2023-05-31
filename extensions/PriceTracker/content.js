chrome.runtime.onMessage.addListener(function (request, sender, sendResponse) {
  if (request.url && request.price) {
    fetch(request.url)
      .then((response) => response.text())
      .then((html) => {
        let parser = new DOMParser();
        let doc = parser.parseFromString(html, "text/html");
        let priceElement = doc.getElementsByClassName("a-price-whole")[0];
        let priceText = priceElement ? priceElement.textContent.trim() : "";
        let price = parseInt(priceText.replace(/[^0-9]/g, ""));

        if (price <= request.price) {
          sendResponse({
            message: "The price is below the desired threshold!",
          });
        } else {
          sendResponse({
            message: "The price is still above the desired threshold.",
          });
        }
      })
      .catch((error) => {
        sendResponse({ message: "There was an error tracking the price." });
      });

    return true;
  }
});

window.onload = () => {
  console.log("Fired");
};
