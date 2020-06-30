export const aircraftEditModal = () => {
  const updates = document.querySelectorAll('#aircraft-edit-btn');

  // ONLY DO MODAL IF THERE ARE AIRCRAFTS TO UPDATE
  if (updates.length > 0) {
    updates.forEach(update => {
      update.addEventListener('click', e => {
        // PREVENT REFRESH
        e.preventDefault();

        // OPEN MODAL
        const id = event.currentTarget.dataset.id
        document.querySelector('.edit_aircraft').action = `/aircrafts/${id}`
        const aircraft = JSON.parse(e.currentTarget.dataset.info);
        const inputs = document.querySelectorAll('.edit_aircraft .form-control')
        inputs.forEach((input) => {
          const key = (input.id.replace('aircraft_',''));
          input.value = info[key];
        });
      });
    });
  };
}
