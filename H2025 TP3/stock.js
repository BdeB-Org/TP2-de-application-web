
async function chargerDonnees() {
    try {
        const response = await fetch('https://votre-serveur-ords/rest/inventaire_details/');
        const data = await response.json();
        const tbody = document.querySelector('#table-stock tbody');
        tbody.innerHTML = '';
        data.items.forEach(item => {
            const row = `<tr><td>${item.inventaire_id}</td><td>${item.produit}</td><td>${item.quantite}</td><td>${item.location}</td></tr>`;
            tbody.innerHTML += row;
        });
    } catch (err) {
        console.error("Erreur de chargement :", err);
    }
}
document.addEventListener('DOMContentLoaded', chargerDonnees);
