<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Talk</title>

<script type="text/javascript">

function validateEmail(email) {
	   var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	   if(reg.test(email) == false) { // if email is not proper then test return false so set true
	      return true;
	   
	   }else
	   {
	      return false;
	   }
	}
	
	
function checkIsBlank(strtxt)
{

	if(strtxt=="")
	{
	 return true;
	}
	else
	{
	return false;
	}
}
function doLogin(){
	var flag=false;
	
	if(validateEmail(document.getElementById("txtuname").value))
	{
		flag=true;
		alert("Please enter correct emailid");
	}
	else if(checkIsBlank(document.getElementById("txtuname").value))
	{
		flag=true;
		alert("Please enter user name..");
		}
	else if(checkIsBlank(document.getElementById("txtpassw").value))
	{
		flag=true;
		alert("Please enter password..");
	}
	else
		{
		
		document.frmLogin.action ="loginServlet";
		frmLogin.submit();
		}
}

</script>

</head>
<body>
<form method="post" name="frmLogin">
<table width="100%">
          <tr>
            <td colspan="2"><label><strong>Alreday Registered User? Signin</strong></label></td>
            
          </tr>
          <tr>
            <td width="16%"><label>User Name</label></td>
            <td width="27%"><input type="text" name="txtuname" id="txtuname" /></td>
            
          </tr>
          
           <tr>
            <td><label>Password</label></td>
            <td><input type="password" name="txtpassw" id="txtpassw"/></td>
           
          </tr>
          
          
          
          <tr>
            <td ><input name="btnlogin" type="submit" class="btns" id ="btnLogin" value="Sign In"  onclick="doLogin();" /></td>
            <td>&nbsp;</td>
            <td width="27%">&nbsp;</td>
            <td width="30%">&nbsp;</td>
          </tr>
        </table>
      
</form> 
</body>
</html>