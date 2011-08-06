// jquery tags

$(function() {
	$("#post_tag_tokens").tokenInput("/tags.json", {
		// crossDomain: false,
		prePopulate: $("#post_tag_tokens").data("pre"),
		theme: "facebook"
	});
});

// Disqus

<script type="text/javascript">
var disqus_shortname = 'raywu'
(function () {
    var s = document.createElement('script'); s.async = true;
    s.type = 'text/javascript';
    s.src = 'http://' + disqus_shortname + '.disqus.com/count.js';
    (document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
}());
</script>