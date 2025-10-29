<?php

/*
* Database Connection File
*
* This file establishes a connection to a MySQL database using the mysqli extension.
* Replace the placeholder values with your actual database credentials.
*/

// --- Database Configuration ---

// Replace with your database server's address (e.g., "localhost" or an IP address)
$servername = "your_servername";

// Replace with your database username
$username = "your_username";

// Replace with your database password
$password = "your_password";

// Replace with the name of your prescription tracker database
$dbname = "your_database_name";

// --- End of Configuration ---

// Create connection using the mysqli object-oriented approach
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    // If connection fails, stop the script and display a detailed error message.
    // In a production environment, you should log this error to a file
    // and show a generic error message to the user for security reasons.
    die("Connection failed: " . $conn->connect_error);
}

// Set the character set to utf8mb4
// This is good practice for supporting a wide range of characters (like emojis)
if (!$conn->set_charset("utf8mb4")) {
    // In a real application, you would log this error.
    // For this example, we'll just print a basic error if it fails.
    // printf("Error loading character set utf8mb4: %s\n", $conn->error);
}

// Optional: Uncomment the line below for testing to confirm a successful connection.
// Make sure to remove or comment it out in production.
echo "Connected successfully";


The $conn variable now holds the active database connection.
You can include this file in your other PHP scripts to use this connection.

Example usage in another file (e.g., index.php):
<?php
// Include the database connection file
include 'db_connect.php';

// Example query
$sql = "SELECT id, patient_name, medication FROM prescriptions";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
// output data of each row
while($row = $result->fetch_assoc()) {
echo "id: " . $row["id"]. " - Name: " . $row["patient_name"]. " - Medication: " . $row["medication"]. "<br>";
}
} else {
echo "0 results";
}

// Don't forget to close the connection when you're done with it in that script
$conn->close();
?>



