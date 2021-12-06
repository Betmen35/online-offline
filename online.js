<script type="text/javascript">
	

function baham(){


$.ajax({


type: "POST",
url: "soltaraf.php",
data: {"tip":"tamam"},
success:function(sonuc){


$('.soltaraf').html(sonuc);


}



});




}







baham();

setInterval(function(){

$(function(){


$(".soltaraf").load("soltaraf.php");




});


baham();


},1000



);




</script>