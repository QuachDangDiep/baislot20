<?php
require 'db.php'; // Đảm bảo rằng bạn đã tạo file này để kết nối database
require 'EmployeePerformance.php'; // và file này để xử lý logic tính toán hiệu suất

// Giả sử bạn có function này trong EmployeePerformance.php để lấy dữ liệu hiệu suất
// Hàm này và cấu trúc class có thể khác và cần được điều chỉnh cho phù hợp

$performanceCalculator = new EmployeePerformance($conn);
$year = 2021; // Hoặc lấy từ request, giả sử tính hiệu suất cho năm 2021

// Giả định lấy dữ liệu hiệu suất nhân viên, ở đây sử dụng mảng cứng cho mục đích demo
$employeesPerformance = [
    ['id' => 1, 'name' => 'John Doe', 'leavePoints' => 12, 'workPerformance' => 4400000],
    ['id' => 2, 'name' => 'Jane Doe', 'leavePoints' => 10, 'workPerformance' => 4600000]
    // Thêm dữ liệu giả định cho các nhân viên khác
];

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Performance</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <h1>Employee Performance - Year <?php echo $year; ?></h1>
    
    <?php foreach ($employeesPerformance as $employee): ?>
        <p>
            <strong><?php echo $employee['name']; ?></strong><br>
            Leave Points: <?php echo $employee['leavePoints']; ?><br>
            Work Performance: <?php echo number_format($employee['workPerformance']); ?> VND
        </p>
    <?php endforeach; ?>

    <canvas id="performanceChart"></canvas>

    <script>
        var ctx = document.getElementById('performanceChart').getContext('2d');
        var performanceChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: <?php echo json_encode(array_column($employeesPerformance, 'name')); ?>,
                datasets: [{
                    label: 'Work Performance',
                    data: <?php echo json_encode(array_column($employeesPerformance, 'workPerformance')); ?>,
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
</body>
</html>