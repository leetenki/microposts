function sendRetweet(form_id) {
  $('#'+form_id).modal('hide');
}

function display(html_id, bottom_form_id) {
  reply_form = document.getElementById(html_id)
  bottom_form = document.getElementById(bottom_form_id)
  bottom_form.innerHTML = reply_form.innerHTML
  bottom_form.style.display = "block"
}

$(document).on('change', '#micropost_image', function() {
    var input = $(this),
        numFiles = input.get(0).files ? input.get(0).files.length : 1,
        label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
    input.trigger('fileselect', [numFiles, label]);
});

$(document).ready( function() {
    $('#micropost_image').on('fileselect', function(event, numFiles, label) {
        document.getElementById("file_uploader").value = label;
    });
});