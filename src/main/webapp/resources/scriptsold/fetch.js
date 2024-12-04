import { refreshCanvas } from './canvas.js';
import { dotsPush } from './canvas.js';
import { tablePush } from './table.js';

const gachiSound = new Audio('../sounds/h.mp3');

const hitSounds = [
    '../sounds/oue.mp3',
    '../sounds/yeei.mp3',
    '../sounds/oleg.mp3'
];

const missSounds = [
    '../sounds/bruh.mp3',
    '../sounds/datyche.mp3',
    '../sounds/nepravilno.mp3',
    '../sounds/nope.mp3'
];

export function fetchHit(xValue, yValue, rValue) {
    // http://localhost:20013/fcgi-bin/WebLab1.jar
    const startTime = performance.now();
    console.log(`X: ${xValue}, Y: ${yValue}, R: ${rValue}`);

    gachiSound.play()
        .catch(error => {
            console.error(`Ошибка при воспроизведении звука: ${error}`);
        });

    fetch('/calc', {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            x: xValue,
            y: yValue,
            r: rValue
        }),
    })
    .then(response => {
          if (!response.ok) {
              throw new Error('Ошибка сети: ' + response.status);
          }
          return response.json();
    })
    .then(result => {
        console.log(`response result: ${result}`);

        playRandomAudio(result ? hitSounds : missSounds); //хихик

        const newRow = {
            x: xValue,
            y: yValue,
            r: rValue,
            hit: result,
            execTime: `${performance.now() - startTime} мс`
        };
        tablePush(newRow);

        // рисовашки
        dotsPush([xValue, yValue]);
        refreshCanvas(rValue);
    })
    .catch(error => {
        alert('Ошибка отправки данных.\n' + error.message);
        console.log(error.message);
        console.log(error.stack);
    });
}

function playRandomAudio(audios) {
    const randomIndex = Math.floor(Math.random() * audios.length);
    const audio = new Audio(audios[randomIndex]);

    audio.play()
        .catch(error => {
            console.error('Что-то не так со звуком:', error);
        });
}

