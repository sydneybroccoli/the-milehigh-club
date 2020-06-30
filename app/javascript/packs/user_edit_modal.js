export const userEditModal = () => {
  const btns = document.querySelectorAll('.update-user');
  const update = document.querySelector('#user-update-btn');

  btns.forEach(btn => {
    btn.addEventListener('click', e => {
      // PREVENT REFRESH ON CLICK
      e.preventDefault();
      // OPEN MODAL ON CLICK
      update.click();
    });
  });
}
