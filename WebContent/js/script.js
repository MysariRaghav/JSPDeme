$(document).ready(function(){

$(document).on('click','#table-begin img[id^="edit_"]',function(){
	
	
	$(this).closest('td').prev().attr("contentEditable", "true");
	$(this).closest('td').prev().prev().attr("contentEditable", "true");
	 $(this).hide();
	html = "<div id='custom-div'><a href='#' id='set'>set</a><br/><a href='#' id='cancel'>Cancel</a>";
	$(this).closest('td').append(html);
	
	$(document).on('click','#set',function(){
	     	
	     	$('img[id^="edit_"]').show();
	     	$(this).closest('td').prev().removeAttr("contentEditable");
	    	$(this).closest('td').prev().prev().removeAttr("contentEditable");
	    	$('#custom-div').remove();
	 });
	
	$(document).on('click','#cancel',function(){
     	
     	$('img[id^="edit_"]').show();
     	$(this).closest('td').prev().removeAttr("contentEditable");
    	$(this).closest('td').prev().prev().removeAttr("contentEditable");
    	$('#custom-div').remove();
		});

$(document).on('blur','#uname, #pname',function(){
		$('#set').removeAttr('href');
		$('#custom-div  #set').attr('href','edit.jsp?id='+$('#userNAME').val()+'&'+'uname='+$('#uname').text()+'&'+'password='+$('#pname').text());
	});
});
 

		
	
});