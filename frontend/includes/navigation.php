

<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container">
        <a class="navbar-brand ms-5" href="index.php?page=home"><img src="https://www.luxlait.lu/wp-content/themes/luxlait/logo.png?v=1.1.1" style="max-height: 40px;" alt="Logo"></a>
        <button class="navbar-toggler btn btn-light" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link " href="index.php?page=product" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Products
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="index.php?page=product">Deng Mamm</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link hover" href="index.php?page=blog">Blog</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.php?page=aboutus">About Us</a>
                </li>
            </ul>
            <ul class="navbar-nav me-5">
                <li class="nav-item">
                    <a class="nav-link" href="index.php?page=register">Sign Up</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.php?page=login">Login</a>
                </li>
            </ul>
        </div>
    </div>
</nav>









<script>
    $(document).ready(function(){
        $('.nav-item.dropdown').hover(function(){
            $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
        }, function(){
            $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
        });
    });
</script>