
async function chargerProduits() {
    try {
        const response = await fetch('');
        const data = await response.json();
        const tbody = document.querySelector('#table-produits tbody');
        tbody.innerHTML = '';
        data.items.forEach(p => {
            const row = `<tr><td>${p.produit_id}</td><td>${p.nom}</td><td>${p.price} €</td></tr>`;
            tbody.innerHTML += row;
        });
    } catch (err) {
        console.error('Erreur de chargement des produits:', err);
    }
}
document.addEventListener('DOMContentLoaded', chargerProduits);
