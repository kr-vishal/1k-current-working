<?php

// Define your server key from the Firebase console
$serverKey = 'AAAAaLVRmWI:APA91bFi-Cm6_5p7Ipzbu5Pc7CCM7ABveuYUpx8B0h0enAHYonMWhlsArREBv8UYJ5KhIHTys5_5G5ndB0adcVrddnyZyNEqDW41fyua4KcCj-4jQ_4Dxy_tIjE1uNwsZHAqXMewNR2h';

// Define the device token of the recipient
$deviceToken = 'dao57whWSmu6TvLBGFsj-g:APA91bEqQYI4zOkGdx2Xw8MsFI_h5JPUnU9MTKyXxxPLh2H82igB2CJCfVhNx9LBwK9n0fBoMN4rUE35OWm58t0HN2tl64Tsae0uyMrY_t0xSOvX-I7zGD315NK9-DvfE3hIdqtxkQaf';

// Define the URL for the FCM API endpoint
$url = 'https://fcm.googleapis.com/fcm/send';

// Define the payload data (data-only payload, no notification key)
$payload = [
    'to' => $deviceToken,
    'data' => [
        'run_background' => 'true',
        'another_key' => 'value',
        // Add more data key-value pairs as needed
    ],
    // Optional: Set `content_available` to true to indicate that this is a silent notification
    'content_available' => true,
    // Optional: Set `priority` to `normal` to avoid waking the app unless necessary
    'priority' => 'normal',
];

// Convert the payload to JSON
$payloadJson = json_encode($payload);

// Initialize cURL
$ch = curl_init();

// Set the URL
curl_setopt($ch, CURLOPT_URL, $url);

// Set the request method to POST
curl_setopt($ch, CURLOPT_POST, true);

// Set the request headers
$headers = [
    'Content-Type: application/json',
    'Authorization: key=' . $serverKey,
];
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

// Set the request payload
curl_setopt($ch, CURLOPT_POSTFIELDS, $payloadJson);

// Return the response instead of outputting it directly
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

// Execute the cURL request
$response = curl_exec($ch);

// Check for cURL errors
if (curl_errno($ch)) {
    echo 'cURL error: ' . curl_error($ch);
} else {
    echo 'Response: ' . $response;
}

// Close the cURL session
curl_close($ch);

?>
