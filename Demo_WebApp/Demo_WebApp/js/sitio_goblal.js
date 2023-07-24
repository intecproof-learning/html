﻿function addPedido(pedido) {
    pedidos.push(pedido)
}

window.onload = function () {
    document.getElementById('home-page').onclick = link_anchorWithHtmlPages
    document.getElementById('productos-page').onclick = link_anchorWithHtmlPages
    document.getElementById('pedidos-page').onclick = link_anchorWithHtmlPages
    document.getElementById('contacto-page').onclick = link_anchorWithHtmlPages
}

function link_anchorWithHtmlPages(event, objectoEdicion) {
    switch (event.target.id) {
        case 'home-page':
            location.reload()
            break
        case 'productos-page':
            getHtmlContent('../sitio/productos.html', 'GET',
                mostrarContenidoHtml)
            break
        case 'pedidos-page':
            getHtmlContent('../sitio/pedidos.html', 'GET',
                mostrarContenidoHtml)
            break
        case 'contacto-page':
            getHtmlContent('../sitio/contacto.html', 'GET',
                mostrarContenidoHtml)
            break
    }
}

function mostrarContenidoHtml() {
    const divContent = document.getElementById('html-dynamic-content')
    if (this.readyState == 4 && this.status == 200) {
        divContent.innerHTML = this.responseText
        if (url === '../sitio/productos.html') {
            productos_initialLoad(objectoEdicion)
        } else if (url === '../sitio/pedidos.html') {
            pedidos_initialLoad()
        }
        else if (url === '../sitio/contacto.html') {
            contacto_initialLoad()
        }
    }
}

function getHtmlContent(url, metodo, callbackSuccess, callbackError) {
    let xhr = new XMLHttpRequest()
    xhr.open(metodo, url, true)
    xhr.setRequestHeader('Cache-Control', 'no-cache, no-store, max-age=0')
    xhr.setRequestHeader('Expires', 'Thu, 1 Jan 1970 00:00:00 GMT')
    xhr.setRequestHeader('Pragma', 'no-cache')
    xhr.onerror = callbackError
    xhr.onreadystatechange = callbackSuccess
    xhr.send()
}

getHtmlContent('http://localhost:51321/api/frutas/obtener')