{% include 'user-card.swig' %}
{% if config.hideButtonVisibility || theme.hideButtonVisibility %}



<!--自定义搜索引擎-->
<script type="text/javascript">
  (function(w,d,t,u,n,s,e){w['SwiftypeObject']=n;w[n]=w[n]||function(){
  (w[n].q=w[n].q||[]).push(arguments);};s=d.createElement(t);
  e=d.getElementsByTagName(t)[0];s.async=1;s.src=u;e.parentNode.insertBefore(s,e);
  })(window,document,'script','//s.swiftypecdn.com/install/v2/st.js','_st');
  
  _st('install','NqvsgGPB5iPHZhojPVBH','2.0.0');
</script>


<div id="btn-view">隐藏</div>
   <!--添加一个自定义搜索引擎-->
       <form class="search" action="<%- config.root %>search/index.html" method="get" accept-charset="utf-8">
       <label></label>
       <input type="text" id="search" class="st-default-search-input" maxlength="20" placeholder="搜索" />
       </form>

{% endif %}
{% if config.baidu_analytics || theme.baidu_analytics || config.baidu_tongji || theme.baidu_tongji %}
  {% include 'baidu-tongji.swig' %}
{% endif %}
{% if config.google_analytics || theme.google_analytics %}
  {% include 'google-analytics.swig' %}
{% endif %}

{% if theme.scripts !== undefined && theme.scripts.length > 0 %}
  {# scripts list from config.yml #}
  {% for url in theme.scripts %}
    <script src="{{ url_for(url) }}"></script>
  {% endfor %}
{% endif %}
<script>
{% if theme.fancybox || config.fancybox %}
  // fancybox
  var backgroundImages = [];
  {% if theme.backgroundImages %}
    {% for i in theme.backgroundImages %}
      backgroundImages.push('{{ i }}');
    {% endfor %}
  {% endif %}
  $('#post').each(function(i){
    $(this).find('img').each(function(){
      if ($(this).parent().hasClass('fancybox') || $(this).parent().hasClass('fancybox-thumb')) return;
      var alt = this.alt || this.title;
      if (alt) $(this).after('<span class="caption">' + alt + '</span>');
      $(this).wrap('<a href="' + this.src + '" title="' + alt + '" class="fancybox"></a>');
    });
    $(this).find('.fancybox').each(function(){
      $(this).attr('rel', 'post' + i);
    });
  });
  $(".fancybox").fancybox();
{% endif %}
var vegasConfig = {{ JSON.stringify(theme.vegasConfig) }};
var unsplashConfig = {{ JSON.stringify(theme.unsplashConfig) }};

$(".fancybox-thumb").fancybox({
  prevEffect: 'none',
  nextEffect: 'none',
  helpers: {
    title: {
      type: 'outside'
    },
    thumbs: {
      width: 50,
      height: 50
    }
  }
});

// show video with plyr
$(".video-container iframe").each(function(i){
  var url = $(this).attr('src');
  var id = url.split('/').pop();
  var plyrContainer = document.createElement('div');
  plyrContainer.className = 'plyr';
  var plyrElement = document.createElement('div');
  plyrElement.dataset.videoId = id;
  switch(true) {
    case url.search('youtube.com') >= 0:
      plyrElement.dataset.type = 'youtube';
      break;
    case url.search('vimeo.com') >= 0:
      plyrElement.dataset.type = 'vimeo';
      break;
    default:
      return;
  };
  plyrContainer.appendChild(plyrElement);
  $(this).parent().html(plyrContainer);
});
plyr.setup('.plyr', {iconUrl: '{{ url_for("/css/sprite.svg") }}'});
</script>
</body>
</html>
