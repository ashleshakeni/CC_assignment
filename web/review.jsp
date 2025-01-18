<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/index.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/all css/review.css">
    <title>Review Form</title>
</head>
<body>
    <div class="container">
        <h1>We Value Your Review</h1>
        <form action="submitReview.jsp" method="post">
            <!-- Name -->
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required><br><br>

            <!-- Email -->
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br><br>

            <!-- Rating -->
            <label for="rating">Rating (1-5):</label>
            <select id="rating" name="rating" required>
                <option value="">Choose a rating</option>
                <option value="1">1 - Poor</option>
                <option value="2">2 - Fair</option>
                <option value="3">3 - Good</option>
                <option value="4">4 - Very Good</option>
                <option value="5">5 - Excellent</option>
            </select><br><br>

            <!-- Review -->
            <label for="comments">Comments:</label>
            <textarea id="comments" name="comments" rows="4" required></textarea><br><br>

            <!-- Submit Button -->
            <button type="submit">Submit Review</button>
        </form>
            <!-- Back to Home Button -->
        <button class="back-btn" onclick="window.location.href='index.jsp';">Back to Home</button>
    </div>
</body>
</html>
