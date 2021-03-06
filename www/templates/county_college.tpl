{* Smarty *}

<table width=970 cellspacing=15>
  <td>



    <table width="970" style="margin-top:12px">
      <!-- Running in 2016 -->

      <tr>
        <td width="970" valign="top" colspan=2>

          <div style="margin-bottom:12px; font-size: 1.4em;">Candidați 2016 - <b>{$county_name}, {$cam}</b> - {$locuri}
            <span style="float:right" class="small">
              <a href="?cid=27&colegiul={$county_name|lower|replace:' ':'+'}&cam={$cam_param}&sim=1&psd=43&pnl=27&usr=8&alde=6&pmp=5&udmr=5">Simulări procente alegeri</a>
            </span>
          </div>
          <div class="small gray" style="xfloat:right">Vezi listele de la {$county_name} pentru
            <a href="?cid=27&colegiul={$county_name|lower|replace:' ':'+'}&cam=S">Senat</a> /
            <a href="?cid=27&colegiul={$county_name|lower|replace:' ':'+'}&cam=D">Camera Deputaților</a>
          </div>

            {if $percentages}
              <div style="padding:3px">
                <form action="/" method="GET">
                  <input type="hidden" name="cid" value="27">
                  <input type="hidden" name="colegiul" value="{$county_name|lower|replace:' ':'+'}">
                  <input type="hidden" name="cam" value="{$cam_param}">
                  <input type="hidden" name="sim" value="1">
                      {section name=p loop=$percentages}
                          {strip}
                              {$percentages[p].name}
                              <input name="{$percentages[p].name}" value="{$percentages[p].p}" size="3">%,
                          {/strip}
                      {/section}

                  <input type="submit" value="Simulează">
                </form>
              </div>
            {/if}

          <table width="940" style="margin-top: 8px;">
            <tr>
            {section name=i loop=$parties}
            {strip}
              {if ($smarty.section.i.index) % 3 == 0}
                </tr><tr>
              {/if}
              <td valign="top">
                  <div class="module" style="xbackground-color: #F3F6FF">
                    <b>{$parties[i]->longName}</b> - {$parties[i]->lists[$college_name]|@count} candidați

                    {include file="county_college_people_list.tpl" people=$parties[i]->lists[$college_name]}
                  </div>
              </td>

            {/strip}
            {/section}

          </table>

          <!-- the buttons to add content, like, tweet, etc -->

          <table width="940" style="margin-top: 8px;">
            <td width="40">
              <div class="add_link_button" onclick="ec.showAddLinkForm()">
                Adaugă link <img src="/images/plus.png" align="absmiddle">
              </div>
            </td>
            <td width="890" align="right">Recomandă pagina asta și altora:

              <div class="fb-like" data-href="http://hartapoliticii.ro/?cid=23&colegiul={$college_name|lower|replace:' ':'+'}" data-send="false" data-layout="button_count" data-width="200" data-show-faces="true" data-action="recommend"></div>
              <a href="https://twitter.com/share" class="twitter-share-button"  data-url="http://hartapoliticii.ro/?cid=23&colegiul={$college_name|lower|replace:' ':'+'}" data-text="Eu votez la colegiul uninominal {$college_name}" data-via="hartapoliticii" data-hashtags="alegeri2012">Tweet</a>
              {literal}
                <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
              {/literal}
            </td>

          </table>
        </td>
      </tr>

      <!-- section for news -->

      <tr>
      <td colspan=2>
        {include file="electoral_college_add_link_form.tpl"}
      </td>
      </tr>
      {if count($links)>0}
      <td width="485" valign="top">
        <div>

          <div class="module" style="padding: 10px;">
          <div class="big" style="margin-bottom:10px">
            <b>Resurse adăugate de utilizatori</b></div>

          {include file="news_list_ugc.tpl" news=$links}

          <div class="small" style="text-align:right">
          <a href="/?cid=comunitate&college_restrict={$college_name|lower|replace:' ':'+'}">Vezi toate resursele...</a>
          </div>

          </div>
      </td>
      <td width="485" valign="top">
      {else}

      <td width="910" valign="top" colspan=2>
      {/if}
        <div class="module" style="padding: 10px;">
        {if count($news)>0}
          <div class="big" style="margin-bottom:10px">
            <b>Știri recente cu candidații din acest colegiu</b></div>

          {include file="news_list_wide.tpl" news=$news}

          <div class="small" style="text-align:right">
          <a href="/?cid=14&sid=0&college_restrict={$college_name|lower|replace:' ':'+'}&year=2012">Vezi toate știrile...</a>
          </div>
        {else}
          <center>Încă nu avem știri despre candidații din acest colegiu.</center>
        {/if}
        </div>
      </td>

  </td>
</table>
<link rel="stylesheet" href="//libs.cartocdn.com/cartodb.js/v2/themes/css/cartodb.css" />
<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script src="//libs.cartocdn.com/cartodb.js/v2/cartodb.js"></script>
