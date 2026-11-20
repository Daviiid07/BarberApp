function probarConexion() {
    fetch("/prueba")
        .then(respuesta => respuesta.text())
        .then(texto => {
            document.getElementById("resultado").textContent = texto;
        });
}