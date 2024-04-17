<?php
require '../inc/dbcon.php';
function error422($message){
    $data = [
            'status' => 422,
            'message' => $message,
    ];
            header("HTTP/1.0 422 Unprocessable Entity"); 
            echo json_encode($data);
            exit();
    }
    
    function storeproducts_details($products_detailsInput){
        global $conn;
    
        $name = mysqli_real_escape_string($conn, $products_detailsInput['name']);
        $category = mysqli_real_escape_string($conn, $products_detailsInput['category']);
        $description = mysqli_real_escape_string($conn, $products_detailsInput['description']);
        $price = mysqli_real_escape_string($conn, $products_detailsInput['price']);
        $category_id = mysqli_real_escape_string($conn, $products_detailsInput['category_id']);

    
        // Check if an image file is uploaded
        if(isset($_FILES['image'])){
            $image_name = $_FILES['image']['name'];
            $image_tmp = $_FILES['image']['tmp_name'];
            $image_type = $_FILES['image']['type'];
            $image_size = $_FILES['image']['size'];
    
            // Check if the file is an image
            $allowed_types = array('image/jpeg', 'image/jpg', 'image/png');
            if(!in_array($image_type, $allowed_types)){
                return error422('Invalid image format. Please upload a JPEG or PNG file.');
            }
    
            // Specify the relative path for the upload directory
            $upload_path = 'uploads/';
    
            // Create the directory if it doesn't exist
            if (!is_dir($upload_path)) {
                mkdir($upload_path, 0777, true);
            }
    
            // Move the uploaded file to a permanent location
            $image_path = $upload_path . $image_name;
    
            if(move_uploaded_file($image_tmp, $image_path)){
                // Image uploaded successfully, now insert product details into the database
                $query = "INSERT INTO products_details (name, category, category_id, image, description, price) VALUES ('$name', '$category','$category_id', '$image_path', '$description', '$price')";
                $result = mysqli_query($conn, $query);
    
                if($result){
                    $data = [
                        'status' => 201,
                        'message' => 'Product created successfully'
                    ];
                    header("HTTP/1.0 201 Created");
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
                return error422('Failed to upload image. Please try again.');
            }
        } else {
            return error422('Please upload an image for the product.');
        }
    }
    
    
    
    
function getproducts_details(){
    global $conn;

    $query = 'SELECT * FROM products_details';
    $query_run = mysqli_query($conn, $query);

    if ($query_run) {
        if (mysqli_num_rows($query_run) > 0) {
            $res = mysqli_fetch_all($query_run, MYSQLI_ASSOC);
            $data = [
                'status' => 200,
                'message' => 'Products_Details List Fetched Successfully',
                'data' => $res // Assuming you want to include the fetched data in the response
            ];
            header("HTTP/1.0 200 OK");
            return json_encode($data);
        } else {
            $data = [
                'status' => 404,
                'message' => 'No Product Found'
            ];
            header("HTTP/1.0 404 Not Found");
            return json_encode($data);
        }
    } else {
        $data = [
            'status' => 500,
            'message' => 'Internal Server Error'
        ];
        header("HTTP/1.0 500 Internal Server Error");
        echo json_encode($data);
    }
}

function getproduct_details($products_detailsParams){
    global $conn;

    if(empty($products_detailsParams['id']== null)){
        return error422('Enter Your Product ID');
    }

    $products_detailsId = mysqli_real_escape_string($conn,$products_detailsParams['id']);

    $query = 'SELECT * FROM products_details WHERE id="$products_detailsId" LIMIT 3';
    $result = mysqli_query($conn, $query);

    if($result){

        if(mysqli_num_rows($result) == 1)
        {
            $res = mysqli_fetch_assoc($result);
            $data = [
                'status' => 500,
                'message' => 'Product Fetch Successfully',
                'data' => $res
            ];
            header("HTTP/1.0 200 OK");
            echo json_encode($data);
        }
        else
        {
            $data = [
                'status' => 500,
                'message' => 'No Product_Details Found'
            ];
            header("HTTP/1.0 404 Not Found");
            echo json_encode($data);
        }
    }else{
        $data = [
            'status' => 500,
            'message' => 'Internal Server Error'
        ];
        header("HTTP/1.0 500 Internal Server Error");
        echo json_encode($data);
    }
}

function updateproducts_details($products_detailsInput){
    global $conn;
    if(!isset($products_detailsInput['id'])){
        return error422('Product Id Not Found in URL');
    } elseif($products_detailsInput['id'] == null){
        return error422('Enter Your Product Id');
    }

    $products_detailsId = mysqli_real_escape_string($conn, $products_detailsInput['id']);
    $name = mysqli_real_escape_string($conn, $products_detailsInput['name']);
    $category = mysqli_real_escape_string($conn, $products_detailsInput['category']);
    $description = mysqli_real_escape_string($conn, $products_detailsInput['description']);
    $price = mysqli_real_escape_string($conn, $products_detailsInput['price']);
    $category_id = mysqli_real_escape_string($conn, $products_detailsInput['category_id']);
    

    if(empty(trim($name))){
        return error422('Enter Your Product Name');
    } elseif(empty(trim($category))){
        return error422('Enter Your Product Category');
    } else {
        // Check if an image file is uploaded
        if(isset($_FILES['image'])){
            $image_name = $_FILES['image']['name'];
            $image_tmp = $_FILES['image']['tmp_name'];
            $image_type = $_FILES['image']['type'];
            $image_size = $_FILES['image']['size'];

            // Check if the file is an image
            $allowed_types = array('image/jpeg', 'image/jpg', 'image/png');
            if(!in_array($image_type, $allowed_types)){
                return error422('Invalid image format. Please upload a JPEG or PNG file.');
            }

            // Specify the relative path for the upload directory
            $upload_path = 'uploads/';

            // Create the directory if it doesn't exist
            if (!is_dir($upload_path)) {
                mkdir($upload_path, 0777, true);
            }

            // Move the uploaded file to a permanent location
            $image_path = $upload_path . $image_name;

            if(move_uploaded_file($image_tmp, $image_path)){
                // Image uploaded successfully, now update product details in the database
                $query = "UPDATE products_details SET name='$name', category='$category', category_id='$category_id', description='$description', price='$price', image='$image_path' WHERE ID='$products_detailsId' LIMIT 1";
                $result = mysqli_query($conn, $query);

                if($result){
                    $data = [
                        'status' => 200,
                        'message' => 'Product updated successfully'
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
                return error422('Failed to upload image. Please try again.');
            }
        } else {
            // If no new image is uploaded, update product details without changing the image
            $query = "UPDATE products_details SET name='$name', category='$category', category_id='$category_id', description='$description', price='$price' WHERE ID='$products_detailsId' LIMIT 1";
            $result = mysqli_query($conn, $query);

            if($result){
                $data = [
                    'status' => 200,
                    'message' => 'Product updated successfully'
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
        }
    }
}

function deleteProductDetails($productInput){
    global $conn;

    if(!isset($productInput['id'])){
        return error422('Product ID is required.');
    }

    $productId = mysqli_real_escape_string($conn, $productInput['id']);

    // Perform the delete operation
    $query = "DELETE FROM products_details WHERE ID = '$productId'";
    $result = mysqli_query($conn, $query);

    if($result){
        // Check if rows were affected to determine if the delete was successful
        if(mysqli_affected_rows($conn) > 0){
            $data = [
                'status' => 200,
                'message' => 'Product deleted successfully'
            ];
            header("HTTP/1.0 200 OK");
            return json_encode($data);
        } else {
            $data = [
                'status' => 404,
                'message' => 'Product not found or already deleted'
            ];
            header("HTTP/1.0 404 Not Found");
            return json_encode($data);
        }
    } else {
        $data = [
            'status' => 500,
            'message' => 'Internal Server Error. Failed to delete product.'
        ];
        header("HTTP/1.0 500 Internal Server Error");
        return json_encode($data);
    }
}
?>
