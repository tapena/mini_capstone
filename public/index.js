var productTemplate = document.querySeclector('#all-product');
var productContainer = document.querySeclector('.row');

axios.get("http://localhost:3000/api/recipes").then(function (response) {

var products = response.data;
console.log(products);

products.forEach(function(product) {
var productClone = productTemplate.content.clodeNode(true);

productClone.querySeclector('.tops').innerText = product.tops;


})

})