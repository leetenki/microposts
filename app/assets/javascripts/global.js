function sendRetweet(form_id) {
  $('#'+form_id).modal('hide');
}

function display(html_id, bottom_form_id) {
  reply_form = document.getElementById(html_id)
  bottom_form = document.getElementById(bottom_form_id)
  bottom_form.innerHTML = reply_form.innerHTML
  bottom_form.style.display = "block"
}

