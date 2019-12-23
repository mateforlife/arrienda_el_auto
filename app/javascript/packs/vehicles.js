var modelSelect = null

function fill_models(e){
  selected_brand = e.target.selectedOptions[0].label
  options = Array.from(modelSelect.querySelectorAll('select#vehicle_vehicle_model_id > optgroup[label="' + selected_brand + '"]'))[0];
  if (options) {
    $('#vehicle_vehicle_model_id').html(options);
    document.getElementById('vehicle_vehicle_model_id').parentElement.hidden = false;
  } else {
    $('#vehicle_vehicle_model_id').empty();
    document.getElementById('vehicle_vehicle_model_id').parentElement.hidden = true;
  }
}

const removeImage = (e) => {
  parent = e.target.parentElement;
  imagesContainer.removeChild(parent)
}

document.addEventListener('turbolinks:load', () => {  
  brandSelect = document.getElementById("vehicle_brand_id");
  if (!modelSelect) {
    modelSelect = document.getElementById("vehicle_vehicle_model_id").cloneNode(true)
  }
  document.getElementById('vehicle_vehicle_model_id').parentElement.hidden = true;
  brandSelect.addEventListener("change", (e) => fill_models(e));

  imagesContainer = document.getElementById('vehicle_images_container');
  destroyLinks = document.getElementsByClassName('destroy-vehicle-image');
  for (let item of destroyLinks) {
    item.addEventListener('click',(e) => { removeImage(e) })
  }
});

// Workaround for displaying selected file
$(document).on('ready turbolinks:load', function() {
  $('.custom-file-input').change(function(){
    $('.custom-file-label').text('')
    var imagesLimit = this.files.length > 5 ? 5 : this.files.length
    for(i = 0; i < imagesLimit; i++ ) {
      $('.custom-file-label').append('<span class="badge badge-light">' + this.files[i].name + '</span>');
    }
    $('.custom-file-label').append(imagesLimit + ' archivos seleccionados');
  });
});