<?php
	//Conectar a la base de datos
	$conex = mysqli_connect("localhost","root","","votacion");

//obtener regiones
	$sqlRegiones = "SELECT id, nombre FROM regiones";
	$resultRegiones = mysqli_query($conex, $sqlRegiones);
	
// Obtener comunas
	$sqlComunas = "SELECT id, nombre FROM comunas";
	$resultComunas = mysqli_query($conex, $sqlComunas);

// Obtener candidatos
	$sqlCandidatos = "SELECT id, nombre FROM candidatos_presidenciales";
	$resultCandidatos = mysqli_query($conex, $sqlCandidatos);
?>