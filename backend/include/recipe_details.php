<?php
// recipe_details.php from author @LuxJoghurt (Pedro Ribeiro Costa)

// Include your database connection code here
$url = getenv('JAWSDB_URL');
$dbparts = parse_url($url);

$hostname = $dbparts['host'];
$username = $dbparts['user'];
$password = $dbparts['pass'];
$database = ltrim($dbparts['path'], '/');

// Check if the recipe ID is passed through GET request
if (isset($_GET['id']) && !empty($_GET['id'])) {
    $recipeId = $_GET['id'];

    try {
        $dsn = "mysql:host=$hostname;dbname=$database;charset=utf8";
        $options = array(
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES => false,
        );
        $connection = new PDO($dsn, $username, $password, $options);
    } catch (PDOException $e) {
        // Return an error message if the connection fails
        echo json_encode(array('error' => 'Database connection failed'));
        exit();
    }

    // Query to fetch recipe details by ID
    $query = "SELECT * FROM tblRecipe WHERE idRecipe = :recipeId";
    $stmt = $connection->prepare($query);
    $stmt->bindParam(':recipeId', $recipeId, PDO::PARAM_INT);
    $stmt->execute();

    // Fetch recipe details
    $recipe = $stmt->fetch();

    if ($recipe) {
        // Query to fetch ingredients by recipe ID
        $query = "SELECT * FROM tblIngredient WHERE fiRecipe = :recipeId";
        $stmt = $connection->prepare($query);
        $stmt->bindParam(':recipeId', $recipeId, PDO::PARAM_INT);
        $stmt->execute();

        // Fetch ingredients
        $ingredients = $stmt->fetchAll();

        // Query to fetch recipe steps by recipe ID
        $query = "SELECT * FROM tblRecipeStep WHERE fiRecipe = :recipeId";
        $stmt = $connection->prepare($query);
        $stmt->bindParam(':recipeId', $recipeId, PDO::PARAM_INT);
        $stmt->execute();

        // Fetch recipe steps
        $steps = $stmt->fetchAll();

        // Return the recipe details, ingredients, and steps as JSON
        echo json_encode(array(
            'name' => $recipe['dtName'],
            'description' => $recipe['dtDescription'],
            'image' => $recipe['dtImage'],
            'ingredients' => $ingredients,
            'steps' => $steps
        ));
    } else {
        echo json_encode(array('error' => 'Recipe not found'));
    }

    // Close the database connection
    $connection = null;
} else {
    echo json_encode(array('error' => 'Recipe ID not provided'));
}
?>