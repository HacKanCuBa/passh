function getMD2HTML(tagId, url) {
	$.get(url, function(data) {
		var converter = new showdown.Converter({ghCompatibleHeaderId: true}),
		html = converter.makeHtml(data);
		$(tagId).html(html);
	});
}
