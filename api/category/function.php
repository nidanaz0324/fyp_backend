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
    function addCategory($categoryName) {
        global $conn;
        $categoryName = mysqli_real_escape_string($conn, $categoryName); // Corrected variable name
        $query = "INSERT INTO categories (category_name) VALUES ('$categoryName')";
        $result = mysqli_query($conn, $query);
        if ($result) {
            $categoryId = mysqli_insert_id($conn);
            return $categoryId;
        } else {
            return false;
        }
    }
    
function getCategoryList() {
    global $conn;

    $query = "SELECT * FROM categories";
    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $categories = [];
        while ($row = mysqli_fetch_assoc($result)) {
            $categories[] = $row;
        }
        return $categories;
    } else {
        return [];
    }
}

function getCategoryById($categoryId) {
    global $conn;

    $categoryId = mysqli_real_escape_string($conn, $categoryId);
    
    $query = "SELECT * FROM categories WHERE id='$categoryId'";
    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) == 1) {
        $category = mysqli_fetch_assoc($result);
        return $category;
    } else {
        return false;
    }
}

function updateCategory($categoryId, $newCategoryName) {
    global $conn;

    $categoryId = mysqli_real_escape_string($conn, $categoryId);
    $newCategoryName = mysqli_real_escape_string($conn, $newCategoryName);

    $query = "UPDATE categories SET category_name='$newCategoryName' WHERE id='$categoryId'";
    $result = mysqli_query($conn, $query);

    if ($result) {
        return true;
    } else {
        return false;
    }
}

function deleteCategory($categoryId) {
    global $conn;

    $categoryId = mysqli_real_escape_string($conn, $categoryId);

    $query = "DELETE FROM categories WHERE id='$categoryId'";
    $result = mysqli_query($conn, $query);

    if ($result) {
        return true;
    } else {
        return false;
    }
}
?>
