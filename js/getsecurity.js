window.onload = function() {
	$.get( "https://cdn.rawgit.com/HacKanCuBa/passh/152f54c6a6694397d1623c8afa697759873b7685/SECURITY.md", function( data ) {
		var converter = new showdown.Converter({ghCompatibleHeaderId: true}),
		html = converter.makeHtml(data);
		$( "#security" ).html( html );
	});
}
