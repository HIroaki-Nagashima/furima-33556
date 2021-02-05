window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  const value_result = inputValue * 0.1
  console.log(value_result)
  addTaxDom.innerHTML = (Math.floor(value_result));
  console.log(addTaxDom);
    const profitDom = document.getElementById("profit")
    profitDom.innerHTML = (Math.floor(inputValue - value_result))
})
});
