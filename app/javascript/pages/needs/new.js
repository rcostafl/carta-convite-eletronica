const testeFunction = () => {
  console.log("testando");
};

const enableProposalForm = (event) => {
  document.getElementById('proposal_value').disabled = false;
  document.getElementById('proposal_description').disabled = false;
  document.getElementById('btn-update').disabled = false;
};

const addEventListenerToEditButtom = () => {
  const editButton = document.getElementById('edit-button');
  if (editButton){
    editButton.addEventListener('click', enableProposalForm);
  };
};

export { addEventListenerToEditButtom }

//const change
