<?php
$servername = "localhost:3306";
$username = "root"; // Username mặc định của MySQL trong XAMPP
$password = ""; // Password mặc định của MySQL trong XAMPP là trống
$dbname = "employee_performance_db"; // Thay thế bằng tên database của bạn

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    // Thiết lập chế độ error của PDO thành exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully"; 
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}
?>