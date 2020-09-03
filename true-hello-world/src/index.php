<!DOCTYPE html>
<html lang="en">
<head>
    <title>True managed kubernetes</title>
    <link rel="icon" href="img/favicon.ico">
    <meta charset="UTF-8">
</head>

<style>
    /*
    note that it's bad practice to put css here,
    but given the fact that the page will be reload-spammed,
    I'd say we have a fair use case.
    */
    body {
        background-color: #fff;
        text-align: center;
        padding: 50px;
        font-family: "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
    }

    #logo {
        height: 150px;
        margin-bottom: 40px;
    }

    a {
        text-decoration: none;
    }
    button {
        background-color: #0075a8;
        border-radius: 6px;
        border: none;
        color: #fff;
        padding: 10px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin-bottom: 40px;
    }
</style>
<body>

<a id="logo" href="https://www.true.nl/" title="True">
    <img src="./img/true-logo.png" alt="true logo">
</a>
<h1>Hello world!</h1>
<h3>My url is <?php
    $url = 'http';
    if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on') {
        $url = 'https';
    }

    $url .= "://{$_SERVER['HTTP_HOST']}{$_SERVER['REQUEST_URI']}";
    echo $url;
    ?>
</h3>

<h3>
    My host name is <?php echo $_ENV['HOSTNAME']; ?>
</h3>

<div>
    <button onclick="location.reload()">Refresh me!</button>
</div>


<div>
    <a class="p-a-xs" href="https://true.nl">
        <img src="img/true-logo.png" alt="True" height="25">
    </a>
    <a class="p-a-xs" href="https://twitter.com/true_nl">
        <img src="img/icon-twitter.svg" alt="twitter" height="25"
             width="25">
    </a>
    <a class="p-a-xs" href="https://nl-nl.facebook.com/TrueBV">
        <img src="img/icon-facebook.svg" alt="facebook"
             height="25" width="25">
    </a>
    <a class="p-a-xs" href="https://nl.linkedin.com/company/true">
        <img src="img/icon-linkedin.svg" height="25"
             alt="linkedin" width="25"></a>
</div>


</body>
</html>
