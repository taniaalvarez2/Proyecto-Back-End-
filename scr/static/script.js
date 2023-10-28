

  // Obtén la lista desplegable por su ID
const ccList = document.getElementById("cc-list");

// Realiza una solicitud para obtener los datos de la ruta /CC
fetch('/CC')
  .then(response => response.json())
  .then(data => {
    // Recorre los elementos en el arreglo y agrégalos a la lista desplegable
    data.forEach(cc => {
      const option = document.createElement("option");
      option.value = cc;
      option.textContent = cc;
      ccList.appendChild(option);
    });
  })
  .catch(error => {
    console.error("Error al obtener los datos de CC:", error);
  });
