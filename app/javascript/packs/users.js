const { format } = require('rut.js')

const formatRut = (e, rutInput) => {
  formattedValue = format(e.currentTarget.value)
  rutInput.value = formattedValue
}

document.addEventListener('turbolinks:load', () => {  
  rutInput = document.getElementById('user_rut')

  rutInput.addEventListener('keyup', (e) => { formatRut(e, rutInput) })
})