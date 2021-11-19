<?php

$user = "user_hero";
$pass = "user_hero";
$dbname = "heros";

$dsn = "mysql:dbname=$dbname;host=localhost;port=3306;charset=utf8";
$options = [
	PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
	PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
];

$pdo = new PDO($dsn, $user, $pass, $options);

$stmt = $pdo->query("SELECT * FROM hero");
$results = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo "<html>";
echo "<body>";
echo '<a href="https://github.com/davidnewcomb/docker-tor-server">https://github.com/davidnewcomb/docker-tor-server</a>';
echo '<table border="1">';
foreach ($results as $r) {
	echo "<tr>"
		."<td>". $r["real_name"] ."</td>"
		."<td>". $r["persona"] ."</td>"
		."</tr>";
}

echo "</table>";
echo "</body>";
echo "</html>";

?>
