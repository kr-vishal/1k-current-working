const BASE_URL = process.env.REACT_APP_API_URL;

const locations = {
  IN: "red-theme",
  US: "green-theme",
  GE: "blue-theme",
};

export async function getApiCall(uri) {
  try {
    const response = await fetch(`${BASE_URL}${uri}`);
    return await response.json();
  } catch (error) {
    return [];
  }
}

export async function postApiCall(uri, body = {}) {
  try {
    const response = await fetch(`${BASE_URL}${uri}`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(body),
    });
    return await response.json();
  } catch (error) {
    return [];
  }
}

export async function getExternalApiCall(url) {
  try {
    const response = await fetch(`${url}`);
    return await response.json();
  } catch (error) {
    return [];
  }
}

export async function getThemeColorForLocation(location) {
  if (locations[location]) {
    return locations[location];
  }

  return "";
}
