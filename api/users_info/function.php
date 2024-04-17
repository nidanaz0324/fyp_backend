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
    
    function storeUsers($userInput){
        global $conn;
    
        $firstname = mysqli_real_escape_string($conn, $userInput['firstname']);
        $lastname = mysqli_real_escape_string($conn, $userInput['lastname']);
        $email = mysqli_real_escape_string($conn, $userInput['email']);
        $phone = mysqli_real_escape_string($conn, $userInput['phone']);
        $address = mysqli_real_escape_string($conn, $userInput['address']);
        $password = mysqli_real_escape_string($conn, $userInput['password']);
        if(empty(trim($firstname))){
            return error422('Enter your First Name:');
        }elseif(empty(trim($lastname))){
            return error422('Enter your last Name:');
        }elseif(empty(trim($email))){
            return error422('Enter your email:');
        }elseif(empty(trim($phone))){
            return error422('Enter your phone:');
        }elseif(empty(trim($address))){
            return error422('Enter your address:');
        }elseif(empty(trim($password))){
            return error422('Enter your password:');
        }
        else{
            $query="INSERT INTO users(firstname,lastname,email,phone,address,password) VALUES ('$firstname','$lastname','$email','$phone','$address','$password')";
            $result=mysqli_query($conn,$query);
            if($result){
                $data = [
                    'status' => 201,
                    'message' => 'User created successfully',
                ];
                header("HTTP/1.0 201 created");
                echo json_encode($data);
            }else{
                $data = [
                    'status' => 500,
                    'message' => 'Internal Server Error'
                ];
                header("HTTP/1.0 500 Internal Server Error");
                echo json_encode($data);
            }
        }
    }
function getUserList(){
    global $conn;

    $query = 'SELECT * FROM users';
    $query_run = mysqli_query($conn, $query);

    if ($query_run) {
        if (mysqli_num_rows($query_run) > 0) {
            $res = mysqli_fetch_all($query_run, MYSQLI_ASSOC);
            $data = [
                'status' => 200,
                'message' => 'users List Fetched Successfully',
                'data' => $res // Assuming you want to include the fetched data in the response
            ];
            header("HTTP/1.0 200 OK");
            return json_encode($data);
        } else {
            $data = [
                'status' => 404,
                'message' => 'No customer Found'
            ];
            header("HTTP/1.0 404 Not customer Found");
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

function getUsers($usersParams){
    global $conn;
    if(empty($usersParams['id'])){
        return error422('Enter Your user ID');
    }
    $userId = mysqli_real_escape_string($conn, $usersParams['id']);
    $query = "SELECT * FROM users WHERE id='$userId' LIMIT 1";
    $result = mysqli_query($conn, $query);

    if($result){
        if(mysqli_num_rows($result) == 1)
        {
            $res = mysqli_fetch_assoc($result);
            $data = [
                'status' => 200,
                'message' => 'User Fetch Successfully',
                'data' => $res
            ];
            return json_encode($data);
        }
        else
        {
            $data = [
                'status' => 404,
                'message' => 'No User Found'
            ];
            return json_encode($data);
        }
    }else{
        $data = [
            'status' => 500,
            'message' => 'Internal Server Error'
        ];
        return json_encode($data);
    }
}

function updateUser($usersInput, $usersParams){
    global $conn;
    if(!isset($usersParams['id'])){
        return error422('User ID Not Found in URL');
    } elseif($usersParams['id'] == null){
        return error422('Enter Your User ID');
    }

    $userId = mysqli_real_escape_string($conn, $usersParams['id']);
    $firstname = mysqli_real_escape_string($conn, $usersInput['firstname']);
    $lastname = mysqli_real_escape_string($conn, $usersInput['lastname']);
    $email = mysqli_real_escape_string($conn, $usersInput['email']);
    $phone = mysqli_real_escape_string($conn, $usersInput['phone']);
    $address = mysqli_real_escape_string($conn, $usersInput['address']);
    $password = mysqli_real_escape_string($conn, $usersInput['password']);

    if(empty(trim($firstname))){
        return error422('Enter your First Name:');
    } elseif(empty(trim($lastname))){
        return error422('Enter your Last Name:');
    } elseif(empty(trim($email))){
        return error422('Enter your Email:');
    } elseif(empty(trim($phone))){
        return error422('Enter your Phone:');
    } elseif(empty(trim($address))){
        return error422('Enter your Address:');
    } elseif(empty(trim($password))){
        return error422('Enter your Password:');
    } else {
        $query = "UPDATE users SET firstname='$firstname', lastname='$lastname', email='$email', phone='$phone', address='$address', password='$password' WHERE ID='$userId' LIMIT 1";
        $result = mysqli_query($conn, $query);

        if($result){
            $data = [
                'status' => 200,
                'message' => 'User updated successfully'
            ];
            header("HTTP/1.0 200 Success");
            return json_encode($data);
        } else {
            $data = [
                'status' => 500,
                'message' => 'Internal Server Error'
            ];
            header("HTTP/1.0 500 Internal Server Error");
            return json_encode($data);
        }
    }
}

function deleteUserDetails($usersParams){
    global $conn;
    if(!isset($usersParams['id'])){
        return error422('User ID Not Found in URL');
    } elseif($usersParams['id'] == null){
        return error422('Enter Your User ID');
    }
    $userId = mysqli_real_escape_string($conn, $usersParams['id']);
    
    // Perform the delete operation
    $query = "DELETE FROM users WHERE ID = '$userId'";
    $result = mysqli_query($conn, $query);

    if($result){
        // Check if rows were affected to determine if the delete was successful
            $data = [
                'status' => 204,
                'message' => 'User deleted successfully'
            ];
            header("HTTP/1.0 204 No Content");
            return json_encode($data);
        } else {
            $data = [
                'status' => 404,
                'message' => 'User not found or already deleted'
            ];
            header("HTTP/1.0 404 Not Found");
            return json_encode($data);
        }
}

?>
