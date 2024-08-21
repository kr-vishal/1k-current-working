<?php 

$url = 'https://maps.googleapis.com/maps/api/place/search/json?location=28.435859,77.0495017&';
$data = [
	'key' => 'AIzaSyC5syoipP7tqCw-Rypahvg0wZ5noC9eg5M',
	'radius' => 1500,
	'types' => 'atm|gym'
];

$q = http_build_query($data);
//var_dump($url.$q);
$json = file_get_contents($url.$q);
$data = json_decode($json);
foreach( $data->results as $result ){
	print(implode(",", $result->types));
	echo PHP_EOL;
}

//&radius=1500&type=restaurant&keyword=cruise&key=