Event.observe(window, 'load', function(){
  adjust_journal_footer();
});

function adjust_journal_footer(){
  $$('#history .footer').each(function(obj){
    obj.previous('.journal').insert(obj);
  });
  return false;
}

function toggle_journal_footer(jid){
  $(jid + '-footer').descendants().each(function(obj){
    if(obj.id.match(/journal-\d+-(output|editor)/)) obj.toggle();
  });
  return false;
}

function update_journal(jid, err){
  if($F(jid + '-picker').match(/^\d\d\d\d-\d\d-\d\d \d\d:\d\d$/)){
    $(jid + '-editor').submit();
  } else {
    alert(err);
  }
  return false;
}

function render_calendar(jid){
  Calendar.setup({
    inputField : jid + '-picker',
    weekNumbers: false,
    ifFormat   : '%Y-%m-%d %H:%M',
    showsTime  : true,
  });
  return false;
}
