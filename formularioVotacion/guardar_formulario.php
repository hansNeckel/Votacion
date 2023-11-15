<?php
include("con_db.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = mysqli_real_escape_string($conex, $_POST["nombre"]);
    $alias = mysqli_real_escape_string($conex, $_POST["alias"]);
    $rut = mysqli_real_escape_string($conex, $_POST["rut"]);
    $email = mysqli_real_escape_string($conex, $_POST["email"]);
    $region = mysqli_real_escape_string($conex, $_POST["region"]);
    $comuna = mysqli_real_escape_string($conex, $_POST["comuna"]);
    $candidato = mysqli_real_escape_string($conex, $_POST["candidato"]);
    
    $comoSeEntero = isset($_POST["como_se_entero"]) ? implode(", ", $_POST["como_se_entero"]) : "";

     // Validación del Alias
    if (strlen($alias) < 5 || !preg_match('/^[a-zA-Z0-9]+$/', $alias)) {
        echo "El Alias debe tener al menos 5 caracteres y contener letras y números";
        exit;
    }

    // Validación del Nombre y Apellido
    if (empty($nombre)) {
        echo "Nombre y apellido no deben quedar en blanco";
        exit;
    }

    // Validación del email
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo "Ingrese un correo electrónico válido";
        exit;
    }

    // Validación de al menos dos checkboxes marcados
    $checkboxes = isset($_POST["como_se_entero"]) ? $_POST["como_se_entero"] : [];
    if (count($checkboxes) < 2) {
        echo "Seleccione al menos dos opciones en '¿Cómo se enteró de nosotros?'";
        exit;
    }

    //Validación de duplicación de votos por rut
    $sqlVerificar = "SELECT COUNT(*) AS conteo FROM formulario WHERE rut = '$rut'";
    $resultVerificar = mysqli_query($conex, $sqlVerificar);

    if ($resultVerificar) {
        $row = mysqli_fetch_assoc($resultVerificar);
        $conteo = $row['conteo'];

    if ($conteo > 0) {
        echo "Ya has votado previamente.";
        exit;
        }
    } else {
        echo "Error al verificar la duplicación: " . mysqli_error($conex);
        exit;
    }

    //insertar datos del formulario
    $sqlInsert = "INSERT INTO formulario (nombre_apellido, alias, rut, email, region, comuna, candidato, como_se_entero) 
                  VALUES ('$nombre', '$alias', '$rut', '$email', '$region', '$comuna', '$candidato', '$comoSeEntero')";

    if (mysqli_query($conex, $sqlInsert)) {
        echo "Formulario guardado con éxito";
    } else {
        echo "Error al guardar el formulario: " . mysqli_error($conex);
    }
} else {
    echo "No esta permitido";
}
?>