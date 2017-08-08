<?php

	function franjaN($imagen,$posx, $tamy){
		$franja = imagecolorallocate($imagen, 0, 0, 0);
		for($j=0;$j<1;$j++){
			for ($i=0; $i < $tamy-15; $i++) { 
				imagesetpixel($imagen, $posx+$j, $i, $franja);
			}
		}
	}

	function buscarChar($caracter, $alfabeto){
		$i=0;
		do{
			if($alfabeto[$i][0] == $caracter){
				return $alfabeto[$i][1];
			}
			$i+=1;
		}while ($alfabeto[$i]);
		return "error";
	}

	function buscarVal($caracter, $alfabeto){
		$i=0;
		do{
			if($alfabeto[$i][0] == $caracter){
				return $i;
			}
			$i+=1;
		}while ($alfabeto[$i]);
		return "error";
	}

	function pintarChar($caracter,$numChar,$imagen,$tamy,$alfabeto){
		$char = buscarChar($caracter,$alfabeto);
		
		for ($i=0; $i < strlen($char); $i++) { 
			$espacio = mb_substr($char, $i,1);
			if($espacio == "1")
				franjaN($imagen,(($numChar*(11*1))+($i*1)),$tamy);
		}
	}

	function Checksum($mensaje, $alfabeto){
		$aux = 103;
		for($i=0;$i<strlen($mensaje);$i++){
			$espacio = mb_substr($mensaje, $i,1);
			$aux += (buscarVal($espacio, $alfabeto) * ($i+1));
		}
		$aux = $aux % 103;
		return $aux;
	}

	function pintaMens($mensaje,$im,$y,$alfabeto){
		pintarChar("StartA",0, $im, $y, $alfabeto);
		for($i=0;$i<strlen($mensaje);$i++){
			$char = mb_substr($mensaje, $i,1);
			pintarChar($char,$i+1, $im, $y, $alfabeto);
		}
		$Checksum = Checksum($mensaje,$alfabeto);
		
		pintarChar($alfabeto[$Checksum][0],strlen($mensaje)+1,$im,$y,$alfabeto);
		pintarChar("Stop",strlen($mensaje)+2,$im,$y,$alfabeto);
	}
	
	$mensaje = $_GET['mensaje'];
	$x = (strlen($mensaje)+3.5)*(11);
	$y = 90;

	$alfabeto = array(
			array(" ","11011001100"),
			array("!","11001101100"),
			array("\"","11001100110"),
			array("#","10010011000"),
			array("$","10010001100"),
			array("%","10001001100"),
			array("&","10011001000"),
			array("\'","10011000100"),
			array("(","10001100100"),
			array(")","11001001000"),
			array("*","11001000100"),
			array("+","11000100100"),
			array(",","10110011100"),
			array("-","10011011100"),
			array(".","10011001110"),
			array("/","10111001100"),
			array("0","10011101100"),
			array("1","10011100110"),
			array("2","11001110010"),
			array("3","11001011100"),
			array("4","11001001110"),
			array("5","11011100100"),
			array("6","11001110100"),
			array("7","11101101110"),
			array("8","11101001100"),
			array("9","11100101100"),
			array(":","11100100110"),
			array(";","11101100100"),
			array("<","11100110100"),
			array("=","11100110010"),
			array(">","11011011000"),
			array("?","11011000110"),
			array("@","11000110110"),
			array("A","10100011000"),
			array("B","10001011000"),
			array("C","10001000110"),
			array("D","10110001000"),
			array("E","10001101000"),
			array("F","10001100010"),
			array("G","11010001000"),
			array("H","11000101000"),
			array("I","11000100010"),
			array("J","10110111000"),
			array("K","10110001110"),
			array("L","10001101110"),
			array("M","10111011000"),
			array("N","10111000110"),
			array("O","10001110110"),
			array("P","11101110110"),
			array("Q","11010001110"),
			array("R","11000101110"),
			array("S","11011101000"),
			array("T","11011100010"),
			array("U","11011101110"),
			array("V","11101011000"),
			array("W","11101000110"),
			array("X","11100010110"),
			array("Y","11101101000"),
			array("Z","11101100010"),
			array("[","11100011010"),
			array("\\","11100011010"),
			array("]","11001000010"),
			array("^","11110001010"),
			array("_","10100110000"),
			array("`","10100001100"),
			array("a","10010110000"),
			array("b","10010000110"),
			array("c","10000101100"),
			array("d","10000100110"),
			array("e","10110010000"),
			array("f","10110000100"),
			array("g","10011010000"),
			array("h","10011000010"),
			array("i","10000110100"),
			array("j","10000110010"),
			array("k","11000010010"),
			array("l","11001010000"),
			array("m","11110111010"),
			array("n","11000010100"),
			array("o","10001111010"),
			array("p","10100111100"),
			array("q","10010111100"),
			array("r","10010011110"),
			array("s","10111100100"),
			array("t","10011110100"),
			array("u","10011110010"),
			array("v","11110100100"),
			array("w","11110010100"),
			array("x","11110010010"),
			array("y","11011011110"),
			array("z","11011110110"),
			array("{","11110110110"),
			array("|","10101111000"),
			array("}","10100011110"),
			array("~","10001011110"),
			array("DEL","10111101000"),
			array("FNC3","10111100010"),
			array("FNC2","11110101000"),
			array("shiftA","11110100010"),
			array("CodeC","10111011110"),
			array("FNC4","10111101110"),
			array("CodeA","11101011110"),
			array("FNC1","11110101110"),
			array("StartA","11010000100"),
			array("StartB","11010010000"),
			array("StartC","11010011100"),
			array("Stop","1100011101011"),
	);


	header('Content-Type: image/png');

	$im = @imagecreate($x, $y)
    or die("Cannot Initialize new GD image stream");
    $font = 5;
    $longCad = strlen($mensaje);
    $tamCad = $longCad * imagefontwidth($font);
	$background_color = imagecolorallocate($im, 255, 255, 255);
	$cFuente = imagecolorallocate($im, 0, 0, 0);
	imagestring($im, $font, (imagesx($im)-$tamCad)/2, 75, $mensaje, $cFuente);
	pintaMens($mensaje,$im,$y,$alfabeto);
	imagepng($im);
	imagedestroy($im);
?>