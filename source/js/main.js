'use strict';

import Dialog from './components/dialog';

function bootstrap() {
  var dialogs = document.getElementsByTagName('dialog');

  if (dialogs.length) {
    for (let i = 0; i < dialogs.length; i++) {
      let dialog = dialogs[i];
      let showDialogButton = document.querySelector(`[target=${dialog.id}]`);
      showDialogButton.addEventListener('click', function() {
        dialog.showModal();
      });

      dialog
        .querySelector(`.${dialog.getAttribute('data-close-target')}`)
        .addEventListener('click', function() {
          dialog.close();
        });
    }
  }

  document
    .querySelector('#dialog-show-location')
    .querySelector('.agree')
    .addEventListener('click', function(e) {
      let errElem = document
        .querySelector('#dialog-show-location')
        .querySelector('.errors')
      getGeolocation(errElem);
    })
};

var getGeolocation = function(errElement) {
  errElement.innerHTML = '';
  if ("geolocation" in navigator) {
    navigator.geolocation.getCurrentPosition(function() {
      // Do nothing
    }, function(err) {
      errElement.innerHTML = 'Could not use location service at this time.';
      console.error(err);
    });
  } else {
    errElement.innerHTML = 'Location services are not available for this browser.';
  }
}

bootstrap();
