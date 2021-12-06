<?php 
session_start();
ob_start();
include('nedmin/ayar.php');


date_default_timezone_set('Europe/Istanbul');

$al= $db->prepare("SELECT* FROM users");

$al->execute();

$alim= $al->fetchAll(PDO::FETCH_ASSOC);
foreach($alim as $basla){

$suan= time();
$son= strtotime($basla['tarih']);

$fark= ($suan-$son);
$zaman= date("Y-m-d H:i:s");




if ($fark > 120 || $basla['onlinemi'] == 0) {



$yaz= $db->prepare("UPDATE users SET tarih=? WHERE email=?");
$yaz->bindParam(1,$zaman);
$yaz->bindParam(2,$_SESSION['email']);
$yaz->execute();

if ($basla['role_id'] == 3) {




?>

<img src="https://icons.iconarchive.com/icons/paomedia/small-n-flat/24/sign-ban-icon.png"><?php echo $basla['name']; ?>&nbsp<span>banlı</span><br>
<?php 

}else{

?>
<img src="https://icons.iconarchive.com/icons/saviourmachine/chat/24/online-red-icon.png"><?php echo $basla['name']; ?>&nbsp<span>offline</span><br>

<?php
}
}
else{


if ($basla['role_id'] == 3) {





?>
<img src="https://icons.iconarchive.com/icons/paomedia/small-n-flat/24/sign-ban-icon.png"><?php echo $basla['name']; ?>&nbsp<span>banlı</span><br>

<?php 


}else{
?>

<img src="https://icons.iconarchive.com/icons/saviourmachine/chat/24/online-icon.png"><?php echo $basla['name']; ?>&nbsp<span>online</span><br>


<?php 

}
}

	


?>




<?php



}


?>