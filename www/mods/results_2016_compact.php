<?php

include_once('hp-includes/elections_2016.php');

$t = new Smarty();

$words = explode(" ", $person->get2016College());
$t->assign("college_name", $words[1]);
$t->assign("cam", $words[0]);

$t->assign("party_name", $person->get2016Party());
$t->assign("position", $person->get2016Position());
$t->assign("details", $person->getAlegeri2016Details());

$t->display("mod_results_2016.tpl", $college);

?>
