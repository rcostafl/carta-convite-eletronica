// Function created only to test if the export and import was working fine.
const testeFunction = () => {
  console.log("testando");
};

/*************************************************************************************************************************/
/**********************************   ENABLING THE PROPOSAL FORM IN THE PAGE NEEDS/SHOW **********************************/
/*************************************************************************************************************************/

// Enebles the proposal form, in the needs/show, so a private person can make a proposal to some need.
const enableProposalForm = (event) => {
  // Find the elements and set disable = false.
  document.getElementById('proposal_value').disabled = false;
  document.getElementById('proposal_description').disabled = false;
  document.getElementById('btn-update').disabled = false;
};

/*  Finds the edit button in the pages needs/show and add an event listener wich on click
calls the enabling edit form function (enableProposalForm), above declared */
const addEventListenerToEditButtom = () => {
  // Find the edit button
  const editButton = document.getElementById('edit-button');
  // If the button was find in the page, add the listener to the clic event
  /* This check is necessary, since this function runs in every page. If we are in a page in which
  the button doesn't exist, the lister should not be added to te button */
  if (editButton){
    editButton.addEventListener('click', enableProposalForm);
  };
};
/*************************************************************************************************************************/
/**************************************************    END   *************************************************************/
/*************************************************************************************************************************/


/*************************************************************************************************************************/
/****************************************************  JUDGING A PROPOSALS ***********************************************/
/*************************************************************************************************************************/
const enableJugdingFields = (event) => {
  const verditctField      = document.getElementById('needs-show-verdict');
  const deactivateButton   = document.getElementById('needs-show-deactivate-button');
  const saveButton         = document.getElementById('needs-show-save-button');
  const cancelButton       = document.getElementById('needs-show-cancel-button');
  const radioButtonsWinner = document.querySelectorAll('input[type="radio"]');

  // Enable controls to edit and sava data
  verditctField.disabled  = false;
  saveButton.disabled     = false;
  cancelButton.disabled   = false;

  // Enable radiobuttons
  radioButtonsWinner.forEach((radioButton, index, array) => {
    radioButton.disabled = false;
  });

  // Focus the text area
  verditctField.focus();
  // Send cursor to the text area
  verditctField.select();
  verditctField.selectionStart = verditctField.selectionEnd;

  // Disable the judge and the deactivate button
  event.currentTarget.disabled = true;
  deactivateButton.disabled    = true;
};

const addClickEventListerToJudgeButton = () => {
  const judgeButton = document.getElementById('btn-judge');

  if (judgeButton){
    judgeButton.addEventListener('click', enableJugdingFields);
  }
};

const buildFormToJudge = (event) => {
  let iswinnerSelected = false;
  let winner_proposal_id = "";

  const saveLink = document.getElementById('needs-show-save-link');
  const verdictField = document.getElementById('needs-show-verdict');
  const radioButtonsWinner = document.querySelectorAll('input[type="radio"]');

  // if (verdictField.value === ""){
  //   alert('Por favor, preencha o despacho!');
  //   return;
  // }

  radioButtonsWinner.forEach((item, index, array) => {
    if (item.checked){
      iswinnerSelected = true;
      winner_proposal_id = item.value
    }
  });

  // if (!iswinnerSelected) {
  //   alert("Por favor, selecione o vencedor da proposta!");
  //   return;
  // }
    saveLink.href = saveLink.href.replace('v1', verdictField.value);
    saveLink.href = saveLink.href.replace('v2', winner_proposal_id);
    saveLink.click();
};

const addClickEventListenerToSaveButton = () => {
  const saveButton = document.getElementById('needs-show-save-button');

  if (saveButton){
    saveButton.addEventListener('click', buildFormToJudge);
  }
};

const cancelJudgement = (event) => {
  // Take the poiter to all the pages controllers that will be changed
  const radioButtonsWinner = document.querySelectorAll('input[type="radio"]');
  const verditctField      = document.getElementById('needs-show-verdict');
  const deactivateButton   = document.getElementById('needs-show-deactivate-button');
  const saveButton         = document.getElementById('needs-show-save-button');
  const cancelButton       = document.getElementById('needs-show-cancel-button');
  const judgeButton        = document.getElementById('btn-judge');

  // Set reset the fields that the user can have modified
  verditctField.value = "";
  radioButtonsWinner.forEach((element, index, array) => {
    element.checked = false;
  });

  // Disable elements that ware enabled to judge de proposals
  verditctField.disabled    = true;
  saveButton.disabled       = true;
  cancelButton.disabled     = true;

  // Enable the judge button and the deactivate button
  deactivateButton.disabled = false;
  judgeButton.disabled      = false;
};

const addClickEventListenerToCancelButton = () => {
  const cancelButton = document.getElementById('needs-show-cancel-button');

  cancelButton.addEventListener('click', cancelJudgement);
};

/*************************************************************************************************************************/
/**************************************************    END   *************************************************************/
/*************************************************************************************************************************/

export { addEventListenerToEditButtom , addClickEventListerToJudgeButton, addClickEventListenerToSaveButton, addClickEventListenerToCancelButton}

//const change
