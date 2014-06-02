<?php
$to      = 'lorathantony@acube.co';
$subject = 'the subject';
$message = 'hello';
$headers = 'From: noreply@acubedemo.com' . "\r\n" .
    'Reply-To: webmaster@example.com' . "\r\n" .
    'X-Mailer: PHP/' . phpversion();

mail($to, $subject, $message, $headers);
?>
