




<!DOCTYPE html>
<html class="   ">
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# object: http://ogp.me/ns/object# article: http://ogp.me/ns/article# profile: http://ogp.me/ns/profile#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
    
    <title>AnomalyDetectionToolbox/benchmarks/PointAnomaly/SPECT_Heart_Data_Set /readme.txt at master · dsmi-lab-ntust/AnomalyDetectionToolbox</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub" />
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub" />
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png" />
    <meta property="fb:app_id" content="1401488693436528"/>

      <meta content="@github" name="twitter:site" /><meta content="summary" name="twitter:card" /><meta content="dsmi-lab-ntust/AnomalyDetectionToolbox" name="twitter:title" /><meta content="AnomalyDetectionToolbox - A collection of algorithms for anomaly detection" name="twitter:description" /><meta content="https://avatars2.githubusercontent.com/u/6645961?s=400" name="twitter:image:src" />
<meta content="GitHub" property="og:site_name" /><meta content="object" property="og:type" /><meta content="https://avatars2.githubusercontent.com/u/6645961?s=400" property="og:image" /><meta content="dsmi-lab-ntust/AnomalyDetectionToolbox" property="og:title" /><meta content="https://github.com/dsmi-lab-ntust/AnomalyDetectionToolbox" property="og:url" /><meta content="AnomalyDetectionToolbox - A collection of algorithms for anomaly detection" property="og:description" />

    <link rel="assets" href="https://assets-cdn.github.com/">
    <link rel="conduit-xhr" href="https://ghconduit.com:25035">
    <link rel="xhr-socket" href="/_sockets" />

    <meta name="msapplication-TileImage" content="/windows-tile.png" />
    <meta name="msapplication-TileColor" content="#ffffff" />
    <meta name="selected-link" value="repo_source" data-pjax-transient />
      <meta name="google-analytics" content="UA-3769691-2">

    <meta content="collector.githubapp.com" name="octolytics-host" /><meta content="collector-cdn.github.com" name="octolytics-script-host" /><meta content="github" name="octolytics-app-id" /><meta content="8C769B89:1160:7E08541:53C4C827" name="octolytics-dimension-request_id" /><meta content="1489338" name="octolytics-actor-id" /><meta content="absolutelyNoWarranty" name="octolytics-actor-login" /><meta content="69e0aad1e3cc136c21e18ad53234ef6390a5a9db580c1048048153b4f8af5ae7" name="octolytics-actor-hash" />
    

    
    
    <link rel="icon" type="image/x-icon" href="https://assets-cdn.github.com/favicon.ico" />


    <meta content="authenticity_token" name="csrf-param" />
<meta content="4uuykPhjTHpHl1NI6nw4vWUlW4/p3iTGse2D2gS0CtphsTFtp+hvveb5vMUvGnBaLU8xXUrXGRdFYTTG2nDJrQ==" name="csrf-token" />

    <link href="https://assets-cdn.github.com/assets/github-c534ad575b5bb8c3cc3dce9c571df7aa7400dbe9.css" media="all" rel="stylesheet" type="text/css" />
    <link href="https://assets-cdn.github.com/assets/github2-7b12c21d4e47b20b15995e9a0f5f66d737e23334.css" media="all" rel="stylesheet" type="text/css" />
    


    <meta http-equiv="x-pjax-version" content="ef2e8ad48b4c98b3a1a0065370258ac2">

      
  <meta name="description" content="AnomalyDetectionToolbox - A collection of algorithms for anomaly detection" />


  <meta content="6645961" name="octolytics-dimension-user_id" /><meta content="dsmi-lab-ntust" name="octolytics-dimension-user_login" /><meta content="16719173" name="octolytics-dimension-repository_id" /><meta content="dsmi-lab-ntust/AnomalyDetectionToolbox" name="octolytics-dimension-repository_nwo" /><meta content="true" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="16719173" name="octolytics-dimension-repository_network_root_id" /><meta content="dsmi-lab-ntust/AnomalyDetectionToolbox" name="octolytics-dimension-repository_network_root_nwo" />

  <link href="https://github.com/dsmi-lab-ntust/AnomalyDetectionToolbox/commits/master.atom" rel="alternate" title="Recent Commits to AnomalyDetectionToolbox:master" type="application/atom+xml" />

  </head>


  <body class="logged_in  env-production windows vis-public page-blob">
    <a href="#start-of-content" tabindex="1" class="accessibility-aid js-skip-to-content">Skip to content</a>
    <div class="wrapper">
      
      
      
      


      <div class="header header-logged-in true">
  <div class="container clearfix">

    <a class="header-logo-invertocat" href="https://github.com/" aria-label="Homepage">
  <span class="mega-octicon octicon-mark-github"></span>
</a>


    
    <a href="/notifications" aria-label="You have unread notifications" class="notification-indicator tooltipped tooltipped-s" data-hotkey="g n">
        <span class="mail-status unread"></span>
</a>

      <div class="command-bar js-command-bar  in-repository">
          <form accept-charset="UTF-8" action="/search" class="command-bar-form" id="top_search_form" method="get">

<div class="commandbar">
  <span class="message"></span>
  <input type="text" data-hotkey="s" name="q" id="js-command-bar-field" placeholder="Search or type a command" tabindex="1" autocapitalize="off"
    
    data-username="absolutelyNoWarranty"
    data-repo="dsmi-lab-ntust/AnomalyDetectionToolbox"
  >
  <div class="display hidden"></div>
</div>

    <input type="hidden" name="nwo" value="dsmi-lab-ntust/AnomalyDetectionToolbox" />

    <div class="select-menu js-menu-container js-select-menu search-context-select-menu">
      <span class="minibutton select-menu-button js-menu-target" role="button" aria-haspopup="true">
        <span class="js-select-button">This repository</span>
      </span>

      <div class="select-menu-modal-holder js-menu-content js-navigation-container" aria-hidden="true">
        <div class="select-menu-modal">

          <div class="select-menu-item js-navigation-item js-this-repository-navigation-item selected">
            <span class="select-menu-item-icon octicon octicon-check"></span>
            <input type="radio" class="js-search-this-repository" name="search_target" value="repository" checked="checked" />
            <div class="select-menu-item-text js-select-button-text">This repository</div>
          </div> <!-- /.select-menu-item -->

          <div class="select-menu-item js-navigation-item js-all-repositories-navigation-item">
            <span class="select-menu-item-icon octicon octicon-check"></span>
            <input type="radio" name="search_target" value="global" />
            <div class="select-menu-item-text js-select-button-text">All repositories</div>
          </div> <!-- /.select-menu-item -->

        </div>
      </div>
    </div>

  <span class="help tooltipped tooltipped-s" aria-label="Show command bar help">
    <span class="octicon octicon-question"></span>
  </span>


  <input type="hidden" name="ref" value="cmdform">

</form>
        <ul class="top-nav">
          <li class="explore"><a href="/explore">Explore</a></li>
            <li><a href="https://gist.github.com">Gist</a></li>
            <li><a href="/blog">Blog</a></li>
          <li><a href="https://help.github.com">Help</a></li>
        </ul>
      </div>

    

<ul id="user-links">
  <li>
    <a href="/absolutelyNoWarranty" class="name">
      <img alt="absolutelyNoWarranty" class=" js-avatar" data-user="1489338" height="20" src="https://avatars2.githubusercontent.com/u/1489338?s=140" width="20" /> absolutelyNoWarranty
    </a>
  </li>

  <li class="new-menu dropdown-toggle js-menu-container">
    <a href="#" class="js-menu-target tooltipped tooltipped-s" aria-label="Create new...">
      <span class="octicon octicon-plus"></span>
      <span class="dropdown-arrow"></span>
    </a>

    <div class="new-menu-content js-menu-content">
    </div>
  </li>

  <li>
    <a href="/settings/profile" id="account_settings"
      class="tooltipped tooltipped-s"
      aria-label="Account settings ">
      <span class="octicon octicon-tools"></span>
    </a>
  </li>
  <li>
    <form accept-charset="UTF-8" action="/logout" class="logout-form" method="post"><div style="margin:0;padding:0;display:inline"><input name="authenticity_token" type="hidden" value="biOC2EWUOJtEjHFF6DYK04934/4qcB6380gcvhf0WSp0HzBeOzqvvIFm86jCPXbC8T3Usuy+oOVzcu4o03XUOQ==" /></div>
      <button class="sign-out-button tooltipped tooltipped-s" aria-label="Sign out">
        <span class="octicon octicon-sign-out"></span>
      </button>
</form>  </li>

</ul>

<div class="js-new-dropdown-contents hidden">
  

<ul class="dropdown-menu">
  <li>
    <a href="/new"><span class="octicon octicon-repo"></span> New repository</a>
  </li>
  <li>
    <a href="/organizations/new"><span class="octicon octicon-organization"></span> New organization</a>
  </li>


    <li class="section-title">
      <span title="dsmi-lab-ntust/AnomalyDetectionToolbox">This repository</span>
    </li>
      <li>
        <a href="/dsmi-lab-ntust/AnomalyDetectionToolbox/issues/new"><span class="octicon octicon-issue-opened"></span> New issue</a>
      </li>
</ul>

</div>


    
  </div>
</div>

      

        



      <div id="start-of-content" class="accessibility-aid"></div>
          <div class="site" itemscope itemtype="http://schema.org/WebPage">
    <div id="js-flash-container">
      
    </div>
    <div class="pagehead repohead instapaper_ignore readability-menu">
      <div class="container">
        
<ul class="pagehead-actions">

    <li class="subscription">
      <form accept-charset="UTF-8" action="/notifications/subscribe" class="js-social-container" data-autosubmit="true" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="authenticity_token" type="hidden" value="1cNe8HcEh0kw3GeNkcxbWJynFWtTZyaGOWTjIdPewS6VXSOL8XtH08ybdzEX2KNqH6taGh6z+fTry40B62hGxw==" /></div>  <input id="repository_id" name="repository_id" type="hidden" value="16719173" />

    <div class="select-menu js-menu-container js-select-menu">
      <a class="social-count js-social-count" href="/dsmi-lab-ntust/AnomalyDetectionToolbox/watchers">
        9
      </a>
      <a href="/dsmi-lab-ntust/AnomalyDetectionToolbox/subscription"
        class="minibutton select-menu-button with-count js-menu-target" role="button" tabindex="0" aria-haspopup="true">
        <span class="js-select-button">
          <span class="octicon octicon-eye"></span>
          Unwatch
        </span>
      </a>

      <div class="select-menu-modal-holder">
        <div class="select-menu-modal subscription-menu-modal js-menu-content" aria-hidden="true">
          <div class="select-menu-header">
            <span class="select-menu-title">Notifications</span>
            <span class="octicon octicon-x js-menu-close"></span>
          </div> <!-- /.select-menu-header -->

          <div class="select-menu-list js-navigation-container" role="menu">

            <div class="select-menu-item js-navigation-item " role="menuitem" tabindex="0">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <div class="select-menu-item-text">
                <input id="do_included" name="do" type="radio" value="included" />
                <h4>Not watching</h4>
                <span class="description">Be notified when participating or @mentioned.</span>
                <span class="js-select-button-text hidden-select-button-text">
                  <span class="octicon octicon-eye"></span>
                  Watch
                </span>
              </div>
            </div> <!-- /.select-menu-item -->

            <div class="select-menu-item js-navigation-item selected" role="menuitem" tabindex="0">
              <span class="select-menu-item-icon octicon octicon octicon-check"></span>
              <div class="select-menu-item-text">
                <input checked="checked" id="do_subscribed" name="do" type="radio" value="subscribed" />
                <h4>Watching</h4>
                <span class="description">Be notified of all conversations.</span>
                <span class="js-select-button-text hidden-select-button-text">
                  <span class="octicon octicon-eye"></span>
                  Unwatch
                </span>
              </div>
            </div> <!-- /.select-menu-item -->

            <div class="select-menu-item js-navigation-item " role="menuitem" tabindex="0">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <div class="select-menu-item-text">
                <input id="do_ignore" name="do" type="radio" value="ignore" />
                <h4>Ignoring</h4>
                <span class="description">Never be notified.</span>
                <span class="js-select-button-text hidden-select-button-text">
                  <span class="octicon octicon-mute"></span>
                  Stop ignoring
                </span>
              </div>
            </div> <!-- /.select-menu-item -->

          </div> <!-- /.select-menu-list -->

        </div> <!-- /.select-menu-modal -->
      </div> <!-- /.select-menu-modal-holder -->
    </div> <!-- /.select-menu -->

</form>
    </li>

  <li>
    

  <div class="js-toggler-container js-social-container starring-container ">

    <form accept-charset="UTF-8" action="/dsmi-lab-ntust/AnomalyDetectionToolbox/unstar" class="js-toggler-form starred" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="authenticity_token" type="hidden" value="KUDlnqIrLlSOH0/+o/VTmlBZaPa7JGyz7hy3XHLMlzGWiqJTb0KXDRpGgWMjQyNg7am9IkFi11zXxXQvipfEDA==" /></div>
      <button
        class="minibutton with-count js-toggler-target star-button"
        aria-label="Unstar this repository" title="Unstar dsmi-lab-ntust/AnomalyDetectionToolbox">
        <span class="octicon octicon-star"></span>
        Unstar
      </button>
        <a class="social-count js-social-count" href="/dsmi-lab-ntust/AnomalyDetectionToolbox/stargazers">
          2
        </a>
</form>
    <form accept-charset="UTF-8" action="/dsmi-lab-ntust/AnomalyDetectionToolbox/star" class="js-toggler-form unstarred" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="authenticity_token" type="hidden" value="Xo5hsQjxjFFyeV6XGqyvnD7gyGpUlgSqFgMHQv4WE8hfo5gK5mjkTeY/SzCdhGI1H9EK6PYgsJ2Ax9LECWLBtw==" /></div>
      <button
        class="minibutton with-count js-toggler-target star-button"
        aria-label="Star this repository" title="Star dsmi-lab-ntust/AnomalyDetectionToolbox">
        <span class="octicon octicon-star"></span>
        Star
      </button>
        <a class="social-count js-social-count" href="/dsmi-lab-ntust/AnomalyDetectionToolbox/stargazers">
          2
        </a>
</form>  </div>

  </li>


        <li>
          <a href="/dsmi-lab-ntust/AnomalyDetectionToolbox/fork" class="minibutton with-count js-toggler-target fork-button lighter tooltipped-n" title="Fork your own copy of dsmi-lab-ntust/AnomalyDetectionToolbox to your account" aria-label="Fork your own copy of dsmi-lab-ntust/AnomalyDetectionToolbox to your account" rel="nofollow" data-method="post">
            <span class="octicon octicon-repo-forked"></span>
            Fork
          </a>
          <a href="/dsmi-lab-ntust/AnomalyDetectionToolbox/network" class="social-count">4</a>
        </li>

</ul>

        <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title public">
          <span class="repo-label"><span>public</span></span>
          <span class="mega-octicon octicon-repo"></span>
          <span class="author"><a href="/dsmi-lab-ntust" class="url fn" itemprop="url" rel="author"><span itemprop="title">dsmi-lab-ntust</span></a></span><!--
       --><span class="path-divider">/</span><!--
       --><strong><a href="/dsmi-lab-ntust/AnomalyDetectionToolbox" class="js-current-repository js-repo-home-link">AnomalyDetectionToolbox</a></strong>

          <span class="page-context-loader">
            <img alt="" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
          </span>

        </h1>
      </div><!-- /.container -->
    </div><!-- /.repohead -->

    <div class="container">
      <div class="repository-with-sidebar repo-container new-discussion-timeline js-new-discussion-timeline  ">
        <div class="repository-sidebar clearfix">
            

<div class="sunken-menu vertical-right repo-nav js-repo-nav js-repository-container-pjax js-octicon-loaders">
  <div class="sunken-menu-contents">
    <ul class="sunken-menu-group">
      <li class="tooltipped tooltipped-w" aria-label="Code">
        <a href="/dsmi-lab-ntust/AnomalyDetectionToolbox" aria-label="Code" class="selected js-selected-navigation-item sunken-menu-item" data-hotkey="g c" data-pjax="true" data-selected-links="repo_source repo_downloads repo_commits repo_releases repo_tags repo_branches /dsmi-lab-ntust/AnomalyDetectionToolbox">
          <span class="octicon octicon-code"></span> <span class="full-word">Code</span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

        <li class="tooltipped tooltipped-w" aria-label="Issues">
          <a href="/dsmi-lab-ntust/AnomalyDetectionToolbox/issues" aria-label="Issues" class="js-selected-navigation-item sunken-menu-item js-disable-pjax" data-hotkey="g i" data-selected-links="repo_issues /dsmi-lab-ntust/AnomalyDetectionToolbox/issues">
            <span class="octicon octicon-issue-opened"></span> <span class="full-word">Issues</span>
            <span class='counter'>0</span>
            <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>        </li>

      <li class="tooltipped tooltipped-w" aria-label="Pull Requests">
        <a href="/dsmi-lab-ntust/AnomalyDetectionToolbox/pulls" aria-label="Pull Requests" class="js-selected-navigation-item sunken-menu-item js-disable-pjax" data-hotkey="g p" data-selected-links="repo_pulls /dsmi-lab-ntust/AnomalyDetectionToolbox/pulls">
            <span class="octicon octicon-git-pull-request"></span> <span class="full-word">Pull Requests</span>
            <span class='counter'>0</span>
            <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>


        <li class="tooltipped tooltipped-w" aria-label="Wiki">
          <a href="/dsmi-lab-ntust/AnomalyDetectionToolbox/wiki" aria-label="Wiki" class="js-selected-navigation-item sunken-menu-item js-disable-pjax" data-hotkey="g w" data-selected-links="repo_wiki /dsmi-lab-ntust/AnomalyDetectionToolbox/wiki">
            <span class="octicon octicon-book"></span> <span class="full-word">Wiki</span>
            <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>        </li>
    </ul>
    <div class="sunken-menu-separator"></div>
    <ul class="sunken-menu-group">

      <li class="tooltipped tooltipped-w" aria-label="Pulse">
        <a href="/dsmi-lab-ntust/AnomalyDetectionToolbox/pulse" aria-label="Pulse" class="js-selected-navigation-item sunken-menu-item" data-pjax="true" data-selected-links="pulse /dsmi-lab-ntust/AnomalyDetectionToolbox/pulse">
          <span class="octicon octicon-pulse"></span> <span class="full-word">Pulse</span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

      <li class="tooltipped tooltipped-w" aria-label="Graphs">
        <a href="/dsmi-lab-ntust/AnomalyDetectionToolbox/graphs" aria-label="Graphs" class="js-selected-navigation-item sunken-menu-item" data-pjax="true" data-selected-links="repo_graphs repo_contributors /dsmi-lab-ntust/AnomalyDetectionToolbox/graphs">
          <span class="octicon octicon-graph"></span> <span class="full-word">Graphs</span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

      <li class="tooltipped tooltipped-w" aria-label="Network">
        <a href="/dsmi-lab-ntust/AnomalyDetectionToolbox/network" aria-label="Network" class="js-selected-navigation-item sunken-menu-item js-disable-pjax" data-selected-links="repo_network /dsmi-lab-ntust/AnomalyDetectionToolbox/network">
          <span class="octicon octicon-repo-forked"></span> <span class="full-word">Network</span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>
    </ul>


  </div>
</div>

              <div class="only-with-full-nav">
                

  

<div class="clone-url "
  data-protocol-type="http"
  data-url="/users/set_protocol?protocol_selector=http&amp;protocol_type=push">
  <h3><strong>HTTPS</strong> clone URL</h3>
  <div class="clone-url-box">
    <input type="text" class="clone js-url-field"
           value="https://github.com/dsmi-lab-ntust/AnomalyDetectionToolbox.git" readonly="readonly">
    <span class="url-box-clippy">
    <button aria-label="Copy to clipboard" class="js-zeroclipboard minibutton zeroclipboard-button" data-clipboard-text="https://github.com/dsmi-lab-ntust/AnomalyDetectionToolbox.git" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>

  

<div class="clone-url open"
  data-protocol-type="ssh"
  data-url="/users/set_protocol?protocol_selector=ssh&amp;protocol_type=push">
  <h3><strong>SSH</strong> clone URL</h3>
  <div class="clone-url-box">
    <input type="text" class="clone js-url-field"
           value="git@github.com:dsmi-lab-ntust/AnomalyDetectionToolbox.git" readonly="readonly">
    <span class="url-box-clippy">
    <button aria-label="Copy to clipboard" class="js-zeroclipboard minibutton zeroclipboard-button" data-clipboard-text="git@github.com:dsmi-lab-ntust/AnomalyDetectionToolbox.git" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>

  

<div class="clone-url "
  data-protocol-type="subversion"
  data-url="/users/set_protocol?protocol_selector=subversion&amp;protocol_type=push">
  <h3><strong>Subversion</strong> checkout URL</h3>
  <div class="clone-url-box">
    <input type="text" class="clone js-url-field"
           value="https://github.com/dsmi-lab-ntust/AnomalyDetectionToolbox" readonly="readonly">
    <span class="url-box-clippy">
    <button aria-label="Copy to clipboard" class="js-zeroclipboard minibutton zeroclipboard-button" data-clipboard-text="https://github.com/dsmi-lab-ntust/AnomalyDetectionToolbox" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>


<p class="clone-options">You can clone with
      <a href="#" class="js-clone-selector" data-protocol="http">HTTPS</a>,
      <a href="#" class="js-clone-selector" data-protocol="ssh">SSH</a>,
      or <a href="#" class="js-clone-selector" data-protocol="subversion">Subversion</a>.
  <a href="https://help.github.com/articles/which-remote-url-should-i-use" class="help tooltipped tooltipped-n" aria-label="Get help on which URL is right for you.">
    <span class="octicon octicon-question"></span>
  </a>
</p>


  <a href="github-windows://openRepo/https://github.com/dsmi-lab-ntust/AnomalyDetectionToolbox" class="minibutton sidebar-button" title="Save dsmi-lab-ntust/AnomalyDetectionToolbox to your computer and use it in GitHub Desktop." aria-label="Save dsmi-lab-ntust/AnomalyDetectionToolbox to your computer and use it in GitHub Desktop.">
    <span class="octicon octicon-device-desktop"></span>
    Clone in Desktop
  </a>

                <a href="/dsmi-lab-ntust/AnomalyDetectionToolbox/archive/master.zip"
                   class="minibutton sidebar-button"
                   aria-label="Download dsmi-lab-ntust/AnomalyDetectionToolbox as a zip file"
                   title="Download dsmi-lab-ntust/AnomalyDetectionToolbox as a zip file"
                   rel="nofollow">
                  <span class="octicon octicon-cloud-download"></span>
                  Download ZIP
                </a>
              </div>
        </div><!-- /.repository-sidebar -->

        <div id="js-repo-pjax-container" class="repository-content context-loader-container" data-pjax-container>
          


<a href="/dsmi-lab-ntust/AnomalyDetectionToolbox/blob/66e34688442399332c67d4660b0eec1a874fac85/benchmarks/PointAnomaly/SPECT_Heart_Data_Set%20/readme.txt" class="hidden js-permalink-shortcut" data-hotkey="y">Permalink</a>

<!-- blob contrib key: blob_contributors:v21:91436e6d807bbdd4fd132c39fdc3c4b2 -->

<p title="This is a placeholder element" class="js-history-link-replace hidden"></p>

<div class="file-navigation">
  

<div class="select-menu js-menu-container js-select-menu" >
  <span class="minibutton select-menu-button js-menu-target css-truncate" data-hotkey="w"
    data-master-branch="master"
    data-ref="master"
    title="master"
    role="button" aria-label="Switch branches or tags" tabindex="0" aria-haspopup="true">
    <span class="octicon octicon-git-branch"></span>
    <i>branch:</i>
    <span class="js-select-button css-truncate-target">master</span>
  </span>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax aria-hidden="true">

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <span class="select-menu-title">Switch branches/tags</span>
        <span class="octicon octicon-x js-menu-close"></span>
      </div> <!-- /.select-menu-header -->

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" aria-label="Find or create a branch…" id="context-commitish-filter-field" class="js-filterable-field js-navigation-enable" placeholder="Find or create a branch…">
        </div>
        <div class="select-menu-tabs">
          <ul>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="branches" class="js-select-menu-tab">Branches</a>
            </li>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="tags" class="js-select-menu-tab">Tags</a>
            </li>
          </ul>
        </div><!-- /.select-menu-tabs -->
      </div><!-- /.select-menu-filters -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/dsmi-lab-ntust/AnomalyDetectionToolbox/blob/gh-pages/benchmarks/PointAnomaly/SPECT_Heart_Data_Set%20/readme.txt"
                 data-name="gh-pages"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="gh-pages">gh-pages</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item selected">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/dsmi-lab-ntust/AnomalyDetectionToolbox/blob/master/benchmarks/PointAnomaly/SPECT_Heart_Data_Set%20/readme.txt"
                 data-name="master"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="master">master</a>
            </div> <!-- /.select-menu-item -->
        </div>

          <form accept-charset="UTF-8" action="/dsmi-lab-ntust/AnomalyDetectionToolbox/branches" class="js-create-branch select-menu-item select-menu-new-item-form js-navigation-item js-new-item-form" method="post"><div style="margin:0;padding:0;display:inline"><input name="authenticity_token" type="hidden" value="6Z8X6/9AO6wpvjdqeURAh8loKPg6hM7MuzgFY9NV8nup0Y4W7AUl2LOtLD4trP4oL7Kw8crffEHdTwiyD4kY8A==" /></div>
            <span class="octicon octicon-git-branch select-menu-item-icon"></span>
            <div class="select-menu-item-text">
              <h4>Create branch: <span class="js-new-item-name"></span></h4>
              <span class="description">from ‘master’</span>
            </div>
            <input type="hidden" name="name" id="name" class="js-new-item-value">
            <input type="hidden" name="branch" id="branch" value="master" />
            <input type="hidden" name="path" id="path" value="benchmarks/PointAnomaly/SPECT_Heart_Data_Set /readme.txt" />
          </form> <!-- /.select-menu-item -->

      </div> <!-- /.select-menu-list -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div> <!-- /.select-menu-list -->

    </div> <!-- /.select-menu-modal -->
  </div> <!-- /.select-menu-modal-holder -->
</div> <!-- /.select-menu -->

  <div class="button-group right">
    <a href="/dsmi-lab-ntust/AnomalyDetectionToolbox/find/master"
          class="js-show-file-finder minibutton empty-icon tooltipped tooltipped-s"
          data-pjax
          data-hotkey="t"
          aria-label="Quickly jump between files">
      <span class="octicon octicon-list-unordered"></span>
    </a>
    <button class="js-zeroclipboard minibutton zeroclipboard-button"
          data-clipboard-text="benchmarks/PointAnomaly/SPECT_Heart_Data_Set /readme.txt"
          aria-label="Copy to clipboard"
          data-copied-hint="Copied!">
      <span class="octicon octicon-clippy"></span>
    </button>
  </div>

  <div class="breadcrumb">
    <span class='repo-root js-repo-root'><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/dsmi-lab-ntust/AnomalyDetectionToolbox" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">AnomalyDetectionToolbox</span></a></span></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/dsmi-lab-ntust/AnomalyDetectionToolbox/tree/master/benchmarks" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">benchmarks</span></a></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/dsmi-lab-ntust/AnomalyDetectionToolbox/tree/master/benchmarks/PointAnomaly" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">PointAnomaly</span></a></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/dsmi-lab-ntust/AnomalyDetectionToolbox/tree/master/benchmarks/PointAnomaly/SPECT_Heart_Data_Set%20" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">SPECT_Heart_Data_Set </span></a></span><span class="separator"> / </span><strong class="final-path">readme.txt</strong>
  </div>
</div>


  <div class="commit file-history-tease">
      <img alt="ChaikaChen" class="main-avatar js-avatar" data-user="8089468" height="24" src="https://avatars0.githubusercontent.com/u/8089468?s=140" width="24" />
      <span class="author"><a href="/ChaikaChen" rel="contributor">ChaikaChen</a></span>
      <time datetime="2014-07-15T01:07:38+08:00" is="relative-time">July 15, 2014</time>
      <div class="commit-title">
          <a href="/dsmi-lab-ntust/AnomalyDetectionToolbox/commit/66e34688442399332c67d4660b0eec1a874fac85" class="message" data-pjax="true" title="edited readme file">edited readme file</a>
      </div>

    <div class="participation">
      <p class="quickstat"><a href="#blob_contributors_box" rel="facebox"><strong>1</strong>  contributor</a></p>
      
    </div>
    <div id="blob_contributors_box" style="display:none">
      <h2 class="facebox-header">Users who have contributed to this file</h2>
      <ul class="facebox-user-list">
          <li class="facebox-user-list-item">
            <img alt="ChaikaChen" class=" js-avatar" data-user="8089468" height="24" src="https://avatars0.githubusercontent.com/u/8089468?s=140" width="24" />
            <a href="/ChaikaChen">ChaikaChen</a>
          </li>
      </ul>
    </div>
  </div>

<div class="file-box">
  <div class="file">
    <div class="meta clearfix">
      <div class="info file-name">
        <span class="icon"><b class="octicon octicon-file-text"></b></span>
        <span class="mode" title="File Mode">file</span>
        <span class="meta-divider"></span>
          <span>81 lines (69 sloc)</span>
          <span class="meta-divider"></span>
        <span>3.247 kb</span>
      </div>
      <div class="actions">
        <div class="button-group">
            <a class="minibutton tooltipped tooltipped-w"
               href="github-windows://openRepo/https://github.com/dsmi-lab-ntust/AnomalyDetectionToolbox?branch=master&amp;filepath=benchmarks%2FPointAnomaly%2FSPECT_Heart_Data_Set%20%2Freadme.txt" aria-label="Open this file in GitHub for Windows">
                <span class="octicon octicon-device-desktop"></span> Open
            </a>
                <a class="minibutton js-update-url-with-hash"
                   href="/dsmi-lab-ntust/AnomalyDetectionToolbox/edit/master/benchmarks/PointAnomaly/SPECT_Heart_Data_Set%20/readme.txt"
                   data-method="post" rel="nofollow" data-hotkey="e">Edit</a>
          <a href="/dsmi-lab-ntust/AnomalyDetectionToolbox/raw/master/benchmarks/PointAnomaly/SPECT_Heart_Data_Set%20/readme.txt" class="minibutton " id="raw-url">Raw</a>
            <a href="/dsmi-lab-ntust/AnomalyDetectionToolbox/blame/master/benchmarks/PointAnomaly/SPECT_Heart_Data_Set%20/readme.txt" class="minibutton js-update-url-with-hash">Blame</a>
          <a href="/dsmi-lab-ntust/AnomalyDetectionToolbox/commits/master/benchmarks/PointAnomaly/SPECT_Heart_Data_Set%20/readme.txt" class="minibutton " rel="nofollow">History</a>
        </div><!-- /.button-group -->

            <a class="minibutton danger empty-icon"
               href="/dsmi-lab-ntust/AnomalyDetectionToolbox/delete/master/benchmarks/PointAnomaly/SPECT_Heart_Data_Set%20/readme.txt"
               data-method="post" data-test-id="delete-blob-file" rel="nofollow">

          Delete
        </a>
      </div><!-- /.actions -->
    </div>
      
  <div class="blob-wrapper data type-text js-blob-data">
       <table class="file-code file-diff tab-size-8">
         <tr class="file-code-line">
           <td class="blob-line-nums">
             <span id="L1" rel="#L1">1</span>
<span id="L2" rel="#L2">2</span>
<span id="L3" rel="#L3">3</span>
<span id="L4" rel="#L4">4</span>
<span id="L5" rel="#L5">5</span>
<span id="L6" rel="#L6">6</span>
<span id="L7" rel="#L7">7</span>
<span id="L8" rel="#L8">8</span>
<span id="L9" rel="#L9">9</span>
<span id="L10" rel="#L10">10</span>
<span id="L11" rel="#L11">11</span>
<span id="L12" rel="#L12">12</span>
<span id="L13" rel="#L13">13</span>
<span id="L14" rel="#L14">14</span>
<span id="L15" rel="#L15">15</span>
<span id="L16" rel="#L16">16</span>
<span id="L17" rel="#L17">17</span>
<span id="L18" rel="#L18">18</span>
<span id="L19" rel="#L19">19</span>
<span id="L20" rel="#L20">20</span>
<span id="L21" rel="#L21">21</span>
<span id="L22" rel="#L22">22</span>
<span id="L23" rel="#L23">23</span>
<span id="L24" rel="#L24">24</span>
<span id="L25" rel="#L25">25</span>
<span id="L26" rel="#L26">26</span>
<span id="L27" rel="#L27">27</span>
<span id="L28" rel="#L28">28</span>
<span id="L29" rel="#L29">29</span>
<span id="L30" rel="#L30">30</span>
<span id="L31" rel="#L31">31</span>
<span id="L32" rel="#L32">32</span>
<span id="L33" rel="#L33">33</span>
<span id="L34" rel="#L34">34</span>
<span id="L35" rel="#L35">35</span>
<span id="L36" rel="#L36">36</span>
<span id="L37" rel="#L37">37</span>
<span id="L38" rel="#L38">38</span>
<span id="L39" rel="#L39">39</span>
<span id="L40" rel="#L40">40</span>
<span id="L41" rel="#L41">41</span>
<span id="L42" rel="#L42">42</span>
<span id="L43" rel="#L43">43</span>
<span id="L44" rel="#L44">44</span>
<span id="L45" rel="#L45">45</span>
<span id="L46" rel="#L46">46</span>
<span id="L47" rel="#L47">47</span>
<span id="L48" rel="#L48">48</span>
<span id="L49" rel="#L49">49</span>
<span id="L50" rel="#L50">50</span>
<span id="L51" rel="#L51">51</span>
<span id="L52" rel="#L52">52</span>
<span id="L53" rel="#L53">53</span>
<span id="L54" rel="#L54">54</span>
<span id="L55" rel="#L55">55</span>
<span id="L56" rel="#L56">56</span>
<span id="L57" rel="#L57">57</span>
<span id="L58" rel="#L58">58</span>
<span id="L59" rel="#L59">59</span>
<span id="L60" rel="#L60">60</span>
<span id="L61" rel="#L61">61</span>
<span id="L62" rel="#L62">62</span>
<span id="L63" rel="#L63">63</span>
<span id="L64" rel="#L64">64</span>
<span id="L65" rel="#L65">65</span>
<span id="L66" rel="#L66">66</span>
<span id="L67" rel="#L67">67</span>
<span id="L68" rel="#L68">68</span>
<span id="L69" rel="#L69">69</span>
<span id="L70" rel="#L70">70</span>
<span id="L71" rel="#L71">71</span>
<span id="L72" rel="#L72">72</span>
<span id="L73" rel="#L73">73</span>
<span id="L74" rel="#L74">74</span>
<span id="L75" rel="#L75">75</span>
<span id="L76" rel="#L76">76</span>
<span id="L77" rel="#L77">77</span>
<span id="L78" rel="#L78">78</span>
<span id="L79" rel="#L79">79</span>
<span id="L80" rel="#L80">80</span>
<span id="L81" rel="#L81">81</span>

           </td>
           <td class="blob-line-code"><div class="code-body highlight"><pre><div class='line' id='LC1'>-Single Proton Emission Computed Tomography (SPECT dataset)</div><div class='line' id='LC2'>The dataset describes diagnosing of cardiac Single Proton Emission Computed Tomography (SPECT) images.  </div><div class='line' id='LC3'><br/></div><div class='line' id='LC4'>-Description</div><div class='line' id='LC5'>Each of the patients is classified into two categories: normal and anomaly. </div><div class='line' id='LC6'>The database of 181 SPECT image sets (patients) was processed to extract features that summarize the original SPECT images.</div><div class='line' id='LC7'><br/></div><div class='line' id='LC8'>-Attribute</div><div class='line' id='LC9'>&nbsp;&nbsp;&nbsp;1.   F1R:   continuous (count in ROI (region of interest) 1 in rest)</div><div class='line' id='LC10'>&nbsp;&nbsp;&nbsp;2.   F1S:   continuous (count in ROI 1 in stress)</div><div class='line' id='LC11'>&nbsp;&nbsp;&nbsp;3.   F2R:   continuous (count in ROI 2 in rest)</div><div class='line' id='LC12'>&nbsp;&nbsp;&nbsp;4.   F2S:   continuous (count in ROI 2 in stress)</div><div class='line' id='LC13'>&nbsp;&nbsp;&nbsp;5.   F3R:   continuous (count in ROI 3 in rest)</div><div class='line' id='LC14'>&nbsp;&nbsp;&nbsp;6.   F3S:   continuous (count in ROI 3 in stress)</div><div class='line' id='LC15'>&nbsp;&nbsp;&nbsp;7.   F4R:   continuous (count in ROI 4 in rest)</div><div class='line' id='LC16'>&nbsp;&nbsp;&nbsp;8.   F4S:   continuous (count in ROI 4 in stress)</div><div class='line' id='LC17'>&nbsp;&nbsp;&nbsp;9.   F5R:   continuous (count in ROI 5 in rest)</div><div class='line' id='LC18'>&nbsp;&nbsp;&nbsp;10.  F5S:   continuous (count in ROI 5 in stress)</div><div class='line' id='LC19'>&nbsp;&nbsp;&nbsp;11.  F6R:   continuous (count in ROI 6 in rest)</div><div class='line' id='LC20'>&nbsp;&nbsp;&nbsp;12.  F6S:   continuous (count in ROI 6 in stress)</div><div class='line' id='LC21'>&nbsp;&nbsp;&nbsp;13.  F7R:   continuous (count in ROI 7 in rest)</div><div class='line' id='LC22'>&nbsp;&nbsp;&nbsp;14.  F7S:   continuous (count in ROI 7 in stress)</div><div class='line' id='LC23'>&nbsp;&nbsp;&nbsp;15.  F8R:   continuous (count in ROI 8 in rest)</div><div class='line' id='LC24'>&nbsp;&nbsp;&nbsp;16.  F8S:   continuous (count in ROI 8 in stress)</div><div class='line' id='LC25'>&nbsp;&nbsp;&nbsp;17.  F9R:   continuous (count in ROI 9 in rest)</div><div class='line' id='LC26'>&nbsp;&nbsp;&nbsp;18.  F9S:   continuous (count in ROI 9 in stress)</div><div class='line' id='LC27'>&nbsp;&nbsp;&nbsp;19.  F10R:  continuous (count in ROI 10 in rest)</div><div class='line' id='LC28'>&nbsp;&nbsp;&nbsp;20.  F10S:  continuous (count in ROI 10 in stress)</div><div class='line' id='LC29'>&nbsp;&nbsp;&nbsp;21.  F11R:  continuous (count in ROI 11 in rest)</div><div class='line' id='LC30'>&nbsp;&nbsp;&nbsp;22.  F11S:  continuous (count in ROI 11 in stress)</div><div class='line' id='LC31'>&nbsp;&nbsp;&nbsp;23.  F12R:  continuous (count in ROI 12 in rest)</div><div class='line' id='LC32'>&nbsp;&nbsp;&nbsp;24.  F12S:  continuous (count in ROI 12 in stress)</div><div class='line' id='LC33'>&nbsp;&nbsp;&nbsp;25.  F13R:  continuous (count in ROI 13 in rest)</div><div class='line' id='LC34'>&nbsp;&nbsp;&nbsp;26.  F13S:  continuous (count in ROI 13 in stress)</div><div class='line' id='LC35'>&nbsp;&nbsp;&nbsp;27.  F14R:  continuous (count in ROI 14 in rest)</div><div class='line' id='LC36'>&nbsp;&nbsp;&nbsp;28.  F14S:  continuous (count in ROI 14 in stress)</div><div class='line' id='LC37'>&nbsp;&nbsp;&nbsp;29.  F15R:  continuous (count in ROI 15 in rest)</div><div class='line' id='LC38'>&nbsp;&nbsp;&nbsp;30.  F15S:  continuous (count in ROI 15 in stress)</div><div class='line' id='LC39'>&nbsp;&nbsp;&nbsp;31.  F16R:  continuous (count in ROI 16 in rest)</div><div class='line' id='LC40'>&nbsp;&nbsp;&nbsp;32.  F16S:  continuous (count in ROI 16 in stress)</div><div class='line' id='LC41'>&nbsp;&nbsp;&nbsp;33.  F17R:  continuous (count in ROI 17 in rest)</div><div class='line' id='LC42'>&nbsp;&nbsp;&nbsp;34.  F17S:  continuous (count in ROI 17 in stress)</div><div class='line' id='LC43'>&nbsp;&nbsp;&nbsp;35.  F18R:  continuous (count in ROI 18 in rest)</div><div class='line' id='LC44'>&nbsp;&nbsp;&nbsp;36.  F18S:  continuous (count in ROI 18 in stress)</div><div class='line' id='LC45'>&nbsp;&nbsp;&nbsp;37.  F19R:  continuous (count in ROI 19 in rest)</div><div class='line' id='LC46'>&nbsp;&nbsp;&nbsp;38.  F19S:  continuous (count in ROI 19 in stress)</div><div class='line' id='LC47'>&nbsp;&nbsp;&nbsp;39.  F20R:  continuous (count in ROI 20 in rest)</div><div class='line' id='LC48'>&nbsp;&nbsp;&nbsp;40.  F20S:  continuous (count in ROI 20 in stress)</div><div class='line' id='LC49'>&nbsp;&nbsp;&nbsp;41.  F21R:  continuous (count in ROI 21 in rest)</div><div class='line' id='LC50'>&nbsp;&nbsp;&nbsp;42.  F21S:  continuous (count in ROI 21 in stress)</div><div class='line' id='LC51'>&nbsp;&nbsp;&nbsp;43.  F22R:  continuous (count in ROI 22 in rest)</div><div class='line' id='LC52'>&nbsp;&nbsp;&nbsp;44.  F22S:  continuous (count in ROI 22 in stress)</div><div class='line' id='LC53'>&nbsp;&nbsp;&nbsp;45.  OVERALL_DIAGNOSIS: 0,1 (class attribute, 0:normal and 1:anomaly)</div><div class='line' id='LC54'><br/></div><div class='line' id='LC55'>-Number of Instances: </div><div class='line' id='LC56'>	181</div><div class='line' id='LC57'><br/></div><div class='line' id='LC58'>-Number of Attributes: </div><div class='line' id='LC59'>	45 (44 continuous + 1 binary class)</div><div class='line' id='LC60'><br/></div><div class='line' id='LC61'>-Number of Normal:</div><div class='line' id='LC62'>	172</div><div class='line' id='LC63'><br/></div><div class='line' id='LC64'>Number of Anomaly:</div><div class='line' id='LC65'>	9</div><div class='line' id='LC66'><br/></div><div class='line' id='LC67'>-Source</div><div class='line' id='LC68'><br/></div><div class='line' id='LC69'>Original Owners: </div><div class='line' id='LC70'><br/></div><div class='line' id='LC71'>Krzysztof J. Cios, Lukasz A. Kurgan </div><div class='line' id='LC72'>University of Colorado at Denver, Denver, CO 80217, U.S.A. </div><div class='line' id='LC73'>Krys.Cios &#39;@&#39; cudenver.edu </div><div class='line' id='LC74'>Lucy S. Goodenday </div><div class='line' id='LC75'>Medical College of Ohio, OH, U.S.A. </div><div class='line' id='LC76'><br/></div><div class='line' id='LC77'>Donors: </div><div class='line' id='LC78'><br/></div><div class='line' id='LC79'>Lukasz A.Kurgan, Krzysztof J. Cios</div><div class='line' id='LC80'><br/></div><div class='line' id='LC81'>http://archive.ics.uci.edu/ml/datasets/SPECT+Heart</div></pre></div></td>
         </tr>
       </table>
  </div>

  </div>
</div>

<a href="#jump-to-line" rel="facebox[.linejump]" data-hotkey="l" class="js-jump-to-line" style="display:none">Jump to Line</a>
<div id="jump-to-line" style="display:none">
  <form accept-charset="UTF-8" class="js-jump-to-line-form">
    <input class="linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" autofocus>
    <button type="submit" class="button">Go</button>
  </form>
</div>

        </div>

      </div><!-- /.repo-container -->
      <div class="modal-backdrop"></div>
    </div><!-- /.container -->
  </div><!-- /.site -->


    </div><!-- /.wrapper -->

      <div class="container">
  <div class="site-footer">
    <ul class="site-footer-links right">
      <li><a href="https://status.github.com/">Status</a></li>
      <li><a href="http://developer.github.com">API</a></li>
      <li><a href="http://training.github.com">Training</a></li>
      <li><a href="http://shop.github.com">Shop</a></li>
      <li><a href="/blog">Blog</a></li>
      <li><a href="/about">About</a></li>

    </ul>

    <a href="/">
      <span class="mega-octicon octicon-mark-github" title="GitHub"></span>
    </a>

    <ul class="site-footer-links">
      <li>&copy; 2014 <span title="0.04990s from github-fe116-cp1-prd.iad.github.net">GitHub</span>, Inc.</li>
        <li><a href="/site/terms">Terms</a></li>
        <li><a href="/site/privacy">Privacy</a></li>
        <li><a href="/security">Security</a></li>
        <li><a href="/contact">Contact</a></li>
    </ul>
  </div><!-- /.site-footer -->
</div><!-- /.container -->


    <div class="fullscreen-overlay js-fullscreen-overlay" id="fullscreen_overlay">
  <div class="fullscreen-container js-fullscreen-container">
    <div class="textarea-wrap">
      <textarea name="fullscreen-contents" id="fullscreen-contents" class="fullscreen-contents js-fullscreen-contents" placeholder="" data-suggester="fullscreen_suggester"></textarea>
    </div>
  </div>
  <div class="fullscreen-sidebar">
    <a href="#" class="exit-fullscreen js-exit-fullscreen tooltipped tooltipped-w" aria-label="Exit Zen Mode">
      <span class="mega-octicon octicon-screen-normal"></span>
    </a>
    <a href="#" class="theme-switcher js-theme-switcher tooltipped tooltipped-w"
      aria-label="Switch themes">
      <span class="octicon octicon-color-mode"></span>
    </a>
  </div>
</div>



    <div id="ajax-error-message" class="flash flash-error">
      <span class="octicon octicon-alert"></span>
      <a href="#" class="octicon octicon-x close js-ajax-error-dismiss" aria-label="Dismiss error"></a>
      Something went wrong with that request. Please try again.
    </div>


      <script crossorigin="anonymous" src="https://assets-cdn.github.com/assets/frameworks-df9e4beac80276ed3dfa56be0d97b536d0f5ee12.js" type="text/javascript"></script>
      <script async="async" crossorigin="anonymous" src="https://assets-cdn.github.com/assets/github-534eef699bbadaf1454b432e14a2ab0a68c7ddf4.js" type="text/javascript"></script>
      
      
        <script async src="https://www.google-analytics.com/analytics.js"></script>
  </body>
</html>

