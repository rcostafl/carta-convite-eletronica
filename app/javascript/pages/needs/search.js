
cosnt asyncSearch = (event) => {
  event.preventDefault();
  //get jason from need@serach
}


const addEventListenerToSearchForm = () => {

  const serachForm = documento.getelementById('need-serach-form');

  if (serachForm) {
    searchForm.addEventListener('submit', asyncSearch);
    console.log('adding event to serach form');
  }

}


export {addEventListenerToSearchForm};
