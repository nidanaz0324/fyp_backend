<?php
error_reporting(0);
header('Access-Control-Allow-Origin:*');
header('Content-Type: application/json');
header('Access-Control-Allow-Method: PUT');
header('Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Request-With');
include('function.php');
$requestMethod = $_SERVER["REQUEST_METHOD"];

if ($requestMethod == 'PUT') {
    $inputData = json_decode(file_get_contents("php://input"), true);
    $categoryId = $_GET['id'];
    $newCategoryName = $inputData['category_name'];

    if ($categoryId && $newCategoryName) {
        $updated = updateCategory($categoryId, $newCategoryName);
        if ($updated) {
            $data = [
                'status' => 200,
                'message' => 'Category updated successfully'
            ];
            header("HTTP/1.0 200 Success");
            echo json_encode($data);
        } else {
            $data = [
                'status' => 500,
                'message' => 'Internal Server Error'
            ];
            header("HTTP/1.0 500 Internal Server Error");
            echo json_encode($data);
        }
    } else {
        $data = [
            'status' => 422,
            'message' => 'Category ID and category name are required'
        ];
        header("HTTP/1.0 422 Unprocessable Entity");
        echo json_encode($data);
    }
} else {
    $data = [
        'status' => 405,
        'message' => $requestMethod . " Method Not Allowed.",
    ];
    header("HTTP/1.0 405 Method Not Allowed");
    echo json_encode($data);
}
?>
