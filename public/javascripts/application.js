// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

//This is for the AJAX calls for searching.
$(function () {

 $('#item_search input').keyup(function() {
 		$.get($('#item_search').attr('action'),
			$('#item_search').serialize(), null, 'script');  
   return false;  
 }); 


})
