<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Talk</title>
<script type="text/javascript">

function onSubmitForm()
{
	alert("onSubmitForm()");
	  if(document.pressed == 'Sign UP')
	  {
	    document.myform.action ="login.jsp";
		  alert('Sign UP');
	  }
	
	return true;
	 			
}

function validateEmail(email) {
	   var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	   if(reg.test(email) == false) { // if email is not proper then test return false so set true
	      return true;
	   
	   }else
	   {
	      return false;
	   }
	}

function validatePwd(pw,cpw) {
	var invalid = " "; // Invalid character is a space
	var minLength = 6; // Minimum length
	
	// check for a value in both fields.
	
	
	
	if (pw.length < minLength) {
	
		 alert("Your password must be at least 6"); 
		  return true;
		}
		// check for spaces
	else if (pw.indexOf(invalid) > -1) {
		  alert("Sorry, spaces are not allowed."); 
		  return true;
		}
		
		else {
		
				if (pw != cpw)
				{
					alert("Re-enter the same new password twice."); 
					return true;
		}
		else  {
		
				return false;
		      }
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

function doRegistration(){
	var flag=false;
	
	if(validateEmail(document.getElementById("txtuname").value))
	{
		flag=true;
		alert("Please enter correct emailid");
	}
	else if(validatePwd(document.getElementById("txtpassw").value,document.getElementById("txtcpassw").value))
	{
		flag=true;
		alert("Please enter correct password..");
	}
	else if(checkIsBlank(document.getElementById("txtuname").value))
	{
		flag=true;
		alert("Please enter user name..");
		}
	else if(checkIsBlank(document.getElementById("txtfname").value))
	{
		flag=true;
		alert("Please enter first name..");
	}
	else if(checkIsBlank(document.getElementById("txtlname").value))
	{
		flag=true;
		alert("Please enter last name..");
	}
	else if(checkIsBlank(document.getElementById("txtpassw").value))
	{
		flag=true;
		alert("Please enter password..");
	}
	else if(checkIsBlank(document.getElementById("txtcpassw").value))
	{
		flag=true;
		alert("Please enter confirm password..");
	}
	else if(checkIsBlank(document.getElementById("txtuname").value))
	{
		flag=true;
		alert("Please enter user name..");
	}
	else
	{
		flag=false;
		alert("added..");
		document.frmIndex.action ="regiServlet";
		frmIndex.submit();
	}
	
	
}

function AlreadyR()
{
	document.frmIndex.action ="login.jsp";
	frmIndex.submit();
}

</script>
</head>
<body>
<form method="post" name="frmIndex" >
<table width="100%">
          <tr>
            <td colspan="2"><label><strong>New User? Signup</strong></label></td>
          </tr>
          
          <tr>
            <td width="16%"><label>User Name</label></td>
            <td width="27%"><input type="text" name="txtuname" id="txtuname"/></td>
          </tr>
          
           <tr>
            <td><label>Password</label></td>
            <td><input type="password" name="txtpassw" id="txtpassw"/></td>
           
          </tr>
          
          <tr>
            <td><label>Confirm Password</label></td>
            <td><input type="password" name="txtcpassw" id="txtcpassw"/></td>
          
          </tr>
          
          <tr>
            <td>First Name </td>
            <td><input type="text" name="txtfname" id="txtfname"/></td>
           </tr>
          <tr>
            <td>Last Name </td>
            <td><input type="text" name="txtlname" id="txtlname" /></td>
            
          </tr>
         
          
          
          <tr>
            <td><label>Gender</label></td>
            <td style="float:inherit; border:inherit"><label>
              <input name="radiobutton" type="radio" value="Male" />
Male </label>
              <label>
              <input name="radiobutton" type="radio" value="Female" />
Female </label></td>
          
          </tr>
          <tr>
            <td><label>BirthDate</label></td>
            <td><span style="float:inherit; border:inherit">
              <select name="Month" size="1">
                <option>Month</option>
                <option>Jan</option>
                <option>Feb</option>
                <option selected="selected">March</option>
                <option>April</option>
                <option>May</option>
                <option>June</option>
                <option>July</option>
                <option>August</option>
                <option>Sept</option>
                <option>October</option>
                <option>November</option>
                <option>December</option>
              </select>
              <select name="Day" size="1">
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
                <option>6</option>
                <option>7</option>
                <option>8</option>
                <option>9</option>
                <option>10</option>
              </select>
              <select name="Year" size="1">
                <option>1990</option>
                <option>1991</option>
                <option>1992</option>
                <option>1993</option>
                <option>1994</option>
                <option>1995</option>
                <option>1996</option>
                <option>1997</option>
                <option>1998</option>
                <option>1999</option>
                <option>2000</option>
              </select>
            </span></td>
            <td width="27%">&nbsp;</td>
            <td width="30%"><label></label></td>
          </tr>
          
          <tr>
            <td ><input name="btnReg" type="submit" class="btns" id ="btnReg" value="Sign Up" onclick="doRegistration()" /></td>
      <td><a href="javascript:AlreadyR()">Already Registered</a></td>
          </tr>
        </table>
</form> 

</body>
</html>