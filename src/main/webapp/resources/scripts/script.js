// приколы
const gavrillinaSound = new Audio('/resources/sounds/Drama_Queen.mp3');
const easterEgg = document.getElementById('cringe_area');

// DOM elements
const form = document.getElementById('form');
const xButtons = document.getElementsByName('x');
const yInput = document.getElementById('y');
const yErrorLabel = document.getElementById('y_error_label');
const clickErrorDiv = document.getElementById('click_error_div');
const rButtons = document.getElementsByName('r');
const submitButton = document.getElementById('submit_button');
//const canvas = document.getElementById('grid');

//import { refreshCanvas } from './canvas.js';
//import { getClickCoordinates } from './canvas.js';
//import { refreshTable } from './table.js';
//import { fetchHit } from './fetch.js';

refreshTable();
extractDotsFromTable();
refreshCanvas(3);

// превращение кнопок X и R в радиокнопки
makeRadio(xButtons);
makeRadio(rButtons);

// вешаем обработчик на кнопки
xButtons.forEach(input => input.addEventListener("change", confirmSubmit));
yInput.addEventListener("input", confirmSubmit);
rButtons.forEach(input => input.addEventListener("change", confirmSubmit));
rButtons.forEach(input => input.addEventListener("click", () => {
    if(isAnyActive(rButtons)) refreshCanvas(activeButtonIntValue(rButtons));
}));

canvas.addEventListener('click', function(event) {
    hideClickError();

    if (!isAnyActive(rButtons)) {
        showClickError('Выберите конкретное значение R!');
    } else {
        const { x: xValue, y: yValue } = getClickCoordinates();
        const rValue = activeButtonIntValue(rButtons);
        fetchHit(xValue, yValue, rValue);
    }
});

// обработчик формы
form?.addEventListener('submit', function(event){
    event.preventDefault();

    const xValue = activeButtonIntValue(xButtons);
    const yValue = parseFloat(yInput.value);
    const rValue = activeButtonIntValue(rButtons);

    fetchHit(xValue, yValue, rValue);
});

// разрешает нажимать на submit только если x, y, r валидны
function confirmSubmit() {
    const xSelected = isAnyActive(xButtons);
    const yFilled = yIsValid();
    const rSelected = isAnyActive(rButtons);

    yErrorLabel.style.display = yIsValid() ? "none" : "inline";

    showEasterEgg(yInput.value === "mashusikthebest");

    submitButton.disabled = (xSelected && yFilled && rSelected) ? false : true;
}

// превращение кнопок в радиокнопки
function makeRadio(buttons){
    buttons.forEach(button => {
        button.addEventListener('click', () => {
            buttons.forEach(btn => {
                btn.classList.remove('active');
            });

            button.classList.add('active');
        });
    });
}

function isAnyActive(buttons) {
    return Array.from(buttons).some(button => button.classList.contains('active'));
}

function activeButtonIntValue(buttons) {
    return parseInt(Array.from(buttons).find(button => button.classList.contains('active')).value);
}

// проверка Y
function yIsValid() {
    yInput.value = yInput.value.replace(',', '.');
    if (yInput.value.trim() == "" || isNaN(yInput.value)) {
        return false;
    }
    const y = parseFloat(yInput.value);
    if (!isNaN(y) && -5 <= y  && y <= 3 &&
     -5 <= Number(yInput.value.replace(/0/g, '')) && Number(yInput.value.replace(/0/g, '') <= 3)) {
        return true;
     }
}

// для валидации клика
function showClickError(message) {
    clickErrorDiv.textContent = message;
    clickErrorDiv.style.display = 'block';
}

function hideClickError() {
    clickErrorDiv.textContent = '';
    clickErrorDiv.style.display = 'none';
}

// прикол
function showEasterEgg(status) {
    easterEgg.style.display = status ? "block" : "none";
    if (status) {
        gavrillinaSound.play().catch(error => {
            console.error("Ошибка при воспроизведении звука:", error);
        });
    }
    else {
        gavrillinaSound.pause();
        gavrillinaSound.currentTime = 0;
    }
}
