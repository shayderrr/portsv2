const ranks = [{ru:'Рядовой',en:'Recruit',xp:0},{ru:'Ефрейтор',en:'Gefreiter',xp:100},{ru:'Капрал',en:'Corporal',xp:500},{ru:'Мастер капрал',en:'Master Corporal',xp:1500},{ru:'Сержант',en:'Sergeant',xp:3700},{ru:'Штаб сержант',en:'Staff Sergeant',xp:7100},{ru:'Младший сержант',en:'Master Sergeant',xp:12300},{ru:'Первый сержант',en:'First Sergeant',xp:20000},{ru:'Прапорщик',en:'Sergeant-Major',xp:25000},{ru:'Офицер I',en:'Officer I',xp:29000},{ru:'Офицер II',en:'Officer II',xp:41000},{ru:'Офицер III',en:'Officer III',xp:57000},{ru:'Офицер IV',en:'Officer IV',xp:76000},{ru:'Офицер V',en:'Officer V',xp:98000},{ru:'Младший лейтенант',en:'Third Lieutenant',xp:125000},{ru:'Лейтинант',en:'Second Lieutenant',xp:156000},{ru:'Старший лейтенант',en:'First Lieutenant',xp:192000},{ru:'Капитан',en:'Captain',xp:233000},{ru:'Майор',en:'Major',xp:280000},{ru:'Подполковник',en:'Lieutenant Colonel',xp:332000},{ru:'Полковник',en:'Colonel',xp:390000},{ru:'Бригадир',en:'Brigadier',xp:455000},{ru:'Генерал-майор',en:'Major General',xp:527000},{ru:'Генерал-лейтенант',en:'Lieutenant General',xp:606000},{ru:'Генерал',en:'General',xp:850000},{ru:'Маршал',en:'Marshal',xp:1000000}];

function getRankByScore(s){
  s = parseInt(s);
  const c = ranks.length;
  let cr = null;
  for(var i = 0; i < c; i++){
    const rank = ranks[i];
    if(rank.xp > s){
      break;
    }
    cr = rank;
  }
  if(cr.img == null){
    cr.img = $('<img>').attr('src','Ranks/' + i + '.png');
  }
  return cr;
}

var lbc = null;

function showleads(){
  if(window.lb != null){
	if(showleads.showleadsLock)return;
	showleads.showleadsLock = true;
    if(lbc != null){
      showlb(lbc);
      return;
    }

    lb.getLeaderboardEntries('lead', {quantityTop:20}).then(result => {
      lbc = result;
      showlb(lbc);
      setTimeout(()=>{
        window.lbc = null;
      },16000);
    });
  }
}

function showlb(result){
  const lb_data = $('<div class="leaderbord_data_rows">');
  const players = result.entries;

  if(players.length == 0){
    lb_data.html(lang == 'ru' ? "<p><center>Пусто</center></p>" : "<p><center>Empty</center></p>")
  }

  for(let i = 0; i < players.length; i++){
    const p = players[i];

    const avatar = p.player.getAvatarSrc();
    let nick = p.player.publicName;
    if(nick == ''){
      nick = lang == 'ru' ? "Аноним" : "Anonymous";
    }
    const score = p.score;
    const rank = getRankByScore(score);

    lb_data.append(getRow([
      getColumn(['<span>№'+parseInt(i+1)+' </span>',$('<span>').text(lang == 'ru' ? rank.ru : rank.en)]),
      getColumn([rank.img.clone(),"<img src='"+avatar+"'>"]),
      getColumn('<span>'+nick+'</span>').css(p.player.uniqueID == playerUID ? {'color':'lime'} : {}),
      getColumn('<span>'+score+'</span>')
    ]));
  }

  const o = getOverlay();
  o.append(
    $('<div class="leaderbords">').append(getCurlb()),
    $('<p>').append(
      $('<button>').text(lang == 'ru' ? "Назад" : "Back").click(function(){
        $('.overlay').remove();
        showleads.showleadsLock = false;
      })
    )
  ).hide().show(200);

  function getCurlb(){
    return $('<div class="leaderbord">').append([
      $('<h3>').text(lang == 'ru' ? 'Топ игроков по опыту' : 'Top players by exp'),
      $('<div class="leaderbord_data">').append(lb_data)
    ]);
  }

  function getRow(data){
    return $('<div class="row">').append(data);
  }

  function getColumn(data){
    return $('<div class="col">').append(data);
  }
}

var gp = null;
function onGPInit(gp){
	window.gp = gp;
}

function share(n){
  if(gp!=null) gp.socials.share({
    text: lang == 'ru' ? 'Raven 3D - Линия фронта — кубический шутер в стиле Minecraft: командные битвы, арсенал оружия, жаркая атмосфера войны и динамичный геймплей на фронте.' : 'Raven 3D - Frontline is a Minecraft-style cube shooter with team battles, an arsenal of weapons, a hot war atmosphere, and dynamic gameplay on the front lines.'
  });
}

function getOverlay(){
  const overlay = $('<div class="overlay">').css({
    'position': 'fixed',
    'top': 0,
    'left': 0,
    'color':'white',
    'width': '100%',
    'height': '100%',
    'background': 'rgba(0,0,0,0.9)',
    'display': 'flex',
    'justify-content': 'center',
    'align-items': 'center',
    'z-index': 9999
  });

  const content = $('<div>').css({'text-align':'center'});//блок content, чтобы центрировать

  $('body').append(overlay.append(content));

  return content;
}

function PushSave(json){
  storage.set('main',json);
  storage.push();
}

var advscr = false;

function yabanner(){
	if(advscr)return;

 advscr = true;
 unityInstance.SendMessage('Interop', 'PreBanner');
  ysdk.adv.showFullscreenAdv({callbacks: {onClose: function(){
    unityInstance.SendMessage('Interop', 'PostBanner');

	advscr = false;
	}}});
}

function buyMicrosxeme() {
  if(advscr)return;
  advscr = true;

  if(window.ndk!=null){
    ndk.adv.showRewardedVideo({
      callbacks: {
        onOpen: function(){
          unityInstance.SendMessage('Interop', 'PreBanner');
        },
        onClose: function() {
          advscr = false;
          unityInstance.SendMessage('Interop', 'PostBanner');
        },
        onRewarded: function(){
  		    unityInstance.SendMessage('InAppSys', 'MicrosxemeRecive');
        }
      }
    });
    return;
  }

  ysdk.adv.showRewardedVideo({
    callbacks: {
      onClose: function() {
        advscr = false;
        unityInstance.SendMessage('InAppSys', 'MicrosxemeRecive');
		    unityInstance.SendMessage('Interop', 'PostBanner');
      }
    }
  });
}

function yarbanner() {
  if(advscr)return;
  advscr = true;

  if(window.ndk!=null){
    ndk.adv.showRewardedVideo({
      callbacks: {
        onOpen: function(){
          unityInstance.SendMessage('Interop', 'PreBanner');
        },
        onClose: function() {
          advscr = false;
          unityInstance.SendMessage('Interop', 'PostBanner');
        },
        onRewarded: function(){
  		    unityInstance.SendMessage('Interop', 'REWARDCOMPLITE');
        }
      }
    });
    return;
  }

  ysdk.adv.showRewardedVideo({
    callbacks: {
      onClose: function() {
        advscr = false;
         unityInstance.SendMessage('Interop', 'REWARDCOMPLITE');
		    unityInstance.SendMessage('Interop', 'PostBanner');
      }
    }
  });
}

function WorldLoaded() {

  if(window.ndk!=null){
     ndk.getLeaderboards().then(lb => {
         window.lb = lb;
     });

     ndk.features.LoadingAPI?.ready();
   }

   window.WorldLoaded = function(){

   };
}

function ScoreToLead(score){
	if(window.lb != null) window.lb.setLeaderboardScore('lead', parseInt(score));
}

function SetCursor(cursor){
	$('canvas').css({'cursor':cursor});
}
