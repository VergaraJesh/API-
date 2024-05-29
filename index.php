<?php
header('Content-Type: application/json');
error_reporting(E_ALL); // Turn on error reporting for debugging

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "pc_builder";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    echo json_encode(["error" => "Connection failed: " . $conn->connect_error]);
    exit;
}

$type = isset($_GET['type']) ? $_GET['type'] : '';
$budget = isset($_GET['budget']) ? floatval($_GET['budget']) : 0;

$sql = "SELECT * FROM products";
$conditions = [];

if ($type) {
    $conditions[] = "type = '" . $conn->real_escape_string($type) . "'";
}

if ($budget > 0) {
    $conditions[] = "price <= " . $conn->real_escape_string($budget);
}

if (!empty($conditions)) {
    $sql .= " WHERE " . implode(' AND ', $conditions);
}

$result = $conn->query($sql);

if (!$result) {
    echo json_encode(["error" => "Query failed: " . $conn->error]);
    exit;
}

$products = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $products[] = $row;
    }
    echo json_encode($products);
} else {
    echo json_encode([]);
}

$conn->close();
?>
