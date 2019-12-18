const calculateFee = () => {
  startDate = Date.parse(startDateInput.value)
  endDate = Date.parse(endDateInput.value)
  if (startDate > endDate) {
    alert('Fecha inicial no puede ser mayor a fecha de termino')
    startDateInput.value = startDateInput.min
    amountField.textContent = amountField.textContent
    amountField.textContent = numberToCurrency(feeValue * daysDiff(Date.parse(startDateInput.value), endDate))
    return
  }
  amountField.textContent = numberToCurrency(feeValue * daysDiff(startDate, endDate))
}

const daysDiff = (startDate, endDate) => {
  return ((endDate - startDate) / (1000*60*60*24)) + 1
}

const numberToCurrency = (number) => {
  return number.toLocaleString('es-CL', { style: 'currency', currency: 'CLP' })
}

const stringToInt = (str) => {
  let numberPattern = /\d+/g
  return parseInt(str.match(numberPattern).join(''))
}

document.addEventListener('turbolinks:load', () => {
  startDateInput = document.getElementById('reservation_start_date')
  endDateInput = document.getElementById('reservation_end_date')
  amountField = document.getElementById('final_amount')
  feeField = document.getElementById('fee_value')
  feeValue = stringToInt(feeField.textContent)
  calculateFee()
  startDateInput.addEventListener('change', () => { calculateFee() })
  endDateInput.addEventListener('change', () => { calculateFee() })
})
