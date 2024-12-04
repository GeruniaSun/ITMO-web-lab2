const rowsPerPage = 10;
let currentPage = 1;
const data = [];

export function tablePush(element) {
    addElement(element);
    refreshTable();
}

export function refreshTable() {
    setupPagination();
    showPage(currentPage);
}

function addElement(element) {
    data.unshift({
        x: element.x,
        y: element.y,
        r: element.r,
        hit: element.hit,
        currTime: new Date(),
        execTime: parseFloat(element.execTime).toFixed(4) + " сек.",
    })
}

function setupPagination() {
    const pagination = document.getElementById('pagination');
    pagination.innerHTML = '';
    const pageCount = Math.ceil(data.length / rowsPerPage);

    for (let i = 1; i <= pageCount; i++) {
        const button = document.createElement('button');
        button.innerText = i;
        button.classList.add('page-button');
        button.addEventListener('click', () => {
            currentPage = i;
            showPage(currentPage);
            setupPagination(data.length);
        });
        if (i === currentPage) {
            button.disabled = true;
        }
        if (Math.abs(i - currentPage) > 5 && i !== pageCount) {
            button.hidden = true;
        }
        pagination.appendChild(button);
    }
}

function showPage(pageNumber) {
    const tableBody = document.getElementById('tbody');
    tableBody.innerHTML = '';
    const start = (pageNumber - 1) * rowsPerPage;
    const end = Math.min(start + rowsPerPage, data.length);

    for (let i = start; i < end; i++) {
        const row = `<tr>
                        <td>${data[i].x}</td>
                        <td>${data[i].y}</td>
                        <td>${data[i].r}</td>
                        <td>${data[i].hit}</td>
                        <td>${data[i].currTime}</td>
                        <td>${data[i].execTime}</td>
                    </tr>`;
        tableBody.innerHTML += row;
    }
}