window.addEventListener('load',function(){
  document.addEventListener('keyup', function(){
    const amount = document.getElementById("item-price").value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    addTaxPrice.innerHTML = Math.ceil(amount * 0.1);
    profit.innerHTML = Math.floor(amount * 0.9);
    e.preventDefault();
  })
});