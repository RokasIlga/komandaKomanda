// Code to change color!

    const randomBckBtn = document.querySelector('#color');
    

    randomBckBtn.addEventListener('click', () => {
        const firstrandom = Math.floor(Math.random() * 256);
        const secondrandom = Math.floor(Math.random() * 256);
        const thirdrandom = Math.floor(Math.random() * 256);
        document.body.style.backgroundColor = `rgb(${firstrandom}, ${secondrandom}, ${thirdrandom})`;
    });


