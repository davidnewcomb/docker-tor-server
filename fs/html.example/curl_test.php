<?php

$URL_NAME = "DuckDuckGo";
$URL = "https://duckduckgogg42xjoc72x3sjasowoarfbgcmvfimaftt6twagswzczad.onion/";

$curl = curl_init();
curl_setopt($curl, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.13) Gecko/20080311 Firefox/2.0.0.13');
curl_setopt($curl, CURLOPT_TIMEOUT, 20);
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
curl_setopt($curl, CURLOPT_PROXY, '127.0.0.1:9050');
curl_setopt($curl, CURLOPT_PROXYTYPE, CURLPROXY_SOCKS5_HOSTNAME); //CURLPROXY_SOCKS5);
curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true);
curl_setopt($curl, CURLOPT_URL, $URL);
$contents = curl_exec($curl);
?>

<!DOCTYPE html5>
<html>
<head>
<title>PHP Curl Test</title>
</head>
<body>
<div style="width:50%">
<?php echo "$URL_NAME - $URL"; ?>
</div>
<div style="width:50%">
<?php echo $contents; ?>
</div>
</body>
</html>
