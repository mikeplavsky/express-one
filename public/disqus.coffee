exports.disqus = () ->

  disqus_shortname = "main-ec2l"

  dsq = document.createElement 'script'
  dsq.type = 'text/javascript'
  dsq.async = true

  dsq.src = "http://main-ec2l.disqus.com/embed.js"

  (document.getElementsByTagName('head')[0] ||
   document.getElementsByTagName('body')[0]).appendChild(dsq)
