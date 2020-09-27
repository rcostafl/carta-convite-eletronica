

const hideFooter= () => {
    const footer = document.querySelector('.footer');
    window.addEventListener ('scroll', () =>  {
        if ((window.innerHeight + window.pageYOffset) >= document.body.offsetHeight) {
            footer.style.visibility = 'hidden';
        }
        else {
            footer.style.visibility = 'visible';
        }
    });
}


export { hideFooter };