export const dashboardSelection = () => {
  const tabs = document.querySelectorAll('#user-tabs a');

  // ADD EVENT LISTENER TO ALL THE TABS
  tabs.forEach(element => {
    element.addEventListener('click', e => {
      // PREVENT REFRESH ON CLICK
      e.preventDefault();

      // ACTION ON CLICK
        // REMOVE ACTIVE/ADD HIDE FROM NON-TARGETS
        document.querySelectorAll('#user-content .nav-content.active').forEach(cont => {
          cont.classList.remove('active');
          cont.classList.add('hide');
        });

        // ADD ACTIVE/REMOVE HIDE TO TARGET
        let target = document.querySelector(`#user-content #${e.target.id}`);
        target.classList.add('active');
        target.classList.remove('hide');
    });
  });
}
