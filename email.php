<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require_once "vendor/autoload.php";

// Check if all required fields are set
if(isset($_POST['name'], $_POST['email'], $_POST['message'])) {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $message = $_POST['message'];

    if(!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo json_encode(array('status' => 'error', 'message' => 'Invalid email address.'));
        exit;
    }

    // Validate email
    if(filter_var($email, FILTER_VALIDATE_EMAIL)) {
        // Mailjet API credentials
        $apiKey = '1b8369ce9f0fdf1efa95e242621943ca';
        $apiSecret = '4c2a03dd8facbb847c7aed87ad635f0e';

        // Check if the email is registered in Mailjet
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, "https://api.mailjet.com/v3/REST/contact/$email");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_USERPWD, "$apiKey:$apiSecret");

        $result = curl_exec($ch);
        $httpStatus = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);

        if ($httpStatus == 404) {
            // Email not registered
            echo json_encode(['status' => 'error', 'message' => 'Email is not registered in Mailjet']);
            exit;
        } elseif ($httpStatus != 200) {
            // Some other error occurred
            echo json_encode(['status' => 'error', 'message' => 'An error occurred while verifying the email']);
            exit;
        }

        $mail = new PHPMailer(true);

        try {
            $mail->isSMTP();
            $mail->Host = 'in-v3.mailjet.com';
            $mail->SMTPAuth = true;
            $mail->Username = '1b8369ce9f0fdf1efa95e242621943ca'; 
            $mail->Password = '4c2a03dd8facbb847c7aed87ad635f0e'; 
            $mail->SMTPSecure = 'tls';
            $mail->Port = 587;

            $mail->setFrom($email, $name);
            $mail->addAddress('aniwant333@gmail.com', 'Aniwant');

            $mail->isHTML(true);
            $mail->Subject = 'New Contact Form Submission';
            $mail->Body    = "<b>Name:</b> $name<br><b>Email:</b> $email<br><b>Message:</b> $message";

            $mail->send();
            
            // Send a JSON response
            echo json_encode(array('status' => 'success', 'message' => 'Email sent successfully.'));
        } catch (Exception $e) {
            // Send a JSON response
            echo json_encode(array('status' => 'error', 'message' => 'Email could not be sent. Mailer Error: ' . $mail->ErrorInfo));
        }
    } else {
        // Send a JSON response
        echo json_encode(array('status' => 'error', 'message' => 'Invalid email address.'));
    }
} else {
    // Send a JSON response
    echo json_encode(array('status' => 'error', 'message' => 'All fields are required.'));
}
?>
