function exibirAlerta(texto) {
    alerta_texto.innerHTML = `
        <p>${texto}</p>
    `;
    alerta.style.opacity = "1";

    setTimeout(() => {
        alerta.style.opacity = "0";
    }, 3000);
}