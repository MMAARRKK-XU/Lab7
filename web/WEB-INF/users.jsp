<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
    </head>
    <body>
        <c:if test="${message != null}">
        <div id="messageBox">
            <p>${message}</p>
        </div>
        </c:if>

        <div class="grid-container">
            <div class="grid-item">
                <div class="formContainer">
                    <h3>Add User</h3>

                    <form method="POST" action="user">
                        <input placeholder="Email" type="email" required name="email" />
                        <br>
                        <input placeholder="First Name" type="text" required name="firstname" />
                        <br>
                        <input placeholder="Last Name" type="text" required name="lastname" />
                        <br>
                        <input placeholder="Password" type="password" required name="password" />
                        <br>
                        <input type="hidden" name="action" value="add" />
                        <select name="role">
                            <option value="1" <c:if test="${user.role.id == 1}">selected</c:if>>System Admin</option>
                            <option value="2" <c:if test="${user.role.id == 2}">selected</c:if>>Regular User</option>
                            <option value="3" <c:if test="${user.role.id == 3}">selected</c:if>>Company Admin</option>
                            </select>
                            <br>
                            <input type="submit" value="Save" />
                        </form>
                    </div>
                </div>

                <div class="grid-item">
                    <h3>Manage Users</h3>
                    <table class="usersTable">
                        <tr>
                            <th>Email</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Role</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>${user.email}</td>
                            <td>${user.firstName}</td>
                            <td>${user.lastName}</td>
                            <td>${user.role.roleName}</td>
                            
                            <c:url value="user" var="editurl">
                            <c:param name="action" value="edit"/>
                            <c:param name="email" value="${user.email}"/>
                            </c:url>
                            <td><a href="${editurl}">Edit</a></td>
                            
                            <c:url value="user" var="deleteurl">
                            <c:param name="action" value="delete"/>
                            <c:param name="email" value="${user.email}"/>
                            </c:url>                     
                            <td><a href="${deleteurl}">Delete</a></td>
                        </tr>

                    </c:forEach>
                </table>
            </div>

            <div class="grid-item">
                <div class="formContainer">
                    <h3>Edit User</h3>
                    <form method="POST" action="user">
                        <input placeholder="First Name" type="text" required name="firstname" value="${fname}" />
                        <br>
                        <input placeholder="Last Name" type="text" required name="lastname" value="${lname}" />
                        <br>
                        <input type="hidden" name="email" value="${em}" />
                        <input type="hidden" name="action" value="update" />
                        <select name="role">
                            <option value="1" <c:if test="${id == 1}">selected</c:if>>System Admin</option>
                            <option value="2" <c:if test="${id == 2}">selected</c:if>>Regular User</option>
                            <option value="3" <c:if test="${id == 3}">selected</c:if>>Company Admin</option>
                        </select>
                        <br>
                        <input type="submit" value="Update" />
                    </form>
                </div>
            </div>  
        </div>
    </body>
</html>