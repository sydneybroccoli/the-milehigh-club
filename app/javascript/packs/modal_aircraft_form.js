const updateEditModal = () => {
  const buttons = document.querySelectorAll('.edit-modal-btn');
  if (buttons.length > 0){
      buttons.forEach((button) => {
      button.addEventListener('click', (event) => {
        const id = event.currentTarget.dataset.id
        document.querySelector('.edit_aircraft').action = `/aircrafts/${id}`
        const info = JSON.parse(event.currentTarget.dataset.info)
        const inputs = document.querySelectorAll('.edit_aircraft .form-control')
        inputs.forEach((input) => {
          const key = (input.id.replace('aircraft_',''))
          input.value = info[key]
        })
      })
    })
  }
}

export {updateEditModal};
