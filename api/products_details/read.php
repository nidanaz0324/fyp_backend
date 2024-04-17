
<?php
header('Access-Control-Allow-Origin:*');
header('Content-Type: application/json');
header('Access-Control-Allow-Method: GET');
header('Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Request-With');
include('function.php');
$requestMethod = $_SERVER["REQUEST_METHOD"];
if($requestMethod == "GET"){
    if(isset($_GET['id'])){

        $products_details = getproducts_details($_GET); 
        echo $products_details;
    }else{
        $products_details = getproducts_details(); 
        echo $products_details;
    }

    $products_details = getproducts_details(); 
    echo $products_details;
}
else{
    $data = [
        'status' => 405,
        'message' => $requestMethod. ' Method Not Allowed',
    ];
        header("HTTP/1.0 405 Method Not Allowed"); 
        echo json_encode($data);
}
?>

