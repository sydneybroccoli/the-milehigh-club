export const aircraftEditModal = () => {
  const updates = document.querySelectorAll('#aircraft-edit-btn');

  updates.forEach(update => {
    update.addEventListener('click', e => {
      // PREVENT REFRESH
      e.preventDefault();

      // OPEN MODAL

    });
  });

  btns.forEach(btn => {
    btn.addEventListener('click', e => {
      // PREVENT REFRESH ON CLICK
      e.preventDefault();
      // OPEN MODAL ON CLICK
      update.click();
    });
  });



  const buttons = document.querySelectorAll('.edit-modal-btn');

  if (buttons.length > 0){
      buttons.forEach((button) => {
      button.addEventListener('click', (event) => {
        const id = event.currentTarget.dataset.id
        console.log(id)
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

