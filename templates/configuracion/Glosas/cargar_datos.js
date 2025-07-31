// cargar_datos.js - Versión con diagnóstico completo
function cargarDatosIniciales() {
  console.log('[1] La función se está ejecutando');
  alert('La función cargarDatosIniciales() se está ejecutando'); // Paso 1: Confirmar que la función se llama
  
  const btn = document.querySelector('.btn-cargar-datos');
  if (!btn) {
    const errorMsg = 'ERROR: No se encontró el botón (.btn-cargar-datos)';
    console.error(errorMsg);
    alert(errorMsg);
    return;
  }

  const mensajeDiv = document.getElementById('mensajeCarga');
  if (!mensajeDiv) {
    const errorMsg = 'ERROR: No se encontró el div de mensajes (#mensajeCarga)';
    console.error(errorMsg);
    alert(errorMsg);
    return;
  }

  // Mostrar que los elementos se encontraron
  console.log('[2] Elementos del DOM encontrados correctamente');
  alert('Elementos del DOM encontrados correctamente');

  // Verificar localStorage
  if (!window.localStorage) {
    const errorMsg = 'ERROR: localStorage no está disponible';
    console.error(errorMsg);
    alert(errorMsg);
    return;
  }

  console.log('[3] localStorage está disponible');
  alert('localStorage está disponible');

  // Intentar cargar el JSON
  console.log('[4] Intentando cargar datos_iniciales.json');
  alert('Intentando cargar datos_iniciales.json');

  fetch('datos_iniciales.json')
    .then(response => {
      console.log('[5] Respuesta del servidor recibida', response);
      if (!response.ok) {
        throw new Error(`Error HTTP: ${response.status}`);
      }
      return response.json();
    })
    .then(data => {
      console.log('[6] JSON parseado correctamente', data);
      alert('JSON cargado correctamente');
      
      // Guardar en localStorage
      localStorage.setItem('facturas', JSON.stringify(data.facturas));
      localStorage.setItem('facturasRadicadas', JSON.stringify(data.facturasRadicadas));
      
      console.log('[7] Datos guardados en localStorage');
      alert('Datos guardados en localStorage! Verifica en la consola (F12)');
      
      // Mostrar mensaje de éxito en la página
      mensajeDiv.textContent = '¡Datos cargados correctamente!';
      mensajeDiv.style.display = 'block';
      mensajeDiv.style.backgroundColor = '#d4edda';
      mensajeDiv.style.color = '#155724';
      mensajeDiv.style.padding = '10px';
      mensajeDiv.style.margin = '10px 0';
      mensajeDiv.style.borderRadius = '4px';
    })
    .catch(error => {
      console.error('[ERROR]', error);
      alert(`Error al cargar: ${error.message}`);
      
      // Mostrar mensaje de error en la página
      mensajeDiv.textContent = `Error: ${error.message}`;
      mensajeDiv.style.display = 'block';
      mensajeDiv.style.backgroundColor = '#f8d7da';
      mensajeDiv.style.color = '#721c24';
      mensajeDiv.style.padding = '10px';
      mensajeDiv.style.margin = '10px 0';
      mensajeDiv.style.borderRadius = '4px';
    });
}

// Verificar que el script se cargó
console.log('Script cargar_datos.js cargado correctamente');
alert('Script cargar_datos.js cargado correctamente');


document.getElementById('secret-clear-btn').addEventListener('click', function() {
  if (confirm('ADMIN: ¿Borrar TODOS los datos del localStorage?')) {
    localStorage.clear();
    
    // Mostrar notificación flotante
    const notif = document.createElement('div');
    notif.textContent = '✅ localStorage limpiado';
    notif.style.position = 'fixed';
    notif.style.bottom = '50px';
    notif.style.right = '10px';
    notif.style.background = '#4CAF50';
    notif.style.color = 'white';
    notif.style.padding = '10px';
    notif.style.borderRadius = '5px';
    notif.style.zIndex = '10000';
    document.body.appendChild(notif);
    
    setTimeout(() => notif.remove(), 2000);
  }
});