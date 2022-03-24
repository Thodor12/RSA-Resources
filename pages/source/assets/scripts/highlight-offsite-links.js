let currentHighlight = undefined;

function highlight() {
    if (currentHighlight) {
        currentHighlight.classList.remove("highlight");
        currentHighlight = undefined;
    }

    let hash = window.location.hash;
    if (hash === "") { return; }
    hash = window.location.hash.substring(1);

    const elem = document.getElementById(hash);
    if (elem === null || elem.parentElement.getAttribute("id") !== "offsite_links") { return; }

    elem.classList.add("highlight");
    currentHighlight = elem;
}

window.onload = () => {
    highlight();
    window.onhashchange = highlight;
};