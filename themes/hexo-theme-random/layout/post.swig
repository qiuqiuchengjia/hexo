{% extends 'includes/layout.swig' %}

{% block body %}
  <article id="post">
    <h1>{{ page.title || __('without_title') }}</h1>
    <p class="page-title-sub">
      <span id = "post-title-date">{{ __('created_at') }} {{ date(page.date) }}</span>
      {% if page.date !== page.updated %}
        <span id = "post-title-updated">{{ __('updated_at') }} {{ date(page.updated) }}</span>
      {% endif %}
      {% if page.categories.length %}
      <span id = "post-title-categories">{{ __('category_title') }}
      {% set i = 0 %}
      {% for cat in page.categories %}
        {% if i !== 0 %}
          {{'/'}}
        {% endif %}
        {% set i = i + 1 %}
        <a href="{{ url_for(cat.path) }}">{{ cat.name }}</a>
      {% endfor %}
      </span>
      {% endif %}
      {% if page.tags.length %}
      <span id = "post-title-tags">
      {{ __('tag_title') }}
      {% set i = 0 %}
      {% for tag in page.tags %}
        {% if i !== 0 %}
          {{'/'}}
        {% endif %}
        {% set i = i + 1 %}
        <a href="{{ url_for(tag.path) }}">{{ tag.name }}</a>
      {% endfor %}
      </span>
      {% endif %}

<!--百度自动推送工具-->
       <script>
(function(){
    var bp = document.createElement('script');
    var curProtocol = window.location.protocol.split(':')[0];
    if (curProtocol === 'https') {
        bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';        
    }
    else {
        bp.src = 'http://push.zhanzhang.baidu.com/push.js';
    }
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(bp, s);
})();
</script>


      <script async src="//dn-lbstatics.qbox.me/busuanzi/2.3/busuanzi.pure.mini.js"></script>
            <span id="busuanzi_container_site_pv">总访问量 <span id="busuanzi_value_site_pv"></span>次</span>
            <span id="busuanzi_container_page_pv">
  本文阅读 <span id="busuanzi_value_page_pv"></span>次
</span>
    </p>
    {% if page.photos.length %}
      {% include 'includes/gallery.swig' %}
    {% endif %}
    {% autoescape false %}{{ page.content }}{% endautoescape %}
  </article>

  {% include 'includes/pagination.swig' %}
{% endblock %}
