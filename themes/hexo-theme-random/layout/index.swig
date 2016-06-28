{% include 'includes/head.swig' %}
<div class="random-center hide-area">
  <div id="random-index">
    <div class="center-field">
      <img class="avatar" 
      src="http://7xstki.com1.z0.glb.clouddn.com/%E6%88%91%E7%9A%84hexo%E5%8D%9A%E5%AE%A2%E5%A4%B4%E5%83%8F.jpg" 
      width=120 height=120 onClick="openUserCard()">
    </div>
    <div class="center-field">
      <div class="title" onClick="openUserCard()">{{ config.title }}</div>
      <div class="sub-title" onClick="openUserCard()">{{ config.subtitle }}</div>
    </div>
    <hr >
    <div class="center-field">
      <ul class="index-nav-link">
        {% for key in Object.keys(theme.menu)  %}
          {% if theme.menu[key] != '/'  %}
            <li><a href="{{ url_for(theme.menu[key]) }}">{{ key }}</a></li>
          {% endif %}
        {% endfor %}
      </ul>
      {% include 'includes/social-icon.swig' %}
    </div>
  </div>
</div>
{% include 'includes/footer.swig' %}
