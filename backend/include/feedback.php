<?php
// Set your MySQL credentials
include_once "backend\db\db_credentials.php";
$dbc = mysqli_connect('DB_HOST', 'DB_USER', 'DB_PASSWORD', 'DB_NAME');

// Create connection
$dbc = mysqli_connect($servername, $username, $password, $database);

// Check connection
if (!$dbc) {
    die("Connection failed: " . mysqli_connect_error());
}

// Check if the product ID is provided in the GET parameter
if(isset($_GET['product_id'])) {
    $productId = $_GET['product_id'];

    

    // Fetch product ratings for the specified product
    $queryProductRating = "SELECT pr.fiRating, pr.fiUsername 
                           FROM tblProductRating pr 
                           WHERE pr.fiProduct = $productId";
    $resultProductRating = mysqli_query($dbc, $queryProductRating);

    // Prepare an array to store the product ratings
    $productRatings = array();
    $averageRating = 0;
    
    if (mysqli_num_rows($resultProductRating) > 0) {
        while ($row = mysqli_fetch_assoc($resultProductRating)) {
            $rating = $row['fiRating'];
            $user = $row['fiUsername'];
            $averageRating += $rating;

            // Add product rating information to the array
            $productRatings[] = array(
                'Rating' => $rating,
                'User' => $user
            );
        }
    }

    $averageRating = $averageRating / mysqli_num_rows($resultProductRating);

    // Fetch rating range
    $queryRatingRange = "SELECT idRating, dtDescription, dtImage FROM tblRating";
    $resultRatingRange = mysqli_query($dbc, $queryRatingRange);

    // Prepare an array to store rating range
    $ratingRange = array();
    if (mysqli_num_rows($resultRatingRange) > 0) {
        while ($row = mysqli_fetch_assoc($resultRatingRange)) {
            $ratingId = $row['idRating'];
            $description = $row['dtDescription'];
            $imageCode = $row['dtImage'];

            // Add rating range information to the array
            $ratingRange[] = array(
                'RatingId' => $ratingId,
                'Description' => $description,
                'Image' => $imageCode
            );
        }
    }

    // Combine product ratings and rating range into one big array
    $combinedArray = array(
        'productRatings' => $productRatings,
        'ratingRange' => $ratingRange,
        'averageRating' => $averageRating
    );

    // Close the database connection
    mysqli_close($dbc);

    // Encode the combined array into JSON
    $json = json_encode($combinedArray);

    // Output the JSON
    echo $json;


} 

if (isset($_GET['rate'])) {
    $queryRatingRange = "SELECT idRating, dtDescription, dtImage FROM tblRating";
    $resultRatingRange = mysqli_query($dbc, $queryRatingRange);

    $ratingRange = array();
    if (mysqli_num_rows($resultRatingRange) > 0) {
        while ($row = mysqli_fetch_assoc($resultRatingRange)) {
            $ratingId = $row['idRating'];
            $description = $row['dtDescription'];
            $imageCode = $row['dtImage'];

            $ratingRange[] = array(
                'RatingId' => $ratingId,
                'Description' => $description,
                'Image' => $imageCode
            );
        }
    }

    echo json_encode($ratingRange);
}

function checkIfRated($pUsername, $pProduct, $dbc) {
    $query = "SELECT fiProduct, fiUsername FROM tblProductRating WHERE fiProduct = ? AND fiUsername = ?";
    $stmt = mysqli_prepare($dbc, $query);
    mysqli_stmt_bind_param($stmt, "is", $pProduct, $pUsername);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_store_result($stmt);
    $rows = mysqli_stmt_num_rows($stmt);
    mysqli_stmt_close($stmt);
    
    return $rows > 0 ? false : true;
}


if (isset($_GET['rating']) && isset($_GET['username']) && isset($_GET['product'])) {
    $rating = $_GET['rating'];
    $fiUsername = $_GET['username'];
    $fiProduct = $_GET['product'];

    // Validate input (optional)
    if (!is_numeric($rating) || !is_numeric($fiProduct)) {
        echo "Invalid input.";
        exit;
    }

    if (checkIfRated($fiUsername, $fiProduct, $dbc)) {
        // Prepare the INSERT INTO statement
        $queryInsert = "INSERT INTO tblProductRating (fiRating, fiProduct, fiUsername) VALUES (?, ?, ?)";
        
        // Prepare and execute the statement
        $stmt = mysqli_prepare($dbc, $queryInsert);
        mysqli_stmt_bind_param($stmt, "iis", $rating, $fiProduct, $fiUsername);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_close($stmt);
        
    } else {
        echo "Rating already exists for this user and product.";
    }
}




if (isset($_GET['check']) && isset($_GET['username']) && isset($_GET['product'])) {
    if (checkIfRated($_GET['username'],$_GET['product'],$dbc)) {
        echo json_encode('Not rated yet');
    } else {
        echo json_encode('Already rated');
    }
}


?>
