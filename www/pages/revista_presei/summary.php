<?php
include_once('pages/functions_common.php');

function showIndividualNewspaper($code, $title, $homepage) {
  $t = new Smarty();
  if ($title != NULL) {
    $t->assign('NEWSPAPER_TITLE', $title);
  }
  $t->assign('NEWS_CODE', $code);
  $t->assign('MOST_RECENT_NEWS_ABOUT',
             "Cele mai recente știri (via <a href=".
             "\"http://{$homepage}\">{$homepage}</a>)");

  // Show the guys that show up most in the news.
  $list = getMostPresentInNews(10, NULL, NULL, NULL, NULL, $code);
  $list = newsAddPreviousWeekToList($list, NULL, $code);
  $t->assign('numArticles', countAllMostRecentNews(7, $code));
  $t->assign('topPeople', $list);
  $t->assign('SHOW_LATEST_ARTICLE', false);

  $t->assign('news', getMostRecentNewsArticles(NULL, NULL, 12, $code));

  $t->display('revista_presei_one_newspaper.tpl');
}

showIndividualNewspaper('mediafax', NULL, 'mediafax.ro');
showIndividualNewspaper('hotnews', NULL, 'hotnews.ro');

?>
