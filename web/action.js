//
//
//<script>
   // function checkLoginForCart(productId, name, price, imageUrl, size) {//
//        if (!isLoggedIn) {
//            alert("Please login first before adding to cart.");
//            window.location.href = "login.jsp";  // Redirect to login page
//        } else {
//            // Proceed with adding the item to the cart
//            let form = document.createElement("form");
//            form.method = "post";
//            form.action = "<%= request.getContextPath() %>/addtocart.jsp";
//
//            form.innerHTML = `
//                <input type="hidden" name="productId" value="${productId}">
//                <input type="hidden" name="name" value="${name}">
//                <input type="hidden" name="price" value="${price}">
//                <input type="hidden" name="imageUrl" value="${imageUrl}">
//                <input type="hidden" name="size" value="${size}">
//            `;
//            document.body.appendChild(form);
//            form.submit();
//        }
//    }

    function checkLoginForBuy(productId, name, price, imageUrl, size) {//
//        if (!isLoggedIn) {
//            alert("Please login first before making a purchase.");
//            window.location.href = "login.jsp";  // Redirect to login page
//        } else {
//            // Proceed with the purchase
//            let form = document.createElement("form");
//            form.method = "post";
//            form.action = "<%= request.getContextPath() %>/bill.jsp";
//
//            form.innerHTML = `
//                <input type="hidden" name="productId" value="${productId}">
//                <input type="hidden" name="name" value="${name}">
//                <input type="hidden" name="price" value="${price}">
//                <input type="hidden" name="imageUrl" value="${imageUrl}">
//                <input type="hidden" name="size" value="${size}">
//                <input type="hidden" name="quantity" value="1"> <!-- Default quantity is 1 -->
//            `;
//            document.body.appendChild(form);
//            form.submit();
//        }
//    }
// </script>