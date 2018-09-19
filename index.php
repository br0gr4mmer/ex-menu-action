<?php
$pass = $_POST['pass'];
if($pass == "grab123")
{
        include("index.html");
}
else
{
    if(isset($_POST))
    {?>
            <h1>Grab Eater: Menu Action Sheet</h1>
            <form method="POST" action="index.php">
            Password <input type="password" name="pass"></input><br/>
            <p>Reach out to tim.lange on Slack for password.</p>
            <input type="submit" name="submit" value="Go"></input>
            </form>
    <?}
}
?>