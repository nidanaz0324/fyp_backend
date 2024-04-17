<?php
error_reporting(0);
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

// Include database connection and function filess
include('function.php');

$requestMethod = $_SERVER["REQUEST_METHOD"];

if ($requestMethod == 'POST') {
    // Get the input data
    $inputData = json_decode(file_get_contents("php://input"), true);

    // Check if category_name is provided
    if (!empty($inputData['category_name'])) {
        // Add category
        $storeCategory = addCategory($inputData['category_name']);

        if ($storeCategory) {
            // Category added successfully
            $data = [
                'status' => 201,
                'message' => 'Category created successfully',
                'category_id' => $storeCategory,
                'category_name' => $inputData['category_name']
            ];
            http_response_code(201);
            echo json_encode($data);
        } else {
            // Failed to add category
            $data = [
                'status' => 500,
                'message' => 'Failed to add category'
            ];
            http_response_code(500);
            echo json_encode($data);
        }
    } else {
        // If category_name is not provided in input data
        $data = [
            'status' => 400,
            'message' => 'Category name is required'
        ];
        http_response_code(400);
        echo json_encode($data);
    }
} else {
    // Method not allowed
    $data = [
        'status' => 405,
        'message' => $requestMethod . " Method Not Allowed",
    ];
    http_response_code(405);
    echo json_encode($data);
}
?>


