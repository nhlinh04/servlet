    var moneyOrder = document.querySelector('#money-order');
    var totalMoney = document.querySelector('#total-money');
    var discount = document.querySelector('#discount');
    var cartItems = JSON.parse(localStorage.getItem("cart"));
    var total = 0;

    function pay() {
    cartItems = JSON.parse(localStorage.getItem("cart")) || [];
    var nameCustomer = document.getElementById('nameCustomer');
    var numberPhone = document.getElementById('numberPhone');
    var address = document.getElementById('address');

    if (nameCustomer.value.trim().length === 0 ||
    numberPhone.value.trim().length === 0 ||
    address.value.trim().length === 0) {
    nameCustomer.classList.add("border-danger");
    address.classList.add("border-danger");
    numberPhone.classList.add("border-danger");
    return;
} else {
    nameCustomer.classList.remove("border-danger");
    address.classList.remove("border-danger");
    numberPhone.classList.remove("border-danger");
}

    if(cartItems.length <= 0){
    alert("Không thể thanh toán hóa đơn này!!!")
    return;
}

    var information = {
    "nameCustomer": nameCustomer.value,
    "numberPhone": numberPhone.value,
    "address": address.value,
    "cartItems": cartItems
}

    console.log(information)
    const options = {
    method: 'POST',
    headers: {
    'Content-Type': 'application/json'
},
    body: JSON.stringify(information)
};

    fetch('/product/pay', options)
    .then(response => {
    if (!response.ok) {
    throw new Error('Network response was not ok');
}
    return response.json(); // Phân tích dữ liệu JSON từ phản hồi
})
    .then(data => {
    window.location.assign(data.url)
})
    .catch(error => {
    console.error('Error during fetch operation:', error);
    // Xử lý lỗi ở đây
});
}

    cartItems.forEach(item => {
    total+= (item.giaBan * item.soLuong);
})
    totalMoney.innerHTML = total + ' đ'
    moneyOrder.innerHTML = total + ' đ'
    discount.innerHTML = 0 + '%'


    document.querySelector('#form').addEventListener('submit', function(event) {
    event.preventDefault(); // Ngăn chặn hành động mặc định của form
    // Thêm mã xử lý validate ở đây
    // Sau khi validate xong, bạn có thể gọi hàm pay() để xử lý logic
    pay();
});