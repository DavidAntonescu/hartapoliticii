<?php
// If you are accessing this page directly, redirect to the front page
if (!$DB_USER) {
  header('Location: /');
}
$title = "Camera Deputaților - Alegeri 2012";

include('header.php');
include('hp-includes/people_lib.php');

// And now here I should put some content, like something about the elections,
// some stats, some news, something like that.

$page = 'cdep/2012';
$c = 'camera+deputatilor+2012';
include('pages/submenu.php');

?>

