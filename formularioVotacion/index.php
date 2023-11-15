<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Formulario de Votación</title>
    <link rel="stylesheet" type="text/css" href="estilo.css">
</head>
<body>
    <h1>Formulario de Votación:</h1>
    <?php
    //incluir la clase de conexion de la base de datos
    include("con_db.php");
        $sqlRegiones = "SELECT id, nombre FROM regiones";
        $resultRegiones = mysqli_query($conex, $sqlRegiones);

        $sqlComunas = "SELECT id, nombre, region_id FROM comunas";
        $resultComunas = mysqli_query($conex, $sqlComunas);
    ?>
    <form method="post" id="miFormulario">
        <label for="nombre">Nombre y Apellido:</label>
        <input type="text" id="nombreyapellido" name="nombre" required>

        <label for="alias">Alias:</label>
        <input type="text" id="alias" name="alias" required>

        <label for="rut">RUT:</label>
        <input type="text" id="rut" name="rut" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="region">Región:</label>
        <select id="region" name="region" required>
            <?php
            // Verificar si se obtuvieron resultados de la consulta
            if ($resultRegiones) {
                while ($row = mysqli_fetch_assoc($resultRegiones)) {
                    echo "<option value='{$row['id']}'>{$row['nombre']}</option>";}
            }else{
                echo "<option value=''>Error al cargar las regiones</option>";}
            ?>
        </select>

        <label for="comuna">Comuna:</label>
        <select id="comuna" name="comuna" required>
            <?php
            // Verificar si se obtuvieron resultados de la consulta
            if ($resultComunas){
                while ($row = mysqli_fetch_assoc($resultComunas)) {
                    echo "<option class='comuna-option' value='{$row['id']}' data-region='{$row['region_id']}'>{$row['nombre']}</option>";}
            }else{
                echo "<option value=''>Error al cargar las comunas</option>";
            }
            ?>
        </select>

        <label for="candidato">Candidato:</label>
        <select id="candidato" name="candidato" required>
            <?php
            //Verificar si se obtuvieron resultados de la consulta
            if ($resultCandidatos) {
                while ($row = mysqli_fetch_assoc($resultCandidatos)){
                    echo "<option class='comuna-option' value='{$row['id']}' data-region='{$row['candidato_id']}'>{$row['nombre']}</option>";
                }
            }else{
                echo "<option value=''>Error al cargar los candidatos</option>";
            }
            ?>
        </select>

       <label>¿Cómo se enteró de nosotros?</label>
        <div class="checkbox-group">
            <div class="checkbox-item">
                <input type="checkbox" name="como_se_entero[]" id="web" value="Web">
                <label for="web">Web</label>
            </div>
            <div class="checkbox-item">
                <input type="checkbox" name="como_se_entero[]" id="tv" value="TV">
                <label for="tv">TV</label>
            </div>
            <div class="checkbox-item">
                <input type="checkbox" name="como_se_entero[]" id="redes" value="Redes Sociales">
                <label for="redes">Redes Sociales</label>
            </div>
            <div class="checkbox-item">
                <input type="checkbox" name="como_se_entero[]" id="amigo" value="Amigo">
                <label for="amigo">Amigo</label>
            </div>
        </div>

        <button type="button" onclick="enviarFormulario()">Votar</button>
    </form>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="script.js"></script>
    <script>
        $('#region').on('change', function() {
            var selectedRegion = $(this).val();
            $('.comuna-option').hide();
            $('.comuna-option[data-region="' + selectedRegion + '"]').show();
        });
    </script>
    <script>
    // Script para enviar el formulario
    function enviarFormulario() {
        $.ajax({
            type: "POST",
            url: "guardar_formulario.php",
            data: $('form').serialize(),
            success: function(response) {
                alert(response);
            },
            error: function(error) {
                console.log(error);
            }
        });
    }

    function validarFormulario() {
    var nombreApellido = document.getElementById('nombreyapellido').value.trim();
    var alias = document.getElementById('alias').value.trim();
    var email = document.getElementById('email').value.trim();
    var rut = document.getElementById('rut').value.trim();

    // Validación del Alias
    if (alias.length < 6 || !/^[a-zA-Z0-9]+$/.test(alias)) {
        alert('El Alias debe tener al menos 5 caracteres y contener letras y números.');
        return false;
    }

    // Validación del Nombre y Apellido
    if (nombreApellido === '') {
        alert('ingrese el Nombre y Apellido.');
        return false;
    }

    //Validación para el email
        var formulario = document.getElementById('miFormulario');
        if (formulario.checkValidity()) {
            formulario.submit();
        } else {
            alert('Existen errores en el formulario');
        }

    // Validación de al menos dos checkboxes marcados
    var checkboxes = document.querySelectorAll('input[name="como_se_entero[]"]:checked');
    if (checkboxes.length < 2) {
        alert('Seleccione al menos dos opciones en "¿Cómo se enteró de nosotros?"');
        return;
    }

    // Enviar formulario
    document.getElementById('miFormulario').submit();
}
</script>
</body>
</html>