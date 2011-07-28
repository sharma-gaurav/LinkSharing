<%@ page import="com.intelligrape.linksharing.User" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="login"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
    <script src="${resource(dir: 'js', file: 'jquery.validate.js')}" type="text/javascript">
    </script>
    %{--<script src="${resource(dir: 'js', file: 'jquery-ui-1.8.14.custom.min.js')}" type="text/javascript">--}%
    %{--  </script>--}%
</head>

<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Login Page</a>
    </span>
</div>

<div class="body">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${userInstance}">
        <div class="errors">
            <g:renderErrors bean="${userInstance}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form action="registerHandler" name="registerForm">
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="userName"><g:message code="user.userName.label" default="User Name"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'userName', 'errors')}">
                        <g:textField name="userName" minlength="5" maxlength="16" value="${userInstance?.userName}"
                                     class="required"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="password"><g:message code="user.password.label" default="Password"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'password', 'errors')}">
                        <g:passwordField name="password" maxlength="16" value="${userInstance?.password}"
                                         minlength="5"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="confirmPassword"><g:message code="user.confirmPassword.label"
                                                                default="Confirm Password"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'confirmPassword', 'errors')}">
                        <g:passwordField name="confirmPassword" maxlength="16"
                                         value="${userInstance?.confirmPassword}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="name"><g:message code="user.name.label" default="Name"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'name', 'errors')}">
                        <g:textField name="name" value="${userInstance?.name}" class="required"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="email"><g:message code="user.email.label" default="Email"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'email', 'errors')}">
                        <g:textField name="email" value="${userInstance?.email}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="address"><g:message code="user.address.label" default="Address"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'address', 'errors')}">
                        <g:textArea cols='30' rows='40' name="address" value="${userInstance?.address}"
                                    class="required"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="phoneNumber"><g:message code="user.phoneNumber.label"
                                                            default="Phone Number"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'phoneNumber', 'errors')}">
                        <g:textField name="phoneNumber"
                                     value="${fieldValue(bean: userInstance, field: 'phoneNumber')}"
                                     maxlength="10" class="required digits"/>
                    </td>
                </tr>

                </tbody>
            </table>
        </div>

        <div class="buttons">
            <span class="button"><g:submitButton name="create" class="save"
                                                 value="${message(code: 'default.button.create.label', default: 'Register')}"/></span>
        </div>

        %{--<div class="demo">--}%

            %{--<p>Date: <input id="datepicker" type="text"></p>--}%

        %{--</div><!-- End demo -->--}%
    </g:form>
</div>
%{--<jq:jquery>--}%
    %{--$("#registerForm").validate({--}%
        %{--rules: {--}%
            %{--password: "required",--}%
            %{--confirmPassword: {--}%
                %{--equalTo:"#password"--}%
            %{--},--}%
            %{--email: {--}%
                %{--required: true,--}%
                %{--email: true,--}%
                %{--remote: "${createLink(controller: 'login', action: 'emailValidate')}"--}%
            %{--}--}%
        %{--},--}%
        %{--messages: {--}%
            %{--userName: {--}%
                %{--required: "You must enter your User Name!",--}%
                %{--minlength: "Your User Name must consist of atleast 5 characters!",--}%
            %{--},--}%
            %{--password: {--}%
                %{--required: "You must enter your Password!",--}%
                %{--minlength: "Your Password must consist of atleast 6 characters!",--}%
            %{--},--}%
            %{--confirmPassword: {--}%
                %{--required: "You must Re-enter Password!",--}%
                %{--minlength: "Your Password must consist of atleast 6 characters!",--}%
            %{--},--}%
            %{--email: {--}%
                %{--required: "You must enter your e-mail!",--}%
                %{--remote: "User with this e-mail address already exist.!"--}%
            %{--},--}%
            %{--address: {--}%
                %{--required: "You must enter your Address!",--}%
            %{--},--}%
            %{--phoneNumber: {--}%
                %{--required: "You must enter your Phone Number!",--}%
            %{--}--}%
        %{--}--}%

    %{--});--}%
    %{--$( "#datepicker" ).datepicker();--}%

%{--</jq:jquery>--}%
</body>
</html>
