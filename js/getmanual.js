window.onload = function() {
	$.get( "https://cdn.rawgit.com/HacKanCuBa/passh/9032a478f1c08eb3bfc62250319a5c62691d0ae6/man/passh.md", function( data ) {
		var converter = new showdown.Converter({ghCompatibleHeaderId: true}),
		html = converter.makeHtml(data);
		$( "#man" ).html( html );
	});
}
