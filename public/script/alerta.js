function exibirAlerta(texto) {
    alerta_texto.innerHTML = `
        <p>${texto}</p>
    `;
    alerta.style.zIndex = "20000";
    alerta.style.opacity = "1";


    setTimeout(() => {
        alerta.style.zIndex = "0";
        alerta.style.opacity = "0";
    }, 3000);
}