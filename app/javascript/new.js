window.addEventListener('load', function(){
  const item_price = document.getElementById("item-price");
  const tax_price = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  item_price.addEventListener(`input`,function(){
    price = this.value
    tax_num = price*0.1
    profit_num = price - tax_num
    tax_price.innerHTML = tax_num
    profit.innerHTML = profit_num
  });
})