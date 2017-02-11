window.onload = function() {
	$.get( "https://raw.githubusercontent.com/HacKanCuBa/passh/master/man/passh.md", function( data ) {
		var converter = new showdown.Converter({ghCompatibleHeaderId: true}),
		html = converter.makeHtml(data);
		$( "#man" ).html( html );
	});
}
