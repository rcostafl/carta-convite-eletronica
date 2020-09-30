
const openTab = (event) => {
  // gets all tab-contents
  const tabContents = document.querySelectorAll('.tab-content');

  // sets all tab-contents invisible
  tabContents.forEach((element, index, array) => {
    element.style.display = "none";
  });

  // get, from the clicked button, all the name of the tab-content to be shown (data-tab-name attribute)
  const selectedTabContentId = event.currentTarget.getAttribute('data-tab-name');
  // Gets the tab-content (it is a div) to set it visible
  const tabContent = document.getElementById(selectedTabContentId);
  // set display =   "block"
  tabContent.style.display = "block";
};

const addClickEventToTabLink = () => {
  const tabLinks = document.querySelectorAll('.tab-link');

  tabLinks.forEach((element, index, array) => {
    element.addEventListener('click', openTab);
  });
}

export { addClickEventToTabLink };
