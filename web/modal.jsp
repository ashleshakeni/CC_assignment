<%-- 
    Document   : modal
    Created on : 12 Sept 2024, 1:58:26?pm
    Author     : ashle
--%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/all css/modal.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/all css/profile.css">
<div id="profileModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <div class="profile-header">
            <img src="photos/avatar.png" alt="Profile Picture" class="profile-img">
            <h2><%= session.getAttribute("username") %></h2>
        </div>
        <div class="profile-options">
            <a href="<%= request.getContextPath() %>/logout.jsp">Logout</a>
        </div>
    </div>
</div> 