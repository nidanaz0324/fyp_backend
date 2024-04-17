<?php
error_reporting(0);
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Method: DELETE');
header('Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Request-With');
include('function.php');
$requestMethod = $_SERVER["REQUEST_METHOD"];

if ($requestMethod == "DELETE") {
    $categoryId = $_GET['id'];
    $deleted = deleteCategory($categoryId);
    if ($deleted) {
        $data = [
            'status' => 204,
            'message' => 'Category deleted successfully'
        ];
        header("HTTP/1.0 204 No Content");
        echo json_encode($data);
    } else {
        $data = [
            'status' => 404,
            'message' => 'Category not found or already deleted'
        ];
        header("HTTP/1.0 404 Not Found");
        echo json_encode($data);
    }
} else {
    $data = [
        'status' => 405,
        'message' => $requestMethod . " Method Not Allowed",
    ];
    header("HTTP/1.0 405 Method Not Allowed");
    echo json_encode($data);
}
?>
