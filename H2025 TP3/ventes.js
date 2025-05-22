
async function chargerDonnees() {
    try {
        const response = await fetch('http://localhost:8080/ords/guitarshop/ventes');
        const data = await response.json();
        const tbody = document.querySelector('#table-ventes tbody');
        tbody.innerHTML = '';
        data.items.forEach(item => {
            const row = `<tr><td>${item.ordre_id}</td><td>${item.produit}</td><td>${item.quantite}</td><td>${item.price_unit}</td></tr>`;
            tbody.innerHTML += row;
        });
    } catch (err) {
        console.error("Erreur de chargement :", err);
    }
}
document.addEventListener('DOMContentLoaded', chargerDonnees);
