const footer = document.querySelector('.footer')

const hideFooter= () => {
    window.addEventListener ('scroll', () =>  {
        if ((window.innerHeight + window.pageYOffset) >= document.body.offsetHeight) {
            footer.style.visibility = 'hidden';
        }
    });
}


export { hideFooter };